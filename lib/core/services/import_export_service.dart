import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:lexiflow/core/database/app_database.dart';
import 'package:drift/drift.dart' as drift;
import 'package:archive/archive.dart';
import 'package:file_picker/file_picker.dart';
import 'package:share_plus/share_plus.dart';

class ImportExportService {
  final AppDatabase db;

  ImportExportService(this.db);

  // ============================================
  // ЭКСПОРТ — ТОЛЬКО .lexiflow
  // ============================================

  Future<String> exportToLexiflow(int deckId, {String? customDir}) async {
    final deck = await db.getDeckById(deckId);
    if (deck == null) throw Exception('Колода не найдена');

    final cards = await db.getCardsByDeckId(deckId);
    final archive = Archive();

    // 1. manifest.json
    final manifest = {
      'format_version': '1.0',
      'app': 'LexiFlow',
      'exported_at': DateTime.now().toIso8601String(),
      'platform': Platform.operatingSystem,
    };
    archive.addFile(_createArchiveFile(
      'manifest.json',
      JsonEncoder.withIndent('  ').convert(manifest),
    ));

    // 2. deck.json
    final deckData = {
      'name': deck.name,
      'description': deck.description,
      'source_language': deck.sourceLanguage,
      'target_language': deck.targetLanguage,
      'total_cards': cards.length,
      'exported_at': DateTime.now().toIso8601String(),
    };
    archive.addFile(_createArchiveFile(
      'deck.json',
      JsonEncoder.withIndent('  ').convert(deckData),
    ));

    // 3. cards.json + медиа
    final cardsData = <Map<String, dynamic>>[];

    for (int i = 0; i < cards.length; i++) {
      final card = cards[i];
      final idx = i + 1;

      final cardData = <String, dynamic>{
        'front_text': card.frontText,
        'back_text': card.backText,
        'pronunciation': card.pronunciation,
        'example': card.example,
        'notes': card.notes,
        'front_video_url': card.frontVideoUrl,
        'back_video_url': card.backVideoUrl,
      };

      // Изображения
      if (card.frontImagePath != null && card.frontImagePath!.isNotEmpty) {
        final ext = p.extension(card.frontImagePath!);
        final archivePath = 'images/card_${idx}_front$ext';
        cardData['front_image'] = archivePath;
        await _addMediaToArchive(archive, card.frontImagePath!, archivePath);
      }
      if (card.backImagePath != null && card.backImagePath!.isNotEmpty) {
        final ext = p.extension(card.backImagePath!);
        final archivePath = 'images/card_${idx}_back$ext';
        cardData['back_image'] = archivePath;
        await _addMediaToArchive(archive, card.backImagePath!, archivePath);
      }

      // Аудио
      if (card.frontAudioPath != null && card.frontAudioPath!.isNotEmpty) {
        final ext = p.extension(card.frontAudioPath!);
        final archivePath = 'audio/card_${idx}_front$ext';
        cardData['front_audio'] = archivePath;
        await _addMediaToArchive(archive, card.frontAudioPath!, archivePath);
      }
      if (card.backAudioPath != null && card.backAudioPath!.isNotEmpty) {
        final ext = p.extension(card.backAudioPath!);
        final archivePath = 'audio/card_${idx}_back$ext';
        cardData['back_audio'] = archivePath;
        await _addMediaToArchive(archive, card.backAudioPath!, archivePath);
      }

      // Локальное видео
      if (card.frontVideoUrl != null &&
          card.frontVideoUrl!.isNotEmpty &&
          _isLocalFile(card.frontVideoUrl!)) {
        final ext = p.extension(card.frontVideoUrl!);
        final archivePath = 'videos/card_${idx}_front$ext';
        cardData['front_video_local'] = archivePath;
        cardData['front_video_url'] = null;
        await _addMediaToArchive(archive, card.frontVideoUrl!, archivePath);
      }
      if (card.backVideoUrl != null &&
          card.backVideoUrl!.isNotEmpty &&
          _isLocalFile(card.backVideoUrl!)) {
        final ext = p.extension(card.backVideoUrl!);
        final archivePath = 'videos/card_${idx}_back$ext';
        cardData['back_video_local'] = archivePath;
        cardData['back_video_url'] = null;
        await _addMediaToArchive(archive, card.backVideoUrl!, archivePath);
      }

      cardsData.add(cardData);
    }

    archive.addFile(_createArchiveFile(
      'cards.json',
      JsonEncoder.withIndent('  ').convert(cardsData),
    ));

    // 4. Сохраняем ZIP
    final zipData = ZipEncoder().encode(archive);
    if (zipData == null) throw Exception('Ошибка создания архива');

    // Папка сохранения: customDir или папка приложения
    late Directory exportDir;
    if (customDir != null && customDir.isNotEmpty) {
      exportDir = Directory(customDir);
    } else {
      final appDir = await getApplicationDocumentsDirectory();
      exportDir = Directory(p.join(appDir.path, 'exported_files'));
    }
    if (!await exportDir.exists()) await exportDir.create(recursive: true);

    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final fileName = '${_sanitizeFilename(deck.name)}_$timestamp.lexiflow';
    final file = File(p.join(exportDir.path, fileName));
    await file.writeAsBytes(zipData);

    return file.path;
  }

  // ============================================
  // ШАРИНГ В МЕССЕНДЖЕРЫ
  // ============================================

  static Future<void> shareToMessengers(
    String filePath, {
    String? deckName,
  }) async {
    final name = deckName ?? 'колода';
    await Share.shareXFiles(
      [XFile(filePath)],
      subject: 'LexiFlow — $name',
      text:
          '📚 Делюсь колодой "$name" из приложения LexiFlow!\n\nОткройте файл в LexiFlow чтобы начать учиться.',
    );
  }

  static Future<void> shareText(String text) async {
    await Share.share(text);
  }

  static Future<void> shareCard(CardData card) async {
    final buffer = StringBuffer();
    buffer.writeln('📖 ${card.frontText}');
    buffer.writeln('🔤 ${card.backText}');
    if (card.pronunciation != null && card.pronunciation!.isNotEmpty) {
      buffer.writeln('🔊 ${card.pronunciation}');
    }
    if (card.example != null && card.example!.isNotEmpty) {
      buffer.writeln('💬 ${card.example}');
    }
    buffer.writeln('\n— LexiFlow App');
    await Share.share(buffer.toString());
  }

  // ============================================
  // ИМПОРТ — CSV, JSON, .lexiflow
  // ============================================

  Future<int> importFromCSV(String filePath, String deckName) async {
    final file = File(filePath);
    final content = await file.readAsString(encoding: utf8);
    final lines = content.split('\n');

    if (lines.length < 2) throw Exception('CSV файл пустой или неверный');

    final deckId = await db.createDeck(
      DecksCompanion(
        name: drift.Value(deckName),
        sourceLanguage: drift.Value('en'),
        targetLanguage: drift.Value('ru'),
      ),
    );

    int importedCount = 0;
    for (int i = 1; i < lines.length; i++) {
      final line = lines[i].trim();
      if (line.isEmpty) continue;
      try {
        final card = _parseCSVLine(line, deckId);
        await db.createCard(card);
        importedCount++;
      } catch (e) {
        // пропускаем битые строки
      }
    }
    return importedCount;
  }

  Future<int> importFromJSON(String filePath) async {
    final file = File(filePath);
    final content = await file.readAsString(encoding: utf8);
    final data = json.decode(content) as Map<String, dynamic>;

    final deckData = data['deck'] as Map<String, dynamic>;
    final deckId = await db.createDeck(
      DecksCompanion(
        name: drift.Value(deckData['name'] as String),
        description: drift.Value(deckData['description'] as String?),
        sourceLanguage:
            drift.Value(deckData['source_language'] as String? ?? 'en'),
        targetLanguage:
            drift.Value(deckData['target_language'] as String? ?? 'ru'),
      ),
    );

    final cardsData = data['cards'] as List<dynamic>;
    int importedCount = 0;
    for (final cardData in cardsData) {
      try {
        await db
            .createCard(_jsonToCard(cardData as Map<String, dynamic>, deckId));
        importedCount++;
      } catch (e) {
        // пропускаем битые карточки
      }
    }
    return importedCount;
  }

  Future<int> importFromLexiflow(String filePath) async {
    final file = File(filePath);
    final bytes = await file.readAsBytes();
    final archive = ZipDecoder().decodeBytes(bytes);

    final deckFile = archive.findFile('deck.json');
    if (deckFile == null) throw Exception('Неверный .lexiflow файл');

    final deckData = json.decode(utf8.decode(deckFile.content as List<int>))
        as Map<String, dynamic>;

    final deckId = await db.createDeck(
      DecksCompanion(
        name: drift.Value(deckData['name'] as String),
        description: drift.Value(deckData['description'] as String?),
        sourceLanguage:
            drift.Value(deckData['source_language'] as String? ?? 'en'),
        targetLanguage:
            drift.Value(deckData['target_language'] as String? ?? 'ru'),
      ),
    );

    final cardsFile = archive.findFile('cards.json');
    if (cardsFile == null) throw Exception('Неверный .lexiflow файл');

    final cardsData = json.decode(utf8.decode(cardsFile.content as List<int>))
        as List<dynamic>;

    // Извлекаем медиа
    final mediaDir = await _getMediaImportDirectory();
    for (final archiveFile in archive.files) {
      if (archiveFile.isFile &&
          (archiveFile.name.startsWith('images/') ||
              archiveFile.name.startsWith('audio/') ||
              archiveFile.name.startsWith('videos/'))) {
        final targetPath = p.join(mediaDir.path, archiveFile.name);
        final targetFile = File(targetPath);
        await targetFile.create(recursive: true);
        await targetFile.writeAsBytes(archiveFile.content as List<int>);
      }
    }

    int importedCount = 0;
    for (final cardData in cardsData) {
      try {
        final cardMap = Map<String, dynamic>.from(cardData as Map);

        if (cardMap['front_image'] != null) {
          cardMap['front_image_path'] =
              p.join(mediaDir.path, cardMap['front_image']);
        }
        if (cardMap['back_image'] != null) {
          cardMap['back_image_path'] =
              p.join(mediaDir.path, cardMap['back_image']);
        }
        if (cardMap['front_audio'] != null) {
          cardMap['front_audio_path'] =
              p.join(mediaDir.path, cardMap['front_audio']);
        }
        if (cardMap['back_audio'] != null) {
          cardMap['back_audio_path'] =
              p.join(mediaDir.path, cardMap['back_audio']);
        }
        if (cardMap['front_video_local'] != null) {
          cardMap['front_video_url'] =
              p.join(mediaDir.path, cardMap['front_video_local']);
        }
        if (cardMap['back_video_local'] != null) {
          cardMap['back_video_url'] =
              p.join(mediaDir.path, cardMap['back_video_local']);
        }

        await db.createCard(_jsonToCard(cardMap, deckId));
        importedCount++;
      } catch (e) {
        // пропускаем битые карточки
      }
    }
    return importedCount;
  }

  static Future<String?> pickImportFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv', 'json', 'lexiflow'],
      dialogTitle: 'Выберите файл для импорта',
    );
    return result?.files.single.path;
  }

  // ============================================
  // ВСПОМОГАТЕЛЬНЫЕ МЕТОДЫ
  // ============================================

  bool _isLocalFile(String url) =>
      !url.startsWith('http://') &&
      !url.startsWith('https://') &&
      (url.startsWith('/') || url.contains(':\\') || url.startsWith(r'\'));

  CardsCompanion _parseCSVLine(String line, int deckId) {
    final parts = _splitCSVLine(line);
    if (parts.length < 2) throw Exception('Неверная строка CSV');
    return CardsCompanion(
      deckId: drift.Value(deckId),
      frontText: drift.Value(parts[0]),
      backText: drift.Value(parts[1]),
      pronunciation: drift.Value(
          parts.length > 2 && parts[2].isNotEmpty ? parts[2] : null),
      example: drift.Value(
          parts.length > 3 && parts[3].isNotEmpty ? parts[3] : null),
      notes: drift.Value(
          parts.length > 4 && parts[4].isNotEmpty ? parts[4] : null),
    );
  }

  CardsCompanion _jsonToCard(Map<String, dynamic> data, int deckId) {
    return CardsCompanion(
      deckId: drift.Value(deckId),
      frontText: drift.Value(data['front_text'] as String),
      backText: drift.Value(data['back_text'] as String),
      pronunciation: drift.Value(data['pronunciation'] as String?),
      example: drift.Value(data['example'] as String?),
      notes: drift.Value(data['notes'] as String?),
      frontImagePath: drift.Value(data['front_image_path'] as String?),
      backImagePath: drift.Value(data['back_image_path'] as String?),
      frontAudioPath: drift.Value(data['front_audio_path'] as String?),
      backAudioPath: drift.Value(data['back_audio_path'] as String?),
      frontVideoUrl: drift.Value(data['front_video_url'] as String?),
      backVideoUrl: drift.Value(data['back_video_url'] as String?),
    );
  }

  List<String> _splitCSVLine(String line) {
    final result = <String>[];
    var current = StringBuffer();
    var inQuotes = false;

    for (int i = 0; i < line.length; i++) {
      final char = line[i];
      if (char == '"') {
        if (inQuotes && i + 1 < line.length && line[i + 1] == '"') {
          current.write('"');
          i++;
        } else {
          inQuotes = !inQuotes;
        }
      } else if (char == ',' && !inQuotes) {
        result.add(current.toString());
        current = StringBuffer();
      } else {
        current.write(char);
      }
    }
    result.add(current.toString());
    return result;
  }

  String _sanitizeFilename(String name) =>
      name.replaceAll(RegExp(r'[^\w\s-]'), '').replaceAll(' ', '_');

  ArchiveFile _createArchiveFile(String name, String content) {
    final bytes = utf8.encode(content);
    return ArchiveFile(name, bytes.length, bytes);
  }

  Future<void> _addMediaToArchive(
      Archive archive, String sourcePath, String archivePath) async {
    try {
      final file = File(sourcePath);
      if (await file.exists()) {
        final bytes = await file.readAsBytes();
        archive.addFile(ArchiveFile(archivePath, bytes.length, bytes));
      }
    } catch (e) {
      // файл недоступен — пропускаем
    }
  }

  Future<Directory> _getMediaImportDirectory() async {
    final appDir = await getApplicationDocumentsDirectory();
    final mediaDir = Directory(p.join(appDir.path, 'imported_media'));
    if (!await mediaDir.exists()) await mediaDir.create(recursive: true);
    return mediaDir;
  }
}

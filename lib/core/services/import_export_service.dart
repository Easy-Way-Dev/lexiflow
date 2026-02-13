import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:lexiflow/core/database/app_database.dart';
import 'package:drift/drift.dart' as drift;
import 'package:archive/archive.dart';
import 'package:file_picker/file_picker.dart';
import 'package:share_plus/share_plus.dart';

/// Сервис импорта и экспорта карточек
class ImportExportService {
  final AppDatabase db;

  ImportExportService(this.db);

  // ============================================
  // ЭКСПОРТ
  // ============================================

  /// Экспорт колоды в CSV
  Future<String> exportToCSV(int deckId) async {
    final deck = await db.getDeckById(deckId);
    if (deck == null) throw Exception('Deck not found');

    final cards = await db.getCardsByDeckId(deckId);

    // CSV заголовок
    final csvLines = <String>[
      'front_text,back_text,pronunciation,example,notes,front_image_path,back_image_path,front_audio_path,back_audio_path',
    ];

    // Добавляем карточки
    for (final card in cards) {
      csvLines.add(_cardToCSVLine(card));
    }

    final csvContent = csvLines.join('\n');

    // Сохраняем файл
    final dir = await getApplicationDocumentsDirectory();
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final fileName = '${_sanitizeFilename(deck.name)}_$timestamp.csv';
    final file = File(p.join(dir.path, fileName));
    await file.writeAsString(csvContent, encoding: utf8);

    return file.path;
  }

  /// Экспорт колоды в JSON
  Future<String> exportToJSON(int deckId) async {
    final deck = await db.getDeckById(deckId);
    if (deck == null) throw Exception('Deck not found');

    final cards = await db.getCardsByDeckId(deckId);

    final jsonData = {
      'deck': {
        'name': deck.name,
        'description': deck.description,
        'source_language': deck.sourceLanguage,
        'target_language': deck.targetLanguage,
        'exported_at': DateTime.now().toIso8601String(),
        'app': 'LexiFlow',
        'version': '1.0',
      },
      'cards': cards.map((card) => _cardToJSON(card)).toList(),
    };

    final jsonContent = JsonEncoder.withIndent('  ').convert(jsonData);

    // Сохраняем файл
    final dir = await getApplicationDocumentsDirectory();
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final fileName = '${_sanitizeFilename(deck.name)}_$timestamp.json';
    final file = File(p.join(dir.path, fileName));
    await file.writeAsString(jsonContent, encoding: utf8);

    return file.path;
  }

  /// Экспорт колоды в .lexiflow (ZIP с медиа)
  Future<String> exportToLexiflow(int deckId) async {
    final deck = await db.getDeckById(deckId);
    if (deck == null) throw Exception('Deck not found');

    final cards = await db.getCardsByDeckId(deckId);

    // Создаём архив
    final archive = Archive();

    // 1. Добавляем manifest.json
    final manifest = {
      'format_version': '1.0',
      'app': 'LexiFlow',
      'exported_at': DateTime.now().toIso8601String(),
    };
    archive.addFile(_createArchiveFile(
      'manifest.json',
      JsonEncoder.withIndent('  ').convert(manifest),
    ));

    // 2. Добавляем deck.json
    final deckData = {
      'name': deck.name,
      'description': deck.description,
      'source_language': deck.sourceLanguage,
      'target_language': deck.targetLanguage,
      'total_cards': cards.length,
    };
    archive.addFile(_createArchiveFile(
      'deck.json',
      JsonEncoder.withIndent('  ').convert(deckData),
    ));

    // 3. Собираем карточки и пути к медиа
    final cardsData = <Map<String, dynamic>>[];
    final mediaFiles = <String>{};

    for (int i = 0; i < cards.length; i++) {
      final card = cards[i];
      final cardData = _cardToJSON(card);

      // Переименовываем пути к медиа для архива
      if (card.frontImagePath != null && card.frontImagePath!.isNotEmpty) {
        final newPath =
            'images/card_${i + 1}_front${p.extension(card.frontImagePath!)}';
        cardData['front_image'] = newPath;
        mediaFiles.add(card.frontImagePath!);
      }

      if (card.backImagePath != null && card.backImagePath!.isNotEmpty) {
        final newPath =
            'images/card_${i + 1}_back${p.extension(card.backImagePath!)}';
        cardData['back_image'] = newPath;
        mediaFiles.add(card.backImagePath!);
      }

      if (card.frontAudioPath != null && card.frontAudioPath!.isNotEmpty) {
        final newPath =
            'audio/card_${i + 1}_front${p.extension(card.frontAudioPath!)}';
        cardData['front_audio'] = newPath;
        mediaFiles.add(card.frontAudioPath!);
      }

      if (card.backAudioPath != null && card.backAudioPath!.isNotEmpty) {
        final newPath =
            'audio/card_${i + 1}_back${p.extension(card.backAudioPath!)}';
        cardData['back_audio'] = newPath;
        mediaFiles.add(card.backAudioPath!);
      }

      cardsData.add(cardData);
    }

    // 4. Добавляем cards.json
    archive.addFile(_createArchiveFile(
      'cards.json',
      JsonEncoder.withIndent('  ').convert(cardsData),
    ));

    // 5. Добавляем медиа файлы
    int imageIndex = 1;
    int audioIndex = 1;

    for (final card in cards) {
      if (card.frontImagePath != null) {
        await _addMediaToArchive(
          archive,
          card.frontImagePath!,
          'images/card_${imageIndex}_front${p.extension(card.frontImagePath!)}',
        );
      }
      if (card.backImagePath != null) {
        await _addMediaToArchive(
          archive,
          card.backImagePath!,
          'images/card_${imageIndex}_back${p.extension(card.backImagePath!)}',
        );
      }
      if (card.frontAudioPath != null) {
        await _addMediaToArchive(
          archive,
          card.frontAudioPath!,
          'audio/card_${audioIndex}_front${p.extension(card.frontAudioPath!)}',
        );
      }
      if (card.backAudioPath != null) {
        await _addMediaToArchive(
          archive,
          card.backAudioPath!,
          'audio/card_${audioIndex}_back${p.extension(card.backAudioPath!)}',
        );
      }
      imageIndex++;
      audioIndex++;
    }

    // 6. Сохраняем ZIP
    final zipData = ZipEncoder().encode(archive);
    if (zipData == null) throw Exception('Failed to create archive');

    final dir = await getApplicationDocumentsDirectory();
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final fileName = '${_sanitizeFilename(deck.name)}_$timestamp.lexiflow';
    final file = File(p.join(dir.path, fileName));
    await file.writeAsBytes(zipData);

    return file.path;
  }

  // ============================================
  // ИМПОРТ
  // ============================================

  /// Импорт из CSV
  Future<int> importFromCSV(String filePath, String deckName) async {
    final file = File(filePath);
    final content = await file.readAsString(encoding: utf8);
    final lines = content.split('\n');

    if (lines.isEmpty || lines.length < 2) {
      throw Exception('CSV file is empty or invalid');
    }

    // Создаём колоду
    final deckId = await db.createDeck(
      DecksCompanion(
        name: drift.Value(deckName),
        sourceLanguage: drift.Value('en'),
        targetLanguage: drift.Value('ru'),
      ),
    );

    // Пропускаем заголовок
    int importedCount = 0;

    for (int i = 1; i < lines.length; i++) {
      final line = lines[i].trim();
      if (line.isEmpty) continue;

      try {
        final card = _parseCSVLine(line, deckId);
        await db.createCard(card);
        importedCount++;
      } catch (e) {
        print('Error parsing line $i: $e');
      }
    }

    return importedCount;
  }

  /// Импорт из JSON
  Future<int> importFromJSON(String filePath) async {
    final file = File(filePath);
    final content = await file.readAsString(encoding: utf8);
    final data = json.decode(content) as Map<String, dynamic>;

    // Создаём колоду
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

    // Импортируем карточки
    final cardsData = data['cards'] as List<dynamic>;
    int importedCount = 0;

    for (final cardData in cardsData) {
      try {
        final card = _jsonToCard(cardData as Map<String, dynamic>, deckId);
        await db.createCard(card);
        importedCount++;
      } catch (e) {
        print('Error importing card: $e');
      }
    }

    return importedCount;
  }

  /// Импорт из .lexiflow
  Future<int> importFromLexiflow(String filePath) async {
    final file = File(filePath);
    final bytes = await file.readAsBytes();
    final archive = ZipDecoder().decodeBytes(bytes);

    // Читаем deck.json
    final deckFile = archive.findFile('deck.json');
    if (deckFile == null)
      throw Exception('Invalid .lexiflow file: missing deck.json');

    final deckJson = utf8.decode(deckFile.content as List<int>);
    final deckData = json.decode(deckJson) as Map<String, dynamic>;

    // Создаём колоду
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

    // Читаем cards.json
    final cardsFile = archive.findFile('cards.json');
    if (cardsFile == null)
      throw Exception('Invalid .lexiflow file: missing cards.json');

    final cardsJson = utf8.decode(cardsFile.content as List<int>);
    final cardsData = json.decode(cardsJson) as List<dynamic>;

    // Извлекаем медиа файлы
    final mediaDir = await _getMediaImportDirectory();

    for (final archiveFile in archive.files) {
      if (archiveFile.isFile &&
          (archiveFile.name.startsWith('images/') ||
              archiveFile.name.startsWith('audio/'))) {
        final targetPath = p.join(mediaDir.path, archiveFile.name);
        final targetFile = File(targetPath);
        await targetFile.create(recursive: true);
        await targetFile.writeAsBytes(archiveFile.content as List<int>);
      }
    }

    // Импортируем карточки
    int importedCount = 0;

    for (final cardData in cardsData) {
      try {
        final cardMap = cardData as Map<String, dynamic>;

        // Обновляем пути к медиа
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

        final card = _jsonToCard(cardMap, deckId);
        await db.createCard(card);
        importedCount++;
      } catch (e) {
        print('Error importing card: $e');
      }
    }

    return importedCount;
  }

  /// Выбрать файл для импорта
  static Future<String?> pickImportFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv', 'json', 'lexiflow'],
    );

    return result?.files.single.path;
  }

  /// Поделиться файлом экспорта
  static Future<void> shareFile(String filePath) async {
    await Share.shareXFiles([XFile(filePath)]);
  }

  // ============================================
  // ВСПОМОГАТЕЛЬНЫЕ МЕТОДЫ
  // ============================================

  String _cardToCSVLine(CardData card) {
    return [
      _escapeCSV(card.frontText),
      _escapeCSV(card.backText),
      _escapeCSV(card.pronunciation ?? ''),
      _escapeCSV(card.example ?? ''),
      _escapeCSV(card.notes ?? ''),
      _escapeCSV(card.frontImagePath ?? ''),
      _escapeCSV(card.backImagePath ?? ''),
      _escapeCSV(card.frontAudioPath ?? ''),
      _escapeCSV(card.backAudioPath ?? ''),
    ].join(',');
  }

  Map<String, dynamic> _cardToJSON(CardData card) {
    return {
      'front_text': card.frontText,
      'back_text': card.backText,
      'pronunciation': card.pronunciation,
      'example': card.example,
      'notes': card.notes,
    };
  }

  CardsCompanion _parseCSVLine(String line, int deckId) {
    final parts = _splitCSVLine(line);
    if (parts.length < 2) throw Exception('Invalid CSV line');

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
    );
  }

  String _escapeCSV(String value) {
    if (value.contains(',') || value.contains('"') || value.contains('\n')) {
      return '"${value.replaceAll('"', '""')}"';
    }
    return value;
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

  String _sanitizeFilename(String name) {
    return name.replaceAll(RegExp(r'[^\w\s-]'), '').replaceAll(' ', '_');
  }

  ArchiveFile _createArchiveFile(String name, String content) {
    final bytes = utf8.encode(content);
    return ArchiveFile(name, bytes.length, bytes);
  }

  Future<void> _addMediaToArchive(
      Archive archive, String sourcePath, String archivePath) async {
    final file = File(sourcePath);
    if (await file.exists()) {
      final bytes = await file.readAsBytes();
      archive.addFile(ArchiveFile(archivePath, bytes.length, bytes));
    }
  }

  Future<Directory> _getMediaImportDirectory() async {
    final appDir = await getApplicationDocumentsDirectory();
    final mediaDir = Directory(p.join(appDir.path, 'imported_media'));
    if (!await mediaDir.exists()) {
      await mediaDir.create(recursive: true);
    }
    return mediaDir;
  }
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lexiflow/core/database/app_database.dart';
import 'package:lexiflow/core/services/import_export_service.dart';
import 'package:lexiflow/features/cards/presentation/screens/import_screen.dart';
import 'package:drift/drift.dart' as drift;
import 'package:lexiflow/features/cards/presentation/screens/cards_list_screen.dart';
import 'package:lexiflow/main.dart';
import 'package:file_picker/file_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path_provider/path_provider.dart';

// ===== ТРАНСЛИТЕРАЦИЯ КИРИЛЛИЦЫ В ЛАТИНИЦУ =====
String _transliterate(String text) {
  const map = {
    // Русский
    'а': 'a', 'б': 'b', 'в': 'v', 'г': 'g', 'д': 'd', 'е': 'e', 'ё': 'yo',
    'ж': 'zh', 'з': 'z', 'и': 'i', 'й': 'y', 'к': 'k', 'л': 'l', 'м': 'm',
    'н': 'n', 'о': 'o', 'п': 'p', 'р': 'r', 'с': 's', 'т': 't', 'у': 'u',
    'ф': 'f', 'х': 'h', 'ц': 'ts', 'ч': 'ch', 'ш': 'sh', 'щ': 'sch',
    'ъ': '', 'ы': 'y', 'ь': '', 'э': 'e', 'ю': 'yu', 'я': 'ya',
    'А': 'A', 'Б': 'B', 'В': 'V', 'Г': 'G', 'Д': 'D', 'Е': 'E', 'Ё': 'Yo',
    'Ж': 'Zh', 'З': 'Z', 'И': 'I', 'Й': 'Y', 'К': 'K', 'Л': 'L', 'М': 'M',
    'Н': 'N', 'О': 'O', 'П': 'P', 'Р': 'R', 'С': 'S', 'Т': 'T', 'У': 'U',
    'Ф': 'F', 'Х': 'H', 'Ц': 'Ts', 'Ч': 'Ch', 'Ш': 'Sh', 'Щ': 'Sch',
    'Ъ': '', 'Ы': 'Y', 'Ь': '', 'Э': 'E', 'Ю': 'Yu', 'Я': 'Ya',
    // Украинский
    'і': 'i', 'ї': 'yi', 'є': 'ye', 'ґ': 'g',
    'І': 'I', 'Ї': 'Yi', 'Є': 'Ye', 'Ґ': 'G',
    // Пробелы и дефисы
    ' ': '_', '-': '_',
  };

  return text
      .split('')
      .map((c) => map[c] ?? c)
      .join('')
      .replaceAll(RegExp(r'[^\w._-]'), '');
}

class DecksScreen extends StatefulWidget {
  final AppDatabase db;
  const DecksScreen({super.key, required this.db});

  @override
  State<DecksScreen> createState() => _DecksScreenState();
}

class _DecksScreenState extends State<DecksScreen> {
  List<Deck> _decks = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadDecks();
    _fixLegacyLanguageCodes();
  }

  Future<void> _loadDecks() async {
    setState(() => _isLoading = true);
    try {
      final decks = await widget.db.getAllDecks();
      setState(() {
        _decks = decks;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        final l = AppLocalizations.of(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l.errorLoading(e.toString()))),
        );
      }
    }
  }

  Future<void> _fixLegacyLanguageCodes() async {
    try {
      final legacyDecks = await (widget.db.select(widget.db.decks)
            ..where((t) =>
                t.sourceLanguage.equals('en') | t.targetLanguage.equals('en')))
          .get();

      if (legacyDecks.isEmpty) return;

      for (final deck in legacyDecks) {
        await widget.db.into(widget.db.decks).insertOnConflictUpdate(
              deck.toCompanion(true).copyWith(
                    sourceLanguage: drift.Value(deck.sourceLanguage == 'en'
                        ? 'en-US'
                        : deck.sourceLanguage),
                    targetLanguage: drift.Value(deck.targetLanguage == 'en'
                        ? 'en-US'
                        : deck.targetLanguage),
                  ),
            );
      }
      _loadDecks();
    } catch (e) {
      debugPrint('Migration error: $e');
    }
  }

  Future<void> _showDeckDialog({Deck? deckToEdit}) async {
    final l = AppLocalizations.of(context);
    final isEditing = deckToEdit != null;

    final nameController =
        TextEditingController(text: isEditing ? deckToEdit.name : '');
    final descController = TextEditingController(
        text: isEditing ? (deckToEdit.description ?? '') : '');

    const sourceLanguages = [
      'en-GB',
      'en-US',
      'en-CA',
      'en',
      'es',
      'fr',
      'de',
      'it'
    ];
    const targetLanguages = ['ru', 'en-US', 'en', 'uk'];

    String sourceLang = isEditing ? deckToEdit.sourceLanguage : 'en-US';
    if (!sourceLanguages.contains(sourceLang)) sourceLang = 'en-US';

    String targetLang = isEditing ? deckToEdit.targetLanguage : 'ru';
    if (!targetLanguages.contains(targetLang)) targetLang = 'ru';

    final result = await showDialog<bool>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: Text(isEditing ? l.editDeck : l.createDeckTitle),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: l.deckNameLabel,
                    hintText: l.deckNameHint,
                    border: const OutlineInputBorder(),
                  ),
                  autofocus: true,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: descController,
                  decoration: InputDecoration(
                    labelText: l.deckDescriptionLabel,
                    border: const OutlineInputBorder(),
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: sourceLang,
                  decoration: InputDecoration(
                      labelText: l.studyLanguageLabel,
                      border: const OutlineInputBorder()),
                  items: const [
                    DropdownMenuItem(value: 'en', child: Text('🇺🇸 English')),
                    DropdownMenuItem(
                        value: 'en-GB', child: Text('🇬🇧 English (UK)')),
                    DropdownMenuItem(
                        value: 'en-US', child: Text('🇺🇸 English (US)')),
                    DropdownMenuItem(
                        value: 'en-CA', child: Text('🇨🇦 English (Canada)')),
                    DropdownMenuItem(value: 'es', child: Text('🇪🇸 Español')),
                    DropdownMenuItem(value: 'fr', child: Text('🇫🇷 Français')),
                    DropdownMenuItem(value: 'de', child: Text('🇩🇪 Deutsch')),
                    DropdownMenuItem(value: 'it', child: Text('🇮🇹 Italiano')),
                  ],
                  onChanged: (v) =>
                      v != null ? setDialogState(() => sourceLang = v) : null,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: targetLang,
                  decoration: InputDecoration(
                      labelText: l.nativeLanguageLabel,
                      border: const OutlineInputBorder()),
                  items: const [
                    DropdownMenuItem(value: 'ru', child: Text('🇷🇺 Русский')),
                    DropdownMenuItem(
                        value: 'en-US', child: Text('🇺🇸 English (US)')),
                    DropdownMenuItem(value: 'en', child: Text('🇺🇸 English')),
                    DropdownMenuItem(
                        value: 'uk', child: Text('🇺🇦 Українська')),
                  ],
                  onChanged: (v) =>
                      v != null ? setDialogState(() => targetLang = v) : null,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text(l.cancel)),
            FilledButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text(isEditing ? l.save : l.create)),
          ],
        ),
      ),
    );

    if (result == true && nameController.text.isNotEmpty) {
      final companion = DecksCompanion(
        id: isEditing ? drift.Value(deckToEdit.id) : const drift.Value.absent(),
        name: drift.Value(nameController.text.trim()),
        description: drift.Value(descController.text.trim().isEmpty
            ? null
            : descController.text.trim()),
        sourceLanguage: drift.Value(sourceLang),
        targetLanguage: drift.Value(targetLang),
        createdAt: isEditing
            ? drift.Value(deckToEdit.createdAt)
            : drift.Value(DateTime.now()),
      );
      await widget.db.into(widget.db.decks).insertOnConflictUpdate(companion);
      _loadDecks();
    }
  }

  Future<void> _deleteDeck(Deck deck) async {
    final l = AppLocalizations.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l.deleteDeckTitle),
        content: Text(l.deleteDeckContent(deck.name)),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(l.cancel)),
          FilledButton(
              onPressed: () => Navigator.pop(context, true),
              style: FilledButton.styleFrom(backgroundColor: Colors.red),
              child: Text(l.delete)),
        ],
      ),
    );
    if (confirmed == true) {
      await widget.db.deleteDeck(deck.id);
      _loadDecks();
    }
  }

  Future<void> _exportDeck(Deck deck) async {
    final l = AppLocalizations.of(context);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(children: [
            const SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(
                    strokeWidth: 2, color: Colors.white)),
            const SizedBox(width: 12),
            Text(l.exportCreating(deck.name)),
          ]),
          duration: const Duration(seconds: 30),
          backgroundColor: Colors.blue[700],
        ),
      );
    }

    try {
      final service = ImportExportService(widget.db);
      final filePath = await service.exportToLexiflow(deck.id);

      if (!mounted) return;
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      await _showExportDialog(deck, filePath);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(l.exportError(e.toString())),
            backgroundColor: Colors.red));
      }
    }
  }

  Future<void> _showExportDialog(Deck deck, String filePath) async {
    final l = AppLocalizations.of(context);
    final pathController = TextEditingController(text: filePath);

    await showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: Row(children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 32),
            const SizedBox(width: 12),
            Text(l.exportReady),
          ]),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('📦 ${deck.name}.lexiflow',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 6),
                Text('${l.totalCards}: ${deck.totalCards}',
                    style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                const SizedBox(height: 20),
                Text(l.shareWith,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 15)),
                const SizedBox(height: 16),

                // ===== 6 КРУПНЫХ КНОПОК С ПРЯМЫМИ ССЫЛКАМИ =====
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: _buildBigShareButton(
                            emoji: '✈️',
                            label: 'Telegram',
                            color: const Color(0xFF0088CC),
                            onTap: () => _shareToTelegram(filePath),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildBigShareButton(
                            emoji: '💬',
                            label: 'WhatsApp',
                            color: const Color(0xFF25D366),
                            onTap: () => _shareToWhatsApp(filePath),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildBigShareButton(
                            emoji: '📘',
                            label: 'Facebook',
                            color: const Color(0xFF1877F2),
                            onTap: () => _shareToFacebook(filePath),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: _buildBigShareButton(
                            emoji: '📧',
                            label: 'Email',
                            color: const Color(0xFFEA4335),
                            onTap: () => _shareToEmail(filePath, deck.name),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildBigShareButton(
                            emoji: '💾',
                            label: 'Discord',
                            color: const Color(0xFF5865F2),
                            onTap: () => _shareToDiscord(filePath),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildBigShareButton(
                            emoji: '📤',
                            label: l.share,
                            color: const Color(0xFF757575),
                            onTap: () => _shareToApp(filePath, deck.name),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // ===== ПУТЬ К ФАЙЛУ + КНОПКА ОБЗОР =====
                Text('Путь к файлу:',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[700])),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: pathController,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          prefixIcon: const Icon(Icons.folder, size: 18),
                        ),
                        style: const TextStyle(fontSize: 12),
                        readOnly: true,
                      ),
                    ),
                    const SizedBox(width: 8),
                    OutlinedButton.icon(
                      onPressed: () async {
                        final newPath =
                            await _pickSaveLocation(deck.name, filePath);
                        if (newPath != null) {
                          setDialogState(() => pathController.text = newPath);
                        }
                      },
                      icon: const Icon(Icons.folder_open, size: 18),
                      label: const Text('Обзор'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context), child: Text(l.close)),
          ],
        ),
      ),
    );
  }

  // ===== ПОЛУЧИТЬ ПАПКУ DOWNLOADS =====
  Future<String> _getDownloadsPath() async {
    if (Platform.isWindows) {
      return '${Platform.environment['USERPROFILE']}\\Downloads';
    } else if (Platform.isAndroid) {
      final dir = await getExternalStorageDirectory();
      return dir?.path ?? '/storage/emulated/0/Download';
    } else if (Platform.isIOS || Platform.isMacOS) {
      final dir = await getApplicationDocumentsDirectory();
      return dir.path;
    } else {
      return Platform.environment['HOME'] ?? '/tmp';
    }
  }

  // ===== КНОПКА ОБЗОР - ВЫБОР ПАПКИ =====
  Future<String?> _pickSaveLocation(String deckName, String currentPath) async {
    try {
      final downloadsPath = await _getDownloadsPath();
      final transliteratedName = _transliterate(deckName);

      final result = await FilePicker.platform.saveFile(
        dialogTitle: 'Сохранить как',
        initialDirectory: downloadsPath,
        fileName: '$transliteratedName.lexiflow',
        allowedExtensions: ['lexiflow'],
        type: FileType.custom,
      );

      if (result != null) {
        await File(currentPath).copy(result);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('✅ Файл сохранён: $result'),
              backgroundColor: Colors.green,
            ),
          );
        }
        return result;
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ошибка сохранения: $e')),
        );
      }
    }
    return null;
  }

  // ===== КРУПНАЯ КНОПКА СОЦСЕТИ =====
  Widget _buildBigShareButton({
    required String emoji,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: 72,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color.withValues(alpha: 0.3), width: 1.5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(emoji, style: const TextStyle(fontSize: 28)),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ===== ПРЯМЫЕ ССЫЛКИ НА ПРИЛОЖЕНИЯ (КРОССПЛАТФОРМЕННО) =====
  Future<void> _shareToTelegram(String filePath) async {
    try {
      final uri = Uri.parse('tg://msg');
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Откройте Telegram и отправьте файл вручную')),
          );
        }
      } else {
        _shareToApp(filePath, '');
      }
    } catch (e) {
      _shareToApp(filePath, '');
    }
  }

  Future<void> _shareToWhatsApp(String filePath) async {
    try {
      final uri = Uri.parse('whatsapp://send');
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        _shareToApp(filePath, '');
      }
    } catch (e) {
      _shareToApp(filePath, '');
    }
  }

  Future<void> _shareToFacebook(String filePath) async {
    try {
      final uri = Uri.parse('fb://');
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        _shareToApp(filePath, '');
      }
    } catch (e) {
      _shareToApp(filePath, '');
    }
  }

  Future<void> _shareToEmail(String filePath, String deckName) async {
    try {
      final uri = Uri(
        scheme: 'mailto',
        queryParameters: {
          'subject': 'LexiFlow: $deckName',
          'body': 'Файл колоды: ${filePath.split(Platform.pathSeparator).last}',
        },
      );
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        _shareToApp(filePath, deckName);
      }
    } catch (e) {
      _shareToApp(filePath, deckName);
    }
  }

  Future<void> _shareToDiscord(String filePath) async {
    try {
      final uri = Uri.parse('discord://');
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        _shareToApp(filePath, '');
      }
    } catch (e) {
      _shareToApp(filePath, '');
    }
  }

  // ===== ОБЩИЙ ШАРИНГ (ЧЕРЕЗ СИСТЕМНЫЙ ДИАЛОГ) =====
  Future<void> _shareToApp(String filePath, String deckName) async {
    try {
      await ImportExportService.shareToMessengers(filePath, deckName: deckName);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content:
                Text(AppLocalizations.of(context).errorGeneric(e.toString()))));
      }
    }
  }

  void _showLanguageSettings() async {
    final l = AppLocalizations.of(context);
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l.settingsLanguage),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildLangOption('ru', '🇷🇺', 'Русский'),
            _buildLangOption('en', '🇺🇸', 'English (US)'),
            _buildLangOption('uk', '🇺🇦', 'Українська'),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context), child: Text(l.close)),
        ],
      ),
    );
  }

  Widget _buildLangOption(String code, String flag, String name) {
    final current = LexiFlowApp.localeNotifier.value.languageCode;
    final isSelected = current == code;
    return ListTile(
      leading: Text(flag, style: const TextStyle(fontSize: 28)),
      title: Text(name),
      trailing: isSelected
          ? Icon(Icons.check_circle,
              color: Theme.of(context).colorScheme.primary)
          : null,
      selected: isSelected,
      onTap: () async {
        await widget.db.setSetting('app_locale', code);
        LexiFlowApp.setLocale(Locale(code));
        if (mounted) Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(l.decksTitle),
        actions: [
          IconButton(
              icon: const Icon(Icons.language),
              onPressed: _showLanguageSettings,
              tooltip: l.settingsLanguage),
          IconButton(
              icon: const Icon(Icons.file_download),
              onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ImportScreen(db: widget.db)))
                  .then((_) => _loadDecks()),
              tooltip: l.importButton),
          IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: _loadDecks,
              tooltip: l.refresh),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _decks.isEmpty
              ? _buildEmptyState(l)
              : ListView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
                  itemCount: _decks.length,
                  itemBuilder: (context, index) =>
                      _buildDeckCard(_decks[index]),
                ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showDeckDialog(),
        icon: const Icon(Icons.add),
        label: Text(l.newDeck),
      ),
    );
  }

  Widget _buildEmptyState(AppLocalizations l) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.folder_open, size: 80, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(l.noDecks,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: Colors.grey[600])),
          const SizedBox(height: 8),
          Text(l.noDecksSubtitle, style: TextStyle(color: Colors.grey[500])),
          const SizedBox(height: 24),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              FilledButton.icon(
                  onPressed: () => _showDeckDialog(),
                  icon: const Icon(Icons.add),
                  label: Text(l.createDeck)),
              OutlinedButton.icon(
                  onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ImportScreen(db: widget.db)))
                      .then((_) => _loadDecks()),
                  icon: const Icon(Icons.file_download),
                  label: Text(l.importButton)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDeckCard(Deck deck) {
    final l = AppLocalizations.of(context);
    final progress =
        deck.totalCards > 0 ? deck.masteredCards / deck.totalCards : 0.0;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CardsListScreen(
                    db: widget.db,
                    deckId: deck.id,
                    deckName: deck.name))).then((_) => _loadDecks()),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(deck.name,
                            style: Theme.of(context).textTheme.titleLarge),
                        if (deck.description != null &&
                            deck.description!.isNotEmpty)
                          Text(deck.description!,
                              style: TextStyle(
                                  color: Colors.grey[600], fontSize: 13)),
                      ],
                    ),
                  ),
                  IconButton(
                      icon: const Icon(Icons.share, color: Colors.blue),
                      onPressed: () => _exportDeck(deck),
                      tooltip: l.exportShare),
                  PopupMenuButton<String>(
                    icon: const Icon(Icons.more_vert),
                    onSelected: (val) {
                      if (val == 'export') _exportDeck(deck);
                      if (val == 'edit') _showDeckDialog(deckToEdit: deck);
                      if (val == 'delete') _deleteDeck(deck);
                    },
                    itemBuilder: (context) => [
                      PopupMenuItem(
                          value: 'export',
                          child: Row(children: [
                            const Icon(Icons.ios_share,
                                color: Colors.blue, size: 18),
                            const SizedBox(width: 8),
                            Text(l.exportShare)
                          ])),
                      PopupMenuItem(
                          value: 'edit',
                          child: Row(children: [
                            const Icon(Icons.edit,
                                color: Colors.orange, size: 18),
                            const SizedBox(width: 8),
                            Text(l.edit)
                          ])),
                      PopupMenuItem(
                          value: 'delete',
                          child: Row(children: [
                            const Icon(Icons.delete,
                                color: Colors.red, size: 18),
                            const SizedBox(width: 8),
                            Text(l.delete,
                                style: const TextStyle(color: Colors.red))
                          ])),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  _buildLangChip(deck.sourceLanguage),
                  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(Icons.arrow_forward, size: 16)),
                  _buildLangChip(deck.targetLanguage),
                  const Spacer(),
                  Text('${deck.totalCards} ${l.cards}',
                      style: const TextStyle(fontSize: 13)),
                ],
              ),
              const SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(l.progress, style: const TextStyle(fontSize: 12)),
                      Text(
                          '${deck.masteredCards}/${deck.totalCards} (${(progress * 100).toStringAsFixed(0)}%)',
                          style: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  LinearProgressIndicator(
                      value: progress,
                      backgroundColor: Colors.grey[200],
                      borderRadius: BorderRadius.circular(4)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLangChip(String langCode) {
    final langNames = {
      'en-GB': 'EN 🇬🇧',
      'en-US': 'EN 🇺🇸',
      'en-CA': 'EN 🇨🇦',
      'en': 'EN',
      'ru': 'RU',
      'es': 'ES',
      'fr': 'FR',
      'de': 'DE',
      'it': 'IT',
      'uk': 'UK',
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
          color: Colors.blue[50], borderRadius: BorderRadius.circular(4)),
      child: Text(langNames[langCode] ?? langCode.toUpperCase(),
          style: const TextStyle(
              color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 12)),
    );
  }
}

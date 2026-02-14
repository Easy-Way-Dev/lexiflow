import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lexiflow/core/database/app_database.dart';
import 'package:lexiflow/core/services/import_export_service.dart';
import 'package:lexiflow/features/cards/presentation/screens/import_screen.dart';
import 'package:lexiflow/features/cards/presentation/screens/cards_list_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:drift/drift.dart' as drift;

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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ошибка загрузки: $e')),
        );
      }
    }
  }

  // ============ СОЗДАНИЕ / РЕДАКТИРОВАНИЕ ============

  Future<void> _createDeck() => _showDeckDialog(deckToEdit: null);
  Future<void> _editDeck(Deck deck) => _showDeckDialog(deckToEdit: deck);

  Future<void> _showDeckDialog({Deck? deckToEdit}) async {
    final isEditing = deckToEdit != null;
    final nameController =
        TextEditingController(text: isEditing ? deckToEdit.name : '');
    final descController = TextEditingController(
        text: isEditing ? (deckToEdit.description ?? '') : '');
    String sourceLang = isEditing ? deckToEdit.sourceLanguage : 'en';
    String targetLang = isEditing ? deckToEdit.targetLanguage : 'ru';

    final result = await showDialog<bool>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: Text(isEditing ? 'Редактировать колоду' : 'Создать колоду'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Название *',
                    hintText: 'Например: Английские слова',
                    border: OutlineInputBorder(),
                  ),
                  autofocus: true,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: descController,
                  decoration: const InputDecoration(
                    labelText: 'Описание (необязательно)',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: sourceLang,
                  decoration: const InputDecoration(
                    labelText: 'Изучаемый язык',
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'en', child: Text('🇬🇧 English')),
                    DropdownMenuItem(value: 'es', child: Text('🇪🇸 Español')),
                    DropdownMenuItem(value: 'fr', child: Text('🇫🇷 Français')),
                    DropdownMenuItem(value: 'de', child: Text('🇩🇪 Deutsch')),
                    DropdownMenuItem(value: 'it', child: Text('🇮🇹 Italiano')),
                  ],
                  onChanged: (v) {
                    if (v != null) setDialogState(() => sourceLang = v);
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: targetLang,
                  decoration: const InputDecoration(
                    labelText: 'Родной язык',
                    border: OutlineInputBorder(),
                  ),
                  items: const [
                    DropdownMenuItem(value: 'ru', child: Text('🇷🇺 Русский')),
                    DropdownMenuItem(value: 'en', child: Text('🇬🇧 English')),
                    DropdownMenuItem(
                        value: 'uk', child: Text('🇺🇦 Українська')),
                  ],
                  onChanged: (v) {
                    if (v != null) setDialogState(() => targetLang = v);
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Отмена'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(isEditing ? 'Сохранить' : 'Создать'),
            ),
          ],
        ),
      ),
    );

    if (result == true && nameController.text.isNotEmpty) {
      try {
        if (isEditing) {
          await widget.db.into(widget.db.decks).insertOnConflictUpdate(
                DecksCompanion(
                  id: drift.Value(deckToEdit.id),
                  name: drift.Value(nameController.text.trim()),
                  description: drift.Value(descController.text.trim().isEmpty
                      ? null
                      : descController.text.trim()),
                  sourceLanguage: drift.Value(sourceLang),
                  targetLanguage: drift.Value(targetLang),
                  totalCards: drift.Value(deckToEdit.totalCards),
                  masteredCards: drift.Value(deckToEdit.masteredCards),
                  createdAt: drift.Value(deckToEdit.createdAt),
                ),
              );
        } else {
          await widget.db.createDeck(DecksCompanion(
            name: drift.Value(nameController.text.trim()),
            description: drift.Value(descController.text.trim().isEmpty
                ? null
                : descController.text.trim()),
            sourceLanguage: drift.Value(sourceLang),
            targetLanguage: drift.Value(targetLang),
          ));
        }
        await _loadDecks();
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content:
                  Text(isEditing ? '✅ Колода обновлена!' : '✅ Колода создана!'),
              backgroundColor: Colors.green,
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Ошибка: $e')),
          );
        }
      }
    }
  }

  // ============ УДАЛЕНИЕ ============

  Future<void> _deleteDeck(Deck deck) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Удалить колоду?'),
        content: Text(
            'Колода "${deck.name}" и все её карточки будут удалены безвозвратно.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Отмена'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Удалить'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await widget.db.deleteDeck(deck.id);
      await _loadDecks();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Колода удалена')),
        );
      }
    }
  }

  // ============ ЭКСПОРТ ============

  Future<void> _showExportDialog({Deck? preselectedDeck}) async {
    final selectedDecks = <int>{};
    if (preselectedDeck != null) selectedDecks.add(preselectedDeck.id);
    String savePath = '';
    bool isExporting = false;
    String? exportedFilePath;

    await showDialog(
      context: context,
      barrierDismissible: !isExporting,
      builder: (dialogContext) => StatefulBuilder(
        builder: (dialogContext, setDialogState) => AlertDialog(
          title: const Row(children: [
            Icon(Icons.ios_share, color: Colors.blue, size: 24),
            SizedBox(width: 8),
            Text('Экспорт колод'),
          ]),
          content: SizedBox(
            width: 440,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ===== СПИСОК КОЛОД =====
                  Text(
                    'Выберите колоды:',
                    style: Theme.of(dialogContext)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    constraints: const BoxConstraints(maxHeight: 180),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[300]!),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: _decks.isEmpty
                        ? const Padding(
                            padding: EdgeInsets.all(16),
                            child: Text('Нет колод для экспорта'),
                          )
                        : SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Выбрать все
                                CheckboxListTile(
                                  value: selectedDecks.length == _decks.length,
                                  tristate: true,
                                  onChanged: (_) {
                                    setDialogState(() {
                                      if (selectedDecks.length ==
                                          _decks.length) {
                                        selectedDecks.clear();
                                      } else {
                                        selectedDecks
                                            .addAll(_decks.map((d) => d.id));
                                      }
                                    });
                                  },
                                  title: Text(
                                    'Выбрать все (${_decks.length})',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13),
                                  ),
                                  dense: true,
                                ),
                                const Divider(height: 1),
                                ..._decks.map((deck) => CheckboxListTile(
                                      value: selectedDecks.contains(deck.id),
                                      onChanged: (v) {
                                        setDialogState(() {
                                          if (v == true) {
                                            selectedDecks.add(deck.id);
                                          } else {
                                            selectedDecks.remove(deck.id);
                                          }
                                        });
                                      },
                                      title: Text(deck.name,
                                          style: const TextStyle(fontSize: 13)),
                                      subtitle: Text(
                                        '${deck.totalCards} карт. • ${deck.sourceLanguage.toUpperCase()}→${deck.targetLanguage.toUpperCase()}',
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.grey[500]),
                                      ),
                                      secondary: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: Colors.blue[50],
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        child: Icon(Icons.inventory_2,
                                            size: 16, color: Colors.blue[700]),
                                      ),
                                      dense: true,
                                    )),
                              ],
                            ),
                          ),
                  ),

                  const SizedBox(height: 16),

                  // ===== ПАПКА СОХРАНЕНИЯ =====
                  Text(
                    'Папка сохранения:',
                    style: Theme.of(dialogContext)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  InkWell(
                    onTap: isExporting
                        ? null
                        : () async {
                            final path =
                                await FilePicker.platform.getDirectoryPath(
                              dialogTitle: 'Выберите папку для сохранения',
                            );
                            if (path != null) {
                              setDialogState(() => savePath = path);
                            }
                          },
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: savePath.isNotEmpty
                              ? Colors.blue
                              : Colors.grey[400]!,
                        ),
                        borderRadius: BorderRadius.circular(8),
                        color: savePath.isNotEmpty
                            ? Colors.blue[50]
                            : Colors.grey[50],
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.folder_open,
                            color: savePath.isNotEmpty
                                ? Colors.blue[700]
                                : Colors.grey[500],
                            size: 20,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              savePath.isNotEmpty
                                  ? savePath
                                  : 'Нажмите чтобы выбрать папку...',
                              style: TextStyle(
                                fontSize: 12,
                                color: savePath.isNotEmpty
                                    ? Colors.blue[800]
                                    : Colors.grey[500],
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (savePath.isNotEmpty)
                            Icon(Icons.check_circle,
                                color: Colors.blue[600], size: 16),
                        ],
                      ),
                    ),
                  ),

                  // ===== РЕЗУЛЬТАТ СОХРАНЕНИЯ =====
                  if (exportedFilePath != null) ...[
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.green[50],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.green[200]!),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.check_circle,
                              color: Colors.green, size: 18),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Сохранено:\n$exportedFilePath',
                              style: const TextStyle(
                                  fontSize: 11, color: Colors.green),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.copy,
                                size: 16, color: Colors.green),
                            onPressed: () {
                              Clipboard.setData(
                                  ClipboardData(text: exportedFilePath!));
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('✅ Путь скопирован!')),
                              );
                            },
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                          ),
                        ],
                      ),
                    ),
                  ],

                  if (isExporting) ...[
                    const SizedBox(height: 12),
                    const LinearProgressIndicator(),
                    const SizedBox(height: 4),
                    const Text('Создаём архив...',
                        style: TextStyle(fontSize: 12)),
                  ],
                ],
              ),
            ),
          ),

          // ===== КНОПКИ =====
          actions: [
            TextButton(
              onPressed:
                  isExporting ? null : () => Navigator.pop(dialogContext),
              child: const Text('Закрыть'),
            ),

            // СОХРАНИТЬ
            OutlinedButton.icon(
              onPressed:
                  (isExporting || selectedDecks.isEmpty || savePath.isEmpty)
                      ? null
                      : () async {
                          setDialogState(() => isExporting = true);
                          try {
                            final service = ImportExportService(widget.db);
                            String? lastPath;
                            for (final deckId in selectedDecks) {
                              final path = await service.exportToLexiflow(
                                deckId,
                                customDir: savePath,
                              );
                              lastPath = path;
                            }
                            setDialogState(() {
                              isExporting = false;
                              exportedFilePath = lastPath;
                            });
                          } catch (e) {
                            setDialogState(() => isExporting = false);
                            if (mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text('❌ Ошибка: $e'),
                                    backgroundColor: Colors.red),
                              );
                            }
                          }
                        },
              icon: const Icon(Icons.save_alt, size: 18),
              label: const Text('Сохранить'),
            ),

            // ПОДЕЛИТЬСЯ
            FilledButton.icon(
              onPressed: (isExporting || selectedDecks.isEmpty)
                  ? null
                  : () async {
                      setDialogState(() => isExporting = true);
                      try {
                        final service = ImportExportService(widget.db);
                        final paths = <String>[];
                        for (final deckId in selectedDecks) {
                          final path = await service.exportToLexiflow(deckId);
                          paths.add(path);
                        }
                        setDialogState(() => isExporting = false);

                        if (!mounted) return;
                        Navigator.pop(dialogContext);

                        // Небольшая задержка чтобы диалог закрылся
                        await Future.delayed(const Duration(milliseconds: 300));
                        if (!mounted) return;

                        _showShareDialog(paths.first);
                      } catch (e) {
                        setDialogState(() => isExporting = false);
                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('❌ Ошибка: $e'),
                                backgroundColor: Colors.red),
                          );
                        }
                      }
                    },
              icon: const Icon(Icons.share, size: 18),
              label: const Text('Поделиться'),
            ),
          ],
        ),
      ),
    );
  }

  // ============ ДИАЛОГ МЕССЕНДЖЕРОВ ============

  void _showShareDialog(String filePath) {
    if (!mounted) return;
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Row(children: [
          Icon(Icons.share, color: Colors.blue, size: 22),
          SizedBox(width: 8),
          Text('Поделиться через'),
        ]),
        content: SizedBox(
          width: 360,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Выберите способ отправки:',
                style: TextStyle(fontSize: 13),
              ),
              const SizedBox(height: 16),

              // Ряд 1
              Row(
                children: [
                  Expanded(
                    child: _buildMessengerTile(
                      emoji: '✈️',
                      label: 'Telegram',
                      color: const Color(0xFF2AABEE),
                      onTap: () {
                        Navigator.pop(dialogContext);
                        _openTelegram(filePath);
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildMessengerTile(
                      emoji: '💬',
                      label: 'WhatsApp',
                      color: const Color(0xFF25D366),
                      onTap: () {
                        Navigator.pop(dialogContext);
                        _openWhatsApp();
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildMessengerTile(
                      emoji: '📘',
                      label: 'Facebook',
                      color: const Color(0xFF1877F2),
                      onTap: () {
                        Navigator.pop(dialogContext);
                        _openFacebook();
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Ряд 2
              Row(
                children: [
                  Expanded(
                    child: _buildMessengerTile(
                      emoji: '🔵',
                      label: 'VK',
                      color: const Color(0xFF4680C2),
                      onTap: () {
                        Navigator.pop(dialogContext);
                        _openVK();
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildMessengerTile(
                      emoji: '📧',
                      label: 'Email',
                      color: Colors.red,
                      onTap: () {
                        Navigator.pop(dialogContext);
                        _openEmail(filePath);
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildMessengerTile(
                      emoji: '📤',
                      label: 'Другое',
                      color: Colors.grey,
                      onTap: () {
                        Navigator.pop(dialogContext);
                        ImportExportService.shareToMessengers(filePath);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Кнопка копировать путь
              OutlinedButton.icon(
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: filePath));
                  Navigator.pop(dialogContext);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('✅ Путь к файлу скопирован!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                icon: const Icon(Icons.copy, size: 16),
                label: const Text('Скопировать путь к файлу',
                    style: TextStyle(fontSize: 12)),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 36),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Закрыть'),
          ),
        ],
      ),
    );
  }

  Widget _buildMessengerTile({
    required String emoji,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color.withValues(alpha: 0.3)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(emoji, style: const TextStyle(fontSize: 22)),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: color,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // ===== ОТКРЫТИЕ МЕССЕНДЖЕРОВ =====

  Future<void> _openTelegram(String filePath) async {
    try {
      await Process.run('cmd', ['/c', 'start', 'tg://'], runInShell: true);
    } catch (_) {
      await Process.run('cmd', ['/c', 'start', 'https://web.telegram.org'],
          runInShell: true);
    }
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('📎 Telegram открыт — прикрепите файл вручную'),
          duration: Duration(seconds: 4),
        ),
      );
    }
  }

  Future<void> _openWhatsApp() async {
    try {
      await Process.run('cmd', ['/c', 'start', 'whatsapp://'],
          runInShell: true);
    } catch (_) {
      await Process.run('cmd', ['/c', 'start', 'https://web.whatsapp.com'],
          runInShell: true);
    }
  }

  Future<void> _openFacebook() async {
    await Process.run('cmd', ['/c', 'start', 'https://www.facebook.com'],
        runInShell: true);
  }

  Future<void> _openVK() async {
    await Process.run('cmd', ['/c', 'start', 'https://vk.com'],
        runInShell: true);
  }

  Future<void> _openEmail(String filePath) async {
    final fileName = filePath.split(r'\').last.split('/').last;
    final subject = Uri.encodeComponent('LexiFlow — $fileName');
    final body = Uri.encodeComponent(
        'Привет!\n\nДелюсь колодой из LexiFlow.\nФайл: $filePath\n\n— LexiFlow App');
    await Process.run(
        'cmd', ['/c', 'start', 'mailto:?subject=$subject&body=$body'],
        runInShell: true);
  }

  // ============ ИМПОРТ ============

  Future<void> _import() async {
    final result = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (context) => ImportScreen(db: widget.db),
      ),
    );
    if (result == true) await _loadDecks();
  }

  // ============ BUILD ============

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LexiFlow'),
        actions: [
          IconButton(
            icon: const Icon(Icons.file_download),
            onPressed: _import,
            tooltip: 'Импорт',
          ),
          IconButton(
            icon: const Icon(Icons.ios_share),
            onPressed: () => _showExportDialog(),
            tooltip: 'Экспорт колод',
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadDecks,
            tooltip: 'Обновить',
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _decks.isEmpty
              ? _buildEmptyState()
              : _buildDecksList(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _createDeck,
        icon: const Icon(Icons.add),
        label: const Text('Новая колода'),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.folder_open, size: 80, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text('Нет колод',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: Colors.grey[600])),
          const SizedBox(height: 8),
          Text('Создайте новую или импортируйте готовую',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.grey[500])),
          const SizedBox(height: 24),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              FilledButton.icon(
                onPressed: _createDeck,
                icon: const Icon(Icons.add),
                label: const Text('Создать колоду'),
              ),
              OutlinedButton.icon(
                onPressed: _import,
                icon: const Icon(Icons.file_download),
                label: const Text('Импортировать'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDecksList() {
    return RefreshIndicator(
      onRefresh: _loadDecks,
      child: ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
        itemCount: _decks.length,
        itemBuilder: (context, index) => _buildDeckCard(_decks[index]),
      ),
    );
  }

  Widget _buildDeckCard(Deck deck) {
    final progress =
        deck.totalCards > 0 ? deck.masteredCards / deck.totalCards : 0.0;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CardsListScreen(
                db: widget.db,
                deckId: deck.id,
                deckName: deck.name,
              ),
            ),
          );
          _loadDecks();
        },
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
                            deck.description!.isNotEmpty) ...[
                          const SizedBox(height: 4),
                          Text(deck.description!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: Colors.grey[600])),
                        ],
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.ios_share, color: Colors.blue),
                    onPressed: () => _showExportDialog(preselectedDeck: deck),
                    tooltip: 'Экспорт и поделиться',
                  ),
                  PopupMenuButton<String>(
                    icon: const Icon(Icons.more_vert),
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 'export',
                        child: Row(children: [
                          Icon(Icons.ios_share, color: Colors.blue),
                          SizedBox(width: 8),
                          Text('Экспорт & Поделиться'),
                        ]),
                      ),
                      const PopupMenuItem(
                        value: 'edit',
                        child: Row(children: [
                          Icon(Icons.edit, color: Colors.orange),
                          SizedBox(width: 8),
                          Text('Редактировать'),
                        ]),
                      ),
                      const PopupMenuItem(
                        value: 'delete',
                        child: Row(children: [
                          Icon(Icons.delete, color: Colors.red),
                          SizedBox(width: 8),
                          Text('Удалить', style: TextStyle(color: Colors.red)),
                        ]),
                      ),
                    ],
                    onSelected: (value) {
                      if (value == 'export') {
                        _showExportDialog(preselectedDeck: deck);
                      } else if (value == 'edit') {
                        _editDeck(deck);
                      } else if (value == 'delete') {
                        _deleteDeck(deck);
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  _buildLangChip(deck.sourceLanguage),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: Icon(Icons.arrow_forward, size: 16),
                  ),
                  _buildLangChip(deck.targetLanguage),
                  const Spacer(),
                  Text('${deck.totalCards} карт.',
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
              const SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Прогресс',
                          style: Theme.of(context).textTheme.bodySmall),
                      Text(
                        '${deck.masteredCards}/${deck.totalCards} '
                        '(${(progress * 100).toStringAsFixed(0)}%)',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey[200],
                    borderRadius: BorderRadius.circular(4),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLangChip(String langCode) {
    const langNames = {
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
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        langNames[langCode] ?? langCode.toUpperCase(),
        style: const TextStyle(
            fontSize: 12, fontWeight: FontWeight.bold, color: Colors.blue),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lexiflow/core/database/app_database.dart';
import 'package:lexiflow/core/services/import_export_service.dart';
import 'package:lexiflow/features/cards/presentation/screens/import_screen.dart';
import 'package:drift/drift.dart' as drift;
import 'package:lexiflow/features/cards/presentation/screens/cards_list_screen.dart';

class DecksScreen extends StatefulWidget {
  final AppDatabase db;

  const DecksScreen({
    super.key,
    required this.db,
  });

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

  // ============ СОЗДАНИЕ КОЛОДЫ ============
  Future<void> _createDeck() async {
    await _showDeckDialog(deckToEdit: null);
  }

  // ============ РЕДАКТИРОВАНИЕ КОЛОДЫ ============
  Future<void> _editDeck(Deck deck) async {
    await _showDeckDialog(deckToEdit: deck);
  }

  // ============ ДИАЛОГ СОЗДАНИЯ/РЕДАКТИРОВАНИЯ ============
  Future<void> _showDeckDialog({Deck? deckToEdit}) async {
    final bool isEditing = deckToEdit != null;

    final nameController = TextEditingController(
      text: isEditing ? deckToEdit.name : '',
    );
    final descController = TextEditingController(
      text: isEditing ? (deckToEdit.description ?? '') : '',
    );
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
                    hintText: 'Для чего эта колода',
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
                  onChanged: (value) {
                    if (value != null) {
                      setDialogState(() => sourceLang = value);
                    }
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
                  onChanged: (value) {
                    if (value != null) {
                      setDialogState(() => targetLang = value);
                    }
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
                  description: drift.Value(
                    descController.text.trim().isEmpty
                        ? null
                        : descController.text.trim(),
                  ),
                  sourceLanguage: drift.Value(sourceLang),
                  targetLanguage: drift.Value(targetLang),
                  totalCards: drift.Value(deckToEdit.totalCards),
                  masteredCards: drift.Value(deckToEdit.masteredCards),
                  createdAt: drift.Value(deckToEdit.createdAt),
                ),
              );
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('✅ Колода обновлена!'),
                backgroundColor: Colors.green,
              ),
            );
          }
        } else {
          await widget.db.createDeck(
            DecksCompanion(
              name: drift.Value(nameController.text.trim()),
              description: drift.Value(
                descController.text.trim().isEmpty
                    ? null
                    : descController.text.trim(),
              ),
              sourceLanguage: drift.Value(sourceLang),
              targetLanguage: drift.Value(targetLang),
            ),
          );
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('✅ Колода создана!'),
                backgroundColor: Colors.green,
              ),
            );
          }
        }
        await _loadDecks();
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Ошибка: $e')),
          );
        }
      }
    }
  }

  // ============ УДАЛЕНИЕ КОЛОДЫ ============
  Future<void> _deleteDeck(Deck deck) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Удалить колоду?'),
        content: Text(
          'Колода "${deck.name}" и все её карточки будут удалены безвозвратно.',
        ),
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
      try {
        await widget.db.deleteDeck(deck.id);
        await _loadDecks();
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Колода удалена')),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Ошибка удаления: $e')),
          );
        }
      }
    }
  }

  // ============ ЭКСПОРТ КОЛОДЫ ============
  Future<void> _exportDeck(Deck deck) async {
    final format = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Выберите формат экспорта'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.table_chart, color: Colors.green),
              title: const Text('CSV'),
              subtitle: const Text('Для Excel, Google Sheets'),
              onTap: () => Navigator.pop(context, 'csv'),
            ),
            ListTile(
              leading: const Icon(Icons.code, color: Colors.blue),
              title: const Text('JSON'),
              subtitle: const Text('Структурированный формат'),
              onTap: () => Navigator.pop(context, 'json'),
            ),
            ListTile(
              leading: const Icon(Icons.inventory_2, color: Colors.purple),
              title: const Text('LexiFlow'),
              subtitle: const Text('С изображениями и аудио'),
              onTap: () => Navigator.pop(context, 'lexiflow'),
            ),
          ],
        ),
      ),
    );

    if (format == null) return;

    try {
      final service = ImportExportService(widget.db);
      String filePath;

      switch (format) {
        case 'csv':
          filePath = await service.exportToCSV(deck.id);
          break;
        case 'json':
          filePath = await service.exportToJSON(deck.id);
          break;
        case 'lexiflow':
          filePath = await service.exportToLexiflow(deck.id);
          break;
        default:
          return;
      }

      if (mounted) {
        final share = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('✅ Экспорт завершён'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Файл сохранён:'),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    filePath.split('/').last,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Закрыть'),
              ),
              FilledButton.icon(
                onPressed: () => Navigator.pop(context, true),
                icon: const Icon(Icons.share),
                label: const Text('Поделиться'),
              ),
            ],
          ),
        );

        if (share == true) {
          await ImportExportService.shareFile(filePath);
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Ошибка экспорта: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  // ============ ИМПОРТ ============
  Future<void> _import() async {
    final result = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (context) => ImportScreen(db: widget.db),
      ),
    );

    if (result == true) {
      await _loadDecks();
    }
  }

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
          Text(
            'Нет колод',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.grey[600],
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Создайте новую или импортируйте готовую',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[500],
                ),
          ),
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
        itemBuilder: (context, index) {
          final deck = _decks[index];
          return _buildDeckCard(deck);
        },
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
                        Text(
                          deck.name,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        if (deck.description != null &&
                            deck.description!.isNotEmpty) ...[
                          const SizedBox(height: 4),
                          Text(
                            deck.description!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: Colors.grey[600]),
                          ),
                        ],
                      ],
                    ),
                  ),
                  PopupMenuButton<String>(
                    icon: const Icon(Icons.more_vert),
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 'export',
                        child: Row(
                          children: [
                            Icon(Icons.file_upload, color: Colors.green),
                            SizedBox(width: 8),
                            Text('Экспортировать'),
                          ],
                        ),
                      ),
                      const PopupMenuItem(
                        value: 'edit',
                        child: Row(
                          children: [
                            Icon(Icons.edit, color: Colors.blue),
                            SizedBox(width: 8),
                            Text('Редактировать'),
                          ],
                        ),
                      ),
                      const PopupMenuItem(
                        value: 'delete',
                        child: Row(
                          children: [
                            Icon(Icons.delete, color: Colors.red),
                            SizedBox(width: 8),
                            Text(
                              'Удалить',
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ],
                    onSelected: (value) {
                      if (value == 'export') {
                        _exportDeck(deck);
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
                  _buildLanguageChip(deck.sourceLanguage),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: Icon(Icons.arrow_forward, size: 16),
                  ),
                  _buildLanguageChip(deck.targetLanguage),
                  const Spacer(),
                  Text(
                    '${deck.totalCards} карт.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Прогресс',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        '${deck.masteredCards}/${deck.totalCards} '
                        '(${(progress * 100).toStringAsFixed(0)}%)',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
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

  Widget _buildLanguageChip(String langCode) {
    final langNames = {
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
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }
}

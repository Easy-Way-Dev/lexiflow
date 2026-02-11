import 'package:flutter/material.dart';
import 'package:lexiflow/core/database/app_database.dart';
import 'package:drift/drift.dart' as drift;
import 'package:lexiflow/core/utils/image_helper.dart';
import 'dart:io';

class AddCardScreen extends StatefulWidget {
  final AppDatabase db;
  final int deckId;
  final CardData? cardToEdit;

  const AddCardScreen({
    super.key,
    required this.db,
    required this.deckId,
    this.cardToEdit,
  });

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final _formKey = GlobalKey<FormState>();
  final _frontTextController = TextEditingController();
  final _backTextController = TextEditingController();
  final _pronunciationController = TextEditingController();
  final _exampleController = TextEditingController();
  final _notesController = TextEditingController();

  // Пути к изображениям
  String? _frontImagePath;
  String? _backImagePath;

  bool _isLoading = false;

  bool get _isEditing => widget.cardToEdit != null;

  @override
  void initState() {
    super.initState();
    if (_isEditing) {
      final card = widget.cardToEdit!;
      _frontTextController.text = card.frontText;
      _backTextController.text = card.backText;
      _pronunciationController.text = card.pronunciation ?? '';
      _exampleController.text = card.example ?? '';
      _notesController.text = card.notes ?? '';
      _frontImagePath = card.frontImagePath;
      _backImagePath = card.backImagePath;
    }
  }

  @override
  void dispose() {
    _frontTextController.dispose();
    _backTextController.dispose();
    _pronunciationController.dispose();
    _exampleController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  // ========== ВЫБОР ИЗОБРАЖЕНИЙ ==========

  Future<void> _pickFrontImage() async {
    final imagePath = await ImageHelper.pickAndSaveImage();
    if (imagePath != null) {
      setState(() => _frontImagePath = imagePath);
    }
  }

  Future<void> _pickBackImage() async {
    final imagePath = await ImageHelper.pickAndSaveImage();
    if (imagePath != null) {
      setState(() => _backImagePath = imagePath);
    }
  }

  Future<void> _removeFrontImage() async {
    if (_frontImagePath != null) {
      // Если это новое изображение (не из существующей карточки) - удаляем файл
      if (!_isEditing || _frontImagePath != widget.cardToEdit!.frontImagePath) {
        await ImageHelper.deleteImage(_frontImagePath);
      }
      setState(() => _frontImagePath = null);
    }
  }

  Future<void> _removeBackImage() async {
    if (_backImagePath != null) {
      if (!_isEditing || _backImagePath != widget.cardToEdit!.backImagePath) {
        await ImageHelper.deleteImage(_backImagePath);
      }
      setState(() => _backImagePath = null);
    }
  }

  // ========== СОХРАНЕНИЕ ==========

  Future<void> _saveCard() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      if (_isEditing) {
        final card = widget.cardToEdit!;
        await widget.db.into(widget.db.cards).insertOnConflictUpdate(
              CardsCompanion(
                id: drift.Value(card.id),
                deckId: drift.Value(card.deckId),
                frontText: drift.Value(_frontTextController.text.trim()),
                backText: drift.Value(_backTextController.text.trim()),
                frontImagePath: drift.Value(_frontImagePath),
                backImagePath: drift.Value(_backImagePath),
                pronunciation: drift.Value(
                  _pronunciationController.text.trim().isEmpty
                      ? null
                      : _pronunciationController.text.trim(),
                ),
                example: drift.Value(
                  _exampleController.text.trim().isEmpty
                      ? null
                      : _exampleController.text.trim(),
                ),
                notes: drift.Value(
                  _notesController.text.trim().isEmpty
                      ? null
                      : _notesController.text.trim(),
                ),
                easinessFactor: drift.Value(card.easinessFactor),
                repetitions: drift.Value(card.repetitions),
                interval: drift.Value(card.interval),
                nextReviewDate: drift.Value(card.nextReviewDate),
                lastReviewedAt: drift.Value(card.lastReviewedAt),
                correctCount: drift.Value(card.correctCount),
                incorrectCount: drift.Value(card.incorrectCount),
                isMastered: drift.Value(card.isMastered),
                createdAt: drift.Value(card.createdAt),
                updatedAt: drift.Value(DateTime.now()),
              ),
            );

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('✅ Карточка обновлена!'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pop(context, true);
        }
      } else {
        await widget.db.createCard(
          CardsCompanion(
            deckId: drift.Value(widget.deckId),
            frontText: drift.Value(_frontTextController.text.trim()),
            backText: drift.Value(_backTextController.text.trim()),
            frontImagePath: drift.Value(_frontImagePath),
            backImagePath: drift.Value(_backImagePath),
            pronunciation: drift.Value(
              _pronunciationController.text.trim().isEmpty
                  ? null
                  : _pronunciationController.text.trim(),
            ),
            example: drift.Value(
              _exampleController.text.trim().isEmpty
                  ? null
                  : _exampleController.text.trim(),
            ),
            notes: drift.Value(
              _notesController.text.trim().isEmpty
                  ? null
                  : _notesController.text.trim(),
            ),
          ),
        );

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('✅ Карточка создана!'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pop(context, true);
        }
      }
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ошибка: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditing ? 'Редактировать карточку' : 'Новая карточка'),
        actions: [
          if (_isLoading)
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
            )
          else
            IconButton(
              icon: const Icon(Icons.check),
              onPressed: _saveCard,
              tooltip: 'Сохранить',
            ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // ========== ЛИЦЕВАЯ СТОРОНА ==========
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.text_fields, size: 20),
                        const SizedBox(width: 8),
                        Text(
                          'Лицевая сторона',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _frontTextController,
                      decoration: const InputDecoration(
                        labelText: 'Слово или фраза *',
                        hintText: 'Например: Hello',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Введите текст';
                        }
                        return null;
                      },
                      maxLines: 3,
                      minLines: 1,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _pronunciationController,
                      decoration: const InputDecoration(
                        labelText: 'Произношение (необязательно)',
                        hintText: 'Например: həˈloʊ или [хэлоу]',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.record_voice_over),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Изображение лицевой стороны
                    _buildImageSection(
                      title: 'Изображение',
                      imagePath: _frontImagePath,
                      onPickImage: _pickFrontImage,
                      onRemoveImage: _removeFrontImage,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // ========== ОБРАТНАЯ СТОРОНА ==========
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.translate, size: 20),
                        const SizedBox(width: 8),
                        Text(
                          'Обратная сторона',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _backTextController,
                      decoration: const InputDecoration(
                        labelText: 'Перевод или определение *',
                        hintText: 'Например: Привет',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Введите перевод';
                        }
                        return null;
                      },
                      maxLines: 3,
                      minLines: 1,
                    ),
                    const SizedBox(height: 16),
                    // Изображение обратной стороны
                    _buildImageSection(
                      title: 'Изображение',
                      imagePath: _backImagePath,
                      onPickImage: _pickBackImage,
                      onRemoveImage: _removeBackImage,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // ========== ДОПОЛНИТЕЛЬНО ==========
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.info_outline, size: 20),
                        const SizedBox(width: 8),
                        Text(
                          'Дополнительно',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _exampleController,
                      decoration: const InputDecoration(
                        labelText: 'Пример использования',
                        hintText: 'Например: Hello, how are you?',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.format_quote),
                      ),
                      maxLines: 3,
                      minLines: 1,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _notesController,
                      decoration: const InputDecoration(
                        labelText: 'Заметки',
                        hintText: 'Любые дополнительные заметки',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.note),
                      ),
                      maxLines: 3,
                      minLines: 1,
                    ),
                  ],
                ),
              ),
            ),

            // ========== ПРОГРЕСС (если редактируем) ==========
            if (_isEditing) ...[
              const SizedBox(height: 16),
              Card(
                color: Colors.green[50],
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.bar_chart,
                              size: 20, color: Colors.green[700]),
                          const SizedBox(width: 8),
                          Text(
                            'Прогресс обучения',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(color: Colors.green[700]),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '🔁 Повторений: ${widget.cardToEdit!.repetitions}\n'
                        '✓ Правильно: ${widget.cardToEdit!.correctCount}\n'
                        '✗ Неправильно: ${widget.cardToEdit!.incorrectCount}\n'
                        '${widget.cardToEdit!.isMastered ? "🏆 Карточка освоена!" : "📚 В процессе изучения"}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.green[700],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '⚠️ Прогресс не сбрасывается при редактировании',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.green[600],
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],

            const SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButton: _isLoading
          ? null
          : FloatingActionButton.extended(
              onPressed: _saveCard,
              icon: Icon(_isEditing ? Icons.save : Icons.add),
              label: Text(_isEditing ? 'Сохранить' : 'Создать'),
            ),
    );
  }

  // ========== ВИДЖЕТ ДЛЯ ИЗОБРАЖЕНИЯ ==========
  Widget _buildImageSection({
    required String title,
    required String? imagePath,
    required VoidCallback onPickImage,
    required VoidCallback onRemoveImage,
  }) {
    final hasImage = imagePath != null && imagePath.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
        const SizedBox(height: 8),
        if (hasImage) ...[
          // Показываем изображение
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.file(
              File(imagePath),
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 200,
                  color: Colors.grey[200],
                  child: const Center(
                    child: Icon(Icons.broken_image, size: 48),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: onPickImage,
                  icon: const Icon(Icons.edit),
                  label: const Text('Заменить'),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: onRemoveImage,
                  icon: const Icon(Icons.delete, color: Colors.red),
                  label: const Text(
                    'Удалить',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ] else ...[
          // Кнопка добавить изображение
          OutlinedButton.icon(
            onPressed: onPickImage,
            icon: const Icon(Icons.add_photo_alternate),
            label: const Text('Добавить изображение'),
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(double.infinity, 48),
            ),
          ),
        ],
      ],
    );
  }
}

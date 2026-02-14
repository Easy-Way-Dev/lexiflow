import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lexiflow/core/database/app_database.dart';
import 'package:lexiflow/core/utils/image_helper.dart';
import 'package:lexiflow/core/utils/video_helper.dart';
import 'package:lexiflow/shared/widgets/audio_recorder_widget.dart';
import 'package:drift/drift.dart' as drift;

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
  final _frontVideoController = TextEditingController();
  final _backVideoController = TextEditingController();

  String? _frontImagePath;
  String? _backImagePath;
  String? _frontAudioPath;
  String? _backAudioPath;

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
      _frontVideoController.text = card.frontVideoUrl ?? '';
      _backVideoController.text = card.backVideoUrl ?? '';
      _frontImagePath = card.frontImagePath;
      _backImagePath = card.backImagePath;
      _frontAudioPath = card.frontAudioPath;
      _backAudioPath = card.backAudioPath;
    }
  }

  @override
  void dispose() {
    _frontTextController.dispose();
    _backTextController.dispose();
    _pronunciationController.dispose();
    _exampleController.dispose();
    _notesController.dispose();
    _frontVideoController.dispose();
    _backVideoController.dispose();
    super.dispose();
  }

  // ========== ИЗОБРАЖЕНИЯ ==========

  Future<void> _pickFrontImage() async {
    final path = await ImageHelper.pickAndSaveImage();
    if (path != null) setState(() => _frontImagePath = path);
  }

  Future<void> _pickBackImage() async {
    final path = await ImageHelper.pickAndSaveImage();
    if (path != null) setState(() => _backImagePath = path);
  }

  Future<void> _removeFrontImage() async {
    if (_frontImagePath != null) {
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

  // ========== ВИДЕО С КОМПЬЮТЕРА ==========

  Future<void> _pickVideoFromFile(TextEditingController controller) async {
    final path = await VideoHelper.pickVideoFromFile();
    if (path != null) {
      controller.text = path;
      setState(() {});
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Row(children: [
              const Icon(Icons.check_circle, color: Colors.white),
              const SizedBox(width: 8),
              Expanded(
                  child: Text(
                      '✅ Видео: ${path.split(r'\').last.split('/').last}')),
            ]),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 2),
            behavior: SnackBarBehavior.floating,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        );
      }
    }
  }

  // ========== СОХРАНЕНИЕ ==========

  Future<void> _saveCard() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);

    final frontVideo = _frontVideoController.text.trim().isEmpty
        ? null
        : _frontVideoController.text.trim();
    final backVideo = _backVideoController.text.trim().isEmpty
        ? null
        : _backVideoController.text.trim();

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
                frontAudioPath: drift.Value(_frontAudioPath),
                backAudioPath: drift.Value(_backAudioPath),
                frontVideoUrl: drift.Value(frontVideo),
                backVideoUrl: drift.Value(backVideo),
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
            frontAudioPath: drift.Value(_frontAudioPath),
            backAudioPath: drift.Value(_backAudioPath),
            frontVideoUrl: drift.Value(frontVideo),
            backVideoUrl: drift.Value(backVideo),
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

  // ========== BUILD ==========

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
                    Row(children: [
                      const Icon(Icons.text_fields, size: 20),
                      const SizedBox(width: 8),
                      Text('Лицевая сторона',
                          style: Theme.of(context).textTheme.titleMedium),
                    ]),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _frontTextController,
                      decoration: const InputDecoration(
                        labelText: 'Слово или фраза *',
                        hintText: 'Например: Hello',
                        border: OutlineInputBorder(),
                      ),
                      validator: (v) => v == null || v.trim().isEmpty
                          ? 'Введите текст'
                          : null,
                      maxLines: 3,
                      minLines: 1,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _pronunciationController,
                      decoration: const InputDecoration(
                        labelText: 'Произношение (необязательно)',
                        hintText: 'Например: həˈloʊ',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.record_voice_over),
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildImageSection(
                      title: 'Изображение',
                      imagePath: _frontImagePath,
                      onPickImage: _pickFrontImage,
                      onRemoveImage: _removeFrontImage,
                    ),
                    const SizedBox(height: 16),
                    AudioRecorderWidget(
                      audioPath: _frontAudioPath,
                      label: 'Аудио произношение',
                      onAudioChanged: (path) =>
                          setState(() => _frontAudioPath = path),
                    ),
                    const SizedBox(height: 16),
                    _buildVideoSection(
                      controller: _frontVideoController,
                      wordController: _frontTextController,
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
                    Row(children: [
                      const Icon(Icons.translate, size: 20),
                      const SizedBox(width: 8),
                      Text('Обратная сторона',
                          style: Theme.of(context).textTheme.titleMedium),
                    ]),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _backTextController,
                      decoration: const InputDecoration(
                        labelText: 'Перевод или определение *',
                        hintText: 'Например: Привет',
                        border: OutlineInputBorder(),
                      ),
                      validator: (v) => v == null || v.trim().isEmpty
                          ? 'Введите перевод'
                          : null,
                      maxLines: 3,
                      minLines: 1,
                    ),
                    const SizedBox(height: 16),
                    _buildImageSection(
                      title: 'Изображение',
                      imagePath: _backImagePath,
                      onPickImage: _pickBackImage,
                      onRemoveImage: _removeBackImage,
                    ),
                    const SizedBox(height: 16),
                    AudioRecorderWidget(
                      audioPath: _backAudioPath,
                      label: 'Аудио перевода',
                      onAudioChanged: (path) =>
                          setState(() => _backAudioPath = path),
                    ),
                    const SizedBox(height: 16),
                    _buildVideoSection(
                      controller: _backVideoController,
                      wordController: _frontTextController,
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
                    Row(children: [
                      const Icon(Icons.info_outline, size: 20),
                      const SizedBox(width: 8),
                      Text('Дополнительно',
                          style: Theme.of(context).textTheme.titleMedium),
                    ]),
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

            // ========== ПРОГРЕСС ==========
            if (_isEditing) ...[
              const SizedBox(height: 16),
              Card(
                color: Colors.green[50],
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Icon(Icons.bar_chart,
                            size: 20, color: Colors.green[700]),
                        const SizedBox(width: 8),
                        Text('Прогресс обучения',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(color: Colors.green[700])),
                      ]),
                      const SizedBox(height: 8),
                      Text(
                        '🔁 Повторений: ${widget.cardToEdit!.repetitions}\n'
                        '✓ Правильно: ${widget.cardToEdit!.correctCount}\n'
                        '✗ Неправильно: ${widget.cardToEdit!.incorrectCount}\n'
                        '${widget.cardToEdit!.isMastered ? "🏆 Освоена!" : "📚 В процессе"}',
                        style:
                            TextStyle(fontSize: 14, color: Colors.green[700]),
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

  // ========== ВИДЖЕТ ИЗОБРАЖЕНИЯ ==========

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
        Text(title,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        if (hasImage) ...[
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.file(
              File(imagePath),
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                height: 200,
                color: Colors.grey[200],
                child: const Center(child: Icon(Icons.broken_image, size: 48)),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(children: [
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
                label:
                    const Text('Удалить', style: TextStyle(color: Colors.red)),
              ),
            ),
          ]),
        ] else
          OutlinedButton.icon(
            onPressed: onPickImage,
            icon: const Icon(Icons.add_photo_alternate),
            label: const Text('Добавить изображение'),
            style: OutlinedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48)),
          ),
      ],
    );
  }

  // ========== ВИДЖЕТ ВИДЕО ==========

  Widget _buildVideoSection({
    required TextEditingController controller,
    required TextEditingController wordController,
  }) {
    final url = controller.text.trim();
    final hasUrl = url.isNotEmpty;
    final isYouTube = hasUrl && VideoHelper.isYouTubeUrl(url);
    final isYouGlish = hasUrl && VideoHelper.isYouGlishUrl(url);
    final isLocal = hasUrl && VideoHelper.isLocalFile(url);

    // Имя файла для локального видео
    final localFileName = isLocal ? url.split(r'\').last.split('/').last : '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Видео',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),

        // Если есть локальный файл — показываем плашку
        if (isLocal) ...[
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.purple[50],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.purple[200]!),
            ),
            child: Row(
              children: [
                Icon(Icons.video_file, color: Colors.purple[700], size: 28),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Локальное видео 📁',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.purple[700])),
                      Text(localFileName,
                          style: TextStyle(
                              fontSize: 11, color: Colors.purple[400]),
                          overflow: TextOverflow.ellipsis),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.play_circle,
                      color: Colors.purple[700], size: 30),
                  onPressed: () => VideoHelper.openVideo(context, url),
                  tooltip: 'Открыть',
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.red),
                  onPressed: () {
                    controller.clear();
                    setState(() {});
                  },
                  tooltip: 'Удалить',
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // Кнопка заменить файл
          OutlinedButton.icon(
            onPressed: () => _pickVideoFromFile(controller),
            icon: const Icon(Icons.folder_open, size: 18),
            label: const Text('Выбрать другой файл'),
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(double.infinity, 44),
              foregroundColor: Colors.purple,
              side: const BorderSide(color: Colors.purple),
            ),
          ),
        ] else ...[
          // Поле для URL
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              labelText: 'YouTube, YouGlish или другой URL',
              hintText: 'https://youtube.com/watch?v=...',
              border: const OutlineInputBorder(),
              prefixIcon: Icon(
                isYouTube
                    ? Icons.smart_display
                    : isYouGlish
                        ? Icons.record_voice_over
                        : Icons.link,
                color: isYouTube ? Colors.red : null,
              ),
              suffixIcon: hasUrl
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        controller.clear();
                        setState(() {});
                      },
                    )
                  : null,
            ),
            onChanged: (_) => setState(() {}),
            validator: (v) {
              if (v != null && v.trim().isNotEmpty) {
                if (!VideoHelper.isValidVideoUrl(v.trim())) {
                  return 'Введите корректный URL';
                }
              }
              return null;
            },
          ),

          // Плашка с превью URL
          if (hasUrl) ...[
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isYouTube ? Colors.red[50] : Colors.blue[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                    color: isYouTube ? Colors.red[200]! : Colors.blue[200]!),
              ),
              child: Row(
                children: [
                  Icon(
                    isYouTube
                        ? Icons.smart_display
                        : isYouGlish
                            ? Icons.record_voice_over
                            : Icons.link,
                    color: isYouTube ? Colors.red : Colors.blue,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      isYouTube
                          ? '▶ YouTube видео'
                          : isYouGlish
                              ? '🎤 YouGlish произношение'
                              : '🔗 Видео по ссылке',
                      style: TextStyle(
                        color: isYouTube ? Colors.red[700] : Colors.blue[700],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => VideoHelper.openVideo(context, url),
                    child: const Text('Открыть'),
                  ),
                ],
              ),
            ),
          ],
        ],

        const SizedBox(height: 8),

        // Кнопки быстрых действий
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            // Выбрать файл с компьютера
            ActionChip(
              label: const Text('📁 С компьютера'),
              avatar: const Icon(Icons.video_file, size: 16),
              onPressed: () => _pickVideoFromFile(controller),
            ),
            // YouGlish EN
            ActionChip(
              label: const Text('YouGlish EN'),
              avatar: const Icon(Icons.mic, size: 16),
              onPressed: () {
                final word = wordController.text.trim();
                if (word.isNotEmpty) {
                  controller.text =
                      VideoHelper.buildYouGlishUrl(word, lang: 'english');
                  setState(() {});
                }
              },
            ),
            // YouGlish RU
            ActionChip(
              label: const Text('YouGlish RU'),
              avatar: const Icon(Icons.mic, size: 16),
              onPressed: () {
                final word = wordController.text.trim();
                if (word.isNotEmpty) {
                  controller.text =
                      VideoHelper.buildYouGlishUrl(word, lang: 'russian');
                  setState(() {});
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lexiflow/core/database/app_database.dart';
import 'package:lexiflow/core/services/image_service.dart';
import 'package:lexiflow/core/utils/audio_helper.dart';
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
  late TextEditingController _frontTextController;
  late TextEditingController _backTextController;
  late TextEditingController _pronunciationController;
  late TextEditingController _transcriptionController;
  late TextEditingController _exampleController;
  late TextEditingController _notesController;
  late TextEditingController _frontVideoController;
  late TextEditingController _backVideoController;

  String? _frontImagePath;
  String? _backImagePath;
  String? _frontAudioPath;
  String? _backAudioPath;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    final card = widget.cardToEdit;
    _frontTextController = TextEditingController(text: card?.frontText ?? '');
    _backTextController = TextEditingController(text: card?.backText ?? '');
    _pronunciationController =
        TextEditingController(text: card?.pronunciation ?? '');
    _transcriptionController =
        TextEditingController(text: card?.transcription ?? '');
    _exampleController = TextEditingController(text: card?.example ?? '');
    _notesController = TextEditingController(text: card?.notes ?? '');
    _frontVideoController =
        TextEditingController(text: card?.frontVideoUrl ?? '');
    _backVideoController =
        TextEditingController(text: card?.backVideoUrl ?? '');

    _frontImagePath = card?.frontImagePath;
    _backImagePath = card?.backImagePath;
    _frontAudioPath = card?.frontAudioPath;
    _backAudioPath = card?.backAudioPath;
  }

  @override
  void dispose() {
    _frontTextController.dispose();
    _backTextController.dispose();
    _pronunciationController.dispose();
    _transcriptionController.dispose();
    _exampleController.dispose();
    _notesController.dispose();
    _frontVideoController.dispose();
    _backVideoController.dispose();
    super.dispose();
  }

  Future<void> _pickImage(bool isFront) async {
    final choice = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isFront
            ? 'Изображение лицевой стороны'
            : 'Изображение обратной стороны'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Выбрать из галереи'),
              onTap: () => Navigator.pop(context, 'gallery'),
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Сделать фото'),
              onTap: () => Navigator.pop(context, 'camera'),
            ),
            ListTile(
              leading: const Icon(Icons.search),
              title: const Text('Поиск в интернете'),
              onTap: () => Navigator.pop(context, 'search'),
            ),
          ],
        ),
      ),
    );

    if (choice == null) return;

    if (choice == 'gallery') {
      final imagePath = await ImageService.pickImageFromGallery();
      if (imagePath != null) {
        setState(() {
          if (isFront) {
            _frontImagePath = imagePath;
          } else {
            _backImagePath = imagePath;
          }
        });
      }
    } else if (choice == 'camera') {
      final imagePath = await ImageService.pickImageFromCamera();
      if (imagePath != null) {
        setState(() {
          if (isFront) {
            _frontImagePath = imagePath;
          } else {
            _backImagePath = imagePath;
          }
        });
      }
    } else if (choice == 'search') {
      await _searchImageOnline();
    }
  }

  Future<void> _removeImage(bool isFront) async {
    setState(() {
      if (isFront) {
        _frontImagePath = null;
      } else {
        _backImagePath = null;
      }
    });
  }

  Future<void> _pickVideo(bool isFront) async {
    final videoPath = await VideoHelper.pickVideoFromFile();
    if (videoPath != null) {
      setState(() {
        if (isFront) {
          _frontVideoController.text = videoPath;
        } else {
          _backVideoController.text = videoPath;
        }
      });
    }
  }

  void _searchYouGlish(String word, String lang, bool isFront) {
    if (word.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Введите слово для поиска')),
      );
      return;
    }

    final encodedWord = Uri.encodeComponent(word.trim());
    final url = 'https://youglish.com/pronounce/$encodedWord/$lang';

    setState(() {
      if (isFront) {
        _frontVideoController.text = url;
      } else {
        _backVideoController.text = url;
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('✅ Добавлена ссылка YouGlish ($lang)'),
        backgroundColor: Colors.green,
      ),
    );
  }

  Future<void> _searchTranscription() async {
    final word = _frontTextController.text.trim();
    if (word.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Введите слово в лицевой стороне')),
      );
      return;
    }

    final encodedWord = Uri.encodeComponent(word);
    final url =
        'https://dictionary.cambridge.org/dictionary/english/$encodedWord';

    if (await VideoHelper.canLaunchUrl(url)) {
      await VideoHelper.launchUrlInBrowser(url);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
                '📖 Открыт Cambridge Dictionary. Скопируйте транскрипцию.'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }

  Future<void> _searchImageOnline() async {
    final word = _frontTextController.text.trim();
    if (word.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Введите слово в лицевой стороне')),
      );
      return;
    }

    final encodedWord = Uri.encodeComponent(word);
    final url = 'https://www.google.com/search?tbm=isch&q=$encodedWord';

    if (await VideoHelper.canLaunchUrl(url)) {
      await VideoHelper.launchUrlInBrowser(url);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
                '🖼️ Открыт Google Images. Сохраните картинку и загрузите её.'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }

  void _onAudioChanged(String? audioPath, bool isFront) {
    if (audioPath != null) {
      setState(() {
        if (isFront) {
          _frontAudioPath = audioPath;
        } else {
          _backAudioPath = audioPath;
        }
      });
    } else {
      setState(() {
        if (isFront) {
          _frontAudioPath = null;
        } else {
          _backAudioPath = null;
        }
      });
    }
  }

  Future<void> _saveCard() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final isEditing = widget.cardToEdit != null;

      if (isEditing) {
        final card = widget.cardToEdit!;
        final updatedCard = CardsCompanion(
          id: drift.Value(card.id),
          deckId: drift.Value(card.deckId),
          frontText: drift.Value(_frontTextController.text.trim()),
          backText: drift.Value(_backTextController.text.trim()),
          frontImagePath: drift.Value(_frontImagePath),
          backImagePath: drift.Value(_backImagePath),
          frontAudioPath: drift.Value(_frontAudioPath),
          backAudioPath: drift.Value(_backAudioPath),
          frontVideoUrl: drift.Value(
            _frontVideoController.text.trim().isEmpty
                ? null
                : _frontVideoController.text.trim(),
          ),
          backVideoUrl: drift.Value(
            _backVideoController.text.trim().isEmpty
                ? null
                : _backVideoController.text.trim(),
          ),
          pronunciation: drift.Value(
            _pronunciationController.text.trim().isEmpty
                ? null
                : _pronunciationController.text.trim(),
          ),
          transcription: drift.Value(
            _transcriptionController.text.trim().isEmpty
                ? null
                : _transcriptionController.text.trim(),
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
        );

        await widget.db
            .into(widget.db.cards)
            .insertOnConflictUpdate(updatedCard);
      } else {
        await widget.db.createCard(CardsCompanion(
          deckId: drift.Value(widget.deckId),
          frontText: drift.Value(_frontTextController.text.trim()),
          backText: drift.Value(_backTextController.text.trim()),
          frontImagePath: drift.Value(_frontImagePath),
          backImagePath: drift.Value(_backImagePath),
          frontAudioPath: drift.Value(_frontAudioPath),
          backAudioPath: drift.Value(_backAudioPath),
          frontVideoUrl: drift.Value(
            _frontVideoController.text.trim().isEmpty
                ? null
                : _frontVideoController.text.trim(),
          ),
          backVideoUrl: drift.Value(
            _backVideoController.text.trim().isEmpty
                ? null
                : _backVideoController.text.trim(),
          ),
          pronunciation: drift.Value(
            _pronunciationController.text.trim().isEmpty
                ? null
                : _pronunciationController.text.trim(),
          ),
          transcription: drift.Value(
            _transcriptionController.text.trim().isEmpty
                ? null
                : _transcriptionController.text.trim(),
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
        ));
      }

      if (mounted) {
        Navigator.pop(context, true);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                isEditing ? '✅ Карточка обновлена!' : '✅ Карточка создана!'),
            backgroundColor: Colors.green,
          ),
        );
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
    final isEditing = widget.cardToEdit != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Редактировать карточку' : 'Новая карточка'),
        actions: [
          if (_isLoading)
            const Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: SizedBox(
                  width: 24,
                  height: 24,
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
            // ===== ЛИЦЕВАЯ СТОРОНА =====
            Text(
              'Лицевая сторона',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const SizedBox(height: 12),

            TextFormField(
              controller: _frontTextController,
              decoration: const InputDecoration(
                labelText: 'Текст (обязательно) *',
                hintText: 'Например: Hello',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.text_fields),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Введите текст';
                }
                return null;
              },
              maxLines: 2,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 12),

            // Изображение (лицо)
            if (_frontImagePath != null) ...[
              Stack(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.file(
                        File(_frontImagePath!),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: IconButton(
                      onPressed: () => _removeImage(true),
                      icon: const Icon(Icons.close, color: Colors.white),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
            ] else
              OutlinedButton.icon(
                onPressed: () => _pickImage(true),
                icon: const Icon(Icons.image),
                label: const Text('Добавить изображение'),
              ),

            const SizedBox(height: 12),

            // Аудио (лицо)
            AudioRecorderWidget(
              audioPath: _frontAudioPath,
              onAudioChanged: (path) => _onAudioChanged(path, true),
              label: 'Аудио (лицевая сторона)',
            ),

            const SizedBox(height: 12),

            // Видео (лицо)
            TextFormField(
              controller: _frontVideoController,
              decoration: InputDecoration(
                labelText: 'Видео URL (YouTube/YouGlish) или файл',
                hintText: 'https://youtube.com/... или локальный путь',
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.video_library),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (_frontVideoController.text.isNotEmpty)
                      IconButton(
                        icon: const Icon(Icons.play_circle, color: Colors.blue),
                        onPressed: () {
                          if (_frontVideoController.text.isNotEmpty) {
                            VideoHelper.openVideo(
                                context, _frontVideoController.text);
                          }
                        },
                        tooltip: 'Просмотр',
                      ),
                    IconButton(
                      icon: const Icon(Icons.attach_file),
                      onPressed: () => _pickVideo(true),
                      tooltip: 'Выбрать файл',
                    ),
                  ],
                ),
              ),
              maxLines: 1,
            ),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: () =>
                  _searchYouGlish(_frontTextController.text, 'us', true),
              icon: const Text('🇺🇸', style: TextStyle(fontSize: 18)),
              label: const Text('YouGlish (US English)'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 44),
              ),
            ),

            const SizedBox(height: 24),

            // ===== ОБРАТНАЯ СТОРОНА =====
            Text(
              'Обратная сторона',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
            const SizedBox(height: 12),

            TextFormField(
              controller: _backTextController,
              decoration: const InputDecoration(
                labelText: 'Текст (обязательно) *',
                hintText: 'Например: Привет',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.text_fields),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Введите перевод';
                }
                return null;
              },
              maxLines: 2,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 12),

            // Pronunciation (русское чтение)
            TextFormField(
              controller: _pronunciationController,
              decoration: const InputDecoration(
                labelText: 'Произношение (русское)',
                hintText: 'Например: хэлоу',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.record_voice_over),
                helperText: 'Как читается по-русски',
              ),
              maxLines: 1,
            ),
            const SizedBox(height: 12),

            // Transcription (МФА)
            TextFormField(
              controller: _transcriptionController,
              decoration: InputDecoration(
                labelText: 'Транскрипция (МФА)',
                hintText: 'Например: [hɛˈloʊ]',
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.translate),
                helperText: 'Международный фонетический алфавит',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search, color: Colors.purple),
                  onPressed: _searchTranscription,
                  tooltip: 'Найти в словаре',
                ),
              ),
              style: const TextStyle(fontFamily: 'monospace'),
              maxLines: 1,
            ),
            const SizedBox(height: 12),

            // Изображение (обратная сторона)
            if (_backImagePath != null) ...[
              Stack(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.file(
                        File(_backImagePath!),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: IconButton(
                      onPressed: () => _removeImage(false),
                      icon: const Icon(Icons.close, color: Colors.white),
                      style: IconButton.styleFrom(
                        backgroundColor: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
            ] else
              OutlinedButton.icon(
                onPressed: () => _pickImage(false),
                icon: const Icon(Icons.image),
                label: const Text('Добавить изображение'),
              ),

            const SizedBox(height: 12),

            // Аудио (обратная сторона)
            AudioRecorderWidget(
              audioPath: _backAudioPath,
              onAudioChanged: (path) => _onAudioChanged(path, false),
              label: 'Аудио (обратная сторона)',
            ),

            const SizedBox(height: 12),

            // Видео (обратная сторона)
            TextFormField(
              controller: _backVideoController,
              decoration: InputDecoration(
                labelText: 'Видео URL (YouTube/YouGlish) или файл',
                hintText: 'https://youtube.com/... или локальный путь',
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.video_library),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (_backVideoController.text.isNotEmpty)
                      IconButton(
                        icon: const Icon(Icons.play_circle, color: Colors.blue),
                        onPressed: () {
                          if (_backVideoController.text.isNotEmpty) {
                            VideoHelper.openVideo(
                                context, _backVideoController.text);
                          }
                        },
                        tooltip: 'Просмотр',
                      ),
                    IconButton(
                      icon: const Icon(Icons.attach_file),
                      onPressed: () => _pickVideo(false),
                      tooltip: 'Выбрать файл',
                    ),
                  ],
                ),
              ),
              maxLines: 1,
            ),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: () =>
                  _searchYouGlish(_backTextController.text, 'us', false),
              icon: const Text('🇺🇸', style: TextStyle(fontSize: 18)),
              label: const Text('YouGlish (US English)'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 44),
              ),
            ),

            const SizedBox(height: 24),

            // ===== ДОПОЛНИТЕЛЬНО =====
            Text(
              'Дополнительно',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 12),

            TextFormField(
              controller: _exampleController,
              decoration: const InputDecoration(
                labelText: 'Пример использования',
                hintText: 'Hello, how are you?',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lightbulb_outline),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 12),

            TextFormField(
              controller: _notesController,
              decoration: const InputDecoration(
                labelText: 'Заметки',
                hintText: 'Дополнительная информация...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.note),
              ),
              maxLines: 3,
            ),

            const SizedBox(height: 24),

            // ===== КНОПКИ =====
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: _isLoading ? null : () => Navigator.pop(context),
                    child: const Text('Отмена'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 2,
                  child: FilledButton.icon(
                    onPressed: _isLoading ? null : _saveCard,
                    icon: _isLoading
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Icon(Icons.save),
                    label: Text(isEditing ? 'Сохранить' : 'Создать'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
    final l = AppLocalizations.of(context);
    final choice = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isFront ? l.frontImageTitle : l.backImageTitle),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: Text(l.galleryOption),
              onTap: () => Navigator.pop(context, 'gallery'),
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: Text(l.cameraOption),
              onTap: () => Navigator.pop(context, 'camera'),
            ),
            ListTile(
              leading: const Icon(Icons.search),
              title: Text(l.searchOnlineOption),
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
          if (isFront)
            _frontImagePath = imagePath;
          else
            _backImagePath = imagePath;
        });
      }
    } else if (choice == 'camera') {
      final imagePath = await ImageService.pickImageFromCamera();
      if (imagePath != null) {
        setState(() {
          if (isFront)
            _frontImagePath = imagePath;
          else
            _backImagePath = imagePath;
        });
      }
    } else if (choice == 'search') {
      await _searchImageOnline();
    }
  }

  Future<void> _removeImage(bool isFront) async {
    setState(() {
      if (isFront)
        _frontImagePath = null;
      else
        _backImagePath = null;
    });
  }

  Future<void> _pickVideo(bool isFront) async {
    final videoPath = await VideoHelper.pickVideoFromFile();
    if (videoPath != null) {
      setState(() {
        if (isFront)
          _frontVideoController.text = videoPath;
        else
          _backVideoController.text = videoPath;
      });
    }
  }

  void _searchYouGlish(String word, String lang, bool isFront) {
    final l = AppLocalizations.of(context);
    if (word.trim().isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(l.wordRequired)));
      return;
    }
    final encodedWord = Uri.encodeComponent(word.trim());
    final url = 'https://youglish.com/pronounce/$encodedWord/$lang';
    setState(() {
      if (isFront)
        _frontVideoController.text = url;
      else
        _backVideoController.text = url;
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(l.youglishAdded(lang)),
      backgroundColor: Colors.green,
    ));
  }

  Future<void> _searchTranscription() async {
    final l = AppLocalizations.of(context);
    final word = _frontTextController.text.trim();
    if (word.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(l.wordRequired)));
      return;
    }
    final encodedWord = Uri.encodeComponent(word);
    final url =
        'https://dictionary.cambridge.org/dictionary/english/$encodedWord';
    if (await VideoHelper.canLaunchUrl(url)) {
      await VideoHelper.launchUrlInBrowser(url);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(AppLocalizations.of(context).openedCambridge),
          duration: const Duration(seconds: 3),
        ));
      }
    }
  }

  Future<void> _searchImageOnline() async {
    final l = AppLocalizations.of(context);
    final word = _frontTextController.text.trim();
    if (word.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(l.wordRequired)));
      return;
    }
    final encodedWord = Uri.encodeComponent(word);
    final url = 'https://www.google.com/search?tbm=isch&q=$encodedWord';
    if (await VideoHelper.canLaunchUrl(url)) {
      await VideoHelper.launchUrlInBrowser(url);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(AppLocalizations.of(context).openedGoogleImages),
          duration: const Duration(seconds: 3),
        ));
      }
    }
  }

  void _onAudioChanged(String? audioPath, bool isFront) {
    setState(() {
      if (isFront)
        _frontAudioPath = audioPath;
      else
        _backAudioPath = audioPath;
    });
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
        final l = AppLocalizations.of(context);
        Navigator.pop(context, true);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(isEditing ? l.cardUpdated : l.cardCreated),
          backgroundColor: Colors.green,
        ));
      }
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content:
              Text(AppLocalizations.of(context).errorGeneric(e.toString())),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final isEditing = widget.cardToEdit != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? l.editCardTitle : l.addCardTitle),
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
              tooltip: l.save,
            ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // ===== FRONT SIDE =====
            Text(
              l.frontSide,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const SizedBox(height: 12),

            TextFormField(
              controller: _frontTextController,
              decoration: InputDecoration(
                labelText: l.frontTextLabel,
                hintText: l.frontTextHint,
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.text_fields),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return l.fieldRequired;
                }
                return null;
              },
              maxLines: 2,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 12),

            // Front image
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
                      style:
                          IconButton.styleFrom(backgroundColor: Colors.black54),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
            ] else
              OutlinedButton.icon(
                onPressed: () => _pickImage(true),
                icon: const Icon(Icons.image),
                label: Text(l.addImage),
              ),

            const SizedBox(height: 12),

            AudioRecorderWidget(
              audioPath: _frontAudioPath,
              onAudioChanged: (path) => _onAudioChanged(path, true),
              label: l.audioFront,
            ),

            const SizedBox(height: 12),

            TextFormField(
              controller: _frontVideoController,
              decoration: InputDecoration(
                labelText: l.videoUrlLabel,
                hintText: l.videoUrlHint,
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
                      ),
                    IconButton(
                      icon: const Icon(Icons.attach_file),
                      onPressed: () => _pickVideo(true),
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
              label: Text(l.youglishUs),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 44),
              ),
            ),

            const SizedBox(height: 24),

            // ===== BACK SIDE =====
            Text(
              l.backSide,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
            const SizedBox(height: 12),

            TextFormField(
              controller: _backTextController,
              decoration: InputDecoration(
                labelText: l.backTextLabel,
                hintText: l.backTextHint,
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.text_fields),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return l.translationRequired;
                }
                return null;
              },
              maxLines: 2,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 12),

            // Pronunciation
            TextFormField(
              controller: _pronunciationController,
              decoration: InputDecoration(
                labelText: l.pronunciationLabel,
                hintText: l.pronunciationHint,
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.record_voice_over),
                helperText: l.pronunciationHelper,
              ),
              maxLines: 1,
            ),
            const SizedBox(height: 12),

            // Transcription
            TextFormField(
              controller: _transcriptionController,
              decoration: InputDecoration(
                labelText: l.transcriptionLabel,
                hintText: l.transcriptionHint,
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.translate),
                helperText: l.transcriptionHelper,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search, color: Colors.purple),
                  onPressed: _searchTranscription,
                ),
              ),
              style: const TextStyle(fontFamily: 'monospace'),
              maxLines: 1,
            ),
            const SizedBox(height: 12),

            // Back image
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
                      style:
                          IconButton.styleFrom(backgroundColor: Colors.black54),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
            ] else
              OutlinedButton.icon(
                onPressed: () => _pickImage(false),
                icon: const Icon(Icons.image),
                label: Text(l.addImage),
              ),

            const SizedBox(height: 12),

            AudioRecorderWidget(
              audioPath: _backAudioPath,
              onAudioChanged: (path) => _onAudioChanged(path, false),
              label: l.audioBack,
            ),

            const SizedBox(height: 12),

            TextFormField(
              controller: _backVideoController,
              decoration: InputDecoration(
                labelText: l.videoUrlLabel,
                hintText: l.videoUrlHint,
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
                      ),
                    IconButton(
                      icon: const Icon(Icons.attach_file),
                      onPressed: () => _pickVideo(false),
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
              label: Text(l.youglishUs),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 44),
              ),
            ),

            const SizedBox(height: 24),

            // ===== ADDITIONAL =====
            Text(
              l.additional,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            TextFormField(
              controller: _exampleController,
              decoration: InputDecoration(
                labelText: l.exampleLabel,
                hintText: l.exampleHint,
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.lightbulb_outline),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 12),

            TextFormField(
              controller: _notesController,
              decoration: InputDecoration(
                labelText: l.notesLabel,
                hintText: l.notesHint,
                border: const OutlineInputBorder(),
                prefixIcon: const Icon(Icons.note),
              ),
              maxLines: 3,
            ),

            const SizedBox(height: 24),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: _isLoading ? null : () => Navigator.pop(context),
                    child: Text(l.cancel),
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
                                strokeWidth: 2, color: Colors.white),
                          )
                        : const Icon(Icons.save),
                    label: Text(isEditing ? l.save : l.create),
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

import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Добавлен импорт
import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:lexiflow/core/utils/audio_helper.dart';

class AudioRecorderWidget extends StatefulWidget {
  final String? audioPath;
  final Function(String?) onAudioChanged;
  final String? label; // Изменено на опциональный

  const AudioRecorderWidget({
    super.key,
    required this.audioPath,
    required this.onAudioChanged,
    this.label,
  });

  @override
  State<AudioRecorderWidget> createState() => _AudioRecorderWidgetState();
}

class _AudioRecorderWidgetState extends State<AudioRecorderWidget> {
  bool _isRecording = false;
  bool _isPlaying = false;
  String? _currentAudioPath;
  int _recordingSeconds = 0;
  Timer? _recordingTimer;
  StreamSubscription? _playerSubscription;

  @override
  void initState() {
    super.initState();
    _currentAudioPath = widget.audioPath;
    _playerSubscription = AudioHelper.playerStateStream.listen((state) {
      if (mounted) {
        setState(() => _isPlaying = state == PlayerState.playing);
      }
    });
  }

  @override
  void dispose() {
    _recordingTimer?.cancel();
    _playerSubscription?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _recordingSeconds = 0;
    _recordingTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) setState(() => _recordingSeconds++);
    });
  }

  void _stopTimer() {
    _recordingTimer?.cancel();
    _recordingTimer = null;
  }

  String get _formattedTime {
    final mins = _recordingSeconds ~/ 60;
    final secs = _recordingSeconds % 60;
    return '${mins.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  Future<void> _toggleRecording() async {
    final l = AppLocalizations.of(context);
    if (_isRecording) {
      _stopTimer();
      setState(() => _isRecording = false);
      final path = await AudioHelper.stopRecording();

      if (path != null) {
        if (_currentAudioPath != null) {
          await AudioHelper.deleteAudio(_currentAudioPath);
        }
        setState(() => _currentAudioPath = path);
        widget.onAudioChanged(path);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(children: [
                const Icon(Icons.check_circle, color: Colors.white),
                const SizedBox(width: 8),
                Text(l.audioRecordedSuccess),
              ]),
              backgroundColor: Colors.green,
            ),
          );
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(l.recordingError), backgroundColor: Colors.red),
          );
        }
      }
    } else {
      final started = await AudioHelper.startRecording();
      if (started) {
        _startTimer();
        setState(() => _isRecording = true);
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(l.micPermissionError),
                backgroundColor: Colors.red),
          );
        }
      }
    }
  }

  Future<void> _pickAudioFromFile() async {
    final l = AppLocalizations.of(context);
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['mp3', 'wav', 'ogg', 'aac', 'm4a', 'wma', 'flac'],
      );

      if (result == null || result.files.isEmpty) return;
      final pickedFile = result.files.first;
      if (pickedFile.path == null) return;

      final appDir = await getApplicationDocumentsDirectory();
      final audioDir = Directory(p.join(appDir.path, 'audio'));
      if (!await audioDir.exists()) await audioDir.create(recursive: true);

      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final ext = p.extension(pickedFile.path!);
      final destPath = p.join(audioDir.path, 'audio_$timestamp$ext');

      await File(pickedFile.path!).copy(destPath);
      if (_currentAudioPath != null) {
        await AudioHelper.deleteAudio(_currentAudioPath);
      }

      setState(() => _currentAudioPath = destPath);
      widget.onAudioChanged(destPath);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l.audioLoadedSuccess),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(l.errorGeneric(e.toString())),
              backgroundColor: Colors.red),
        );
      }
    }
  }

  Future<void> _playAudio() async {
    if (_currentAudioPath == null) return;
    _isPlaying
        ? await AudioHelper.stopAudio()
        : await AudioHelper.playAudio(_currentAudioPath!);
  }

  Future<void> _deleteAudio() async {
    final l = AppLocalizations.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l.delete),
        content:
            Text(l.cardDeleted), // Можно добавить отдельный ключ если нужно
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(l.cancel)),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            child: Text(l.delete),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await AudioHelper.stopAudio();
      await AudioHelper.deleteAudio(_currentAudioPath);
      setState(() => _currentAudioPath = null);
      widget.onAudioChanged(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final hasAudio = _currentAudioPath != null && _currentAudioPath!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label ?? l.audioDefaultLabel,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        if (_isRecording)
          _buildRecordingUI(l)
        else if (hasAudio)
          _buildHasAudioUI(l)
        else
          _buildNoAudioUI(l),
      ],
    );
  }

  Widget _buildRecordingUI(AppLocalizations l) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.red[300]!),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.mic, color: Colors.red),
              const SizedBox(width: 12),
              Expanded(
                  child: Text(l.playingPreview,
                      style: TextStyle(
                          color: Colors.red[700],
                          fontWeight: FontWeight.bold))),
              Text(_formattedTime,
                  style: TextStyle(
                      color: Colors.red[700], fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: _toggleRecording,
              icon: const Icon(Icons.stop),
              label: Text(l.stopButton),
              style: FilledButton.styleFrom(backgroundColor: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHasAudioUI(AppLocalizations l) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.green[50],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.green[200]!),
          ),
          child: Row(
            children: [
              Icon(Icons.audiotrack, color: Colors.green[700]),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l.audioAdded,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.green[700])),
                    Text(
                        _isPlaying
                            ? l.playingPreview
                            : p.basename(_currentAudioPath!),
                        style:
                            TextStyle(fontSize: 11, color: Colors.green[500]),
                        overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
              IconButton(
                  icon: Icon(_isPlaying ? Icons.stop_circle : Icons.play_circle,
                      color: Colors.green[700]),
                  onPressed: _playAudio),
              IconButton(
                  icon: const Icon(Icons.delete_outline, color: Colors.red),
                  onPressed: _deleteAudio),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: _toggleRecording,
                icon: const Icon(Icons.mic, size: 18),
                label: Text(l.recordAgain),
                style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.orange,
                    side: const BorderSide(color: Colors.orange)),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: OutlinedButton.icon(
                onPressed: _pickAudioFromFile,
                icon: const Icon(Icons.folder_open, size: 18),
                label: Text(l.pickFile),
                style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.blue,
                    side: const BorderSide(color: Colors.blue)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNoAudioUI(AppLocalizations l) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: _toggleRecording,
            icon: const Icon(Icons.mic),
            label: Text(l.recordButton),
            style: OutlinedButton.styleFrom(
                minimumSize: const Size(0, 48),
                side: const BorderSide(color: Colors.red),
                foregroundColor: Colors.red),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: _pickAudioFromFile,
            icon: const Icon(Icons.folder_open),
            label: Text(l.fromComputer),
            style: OutlinedButton.styleFrom(
                minimumSize: const Size(0, 48),
                side: const BorderSide(color: Colors.blue),
                foregroundColor: Colors.blue),
          ),
        ),
      ],
    );
  }
}

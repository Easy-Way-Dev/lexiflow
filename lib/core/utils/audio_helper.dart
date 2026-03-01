import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class AudioHelper {
  static final AudioPlayer _player = AudioPlayer();
  static final Record _recorder = Record();
  static bool _isRecording = false;

  // ========== ЗАПИСЬ ==========

  static Future<bool> startRecording() async {
    try {
      final hasPermission = await _recorder.hasPermission();
      if (!hasPermission) return false;

      final appDir = await getApplicationDocumentsDirectory();
      final audioDir = Directory(p.join(appDir.path, 'audio'));
      if (!await audioDir.exists()) {
        await audioDir.create(recursive: true);
      }

      final timestamp = DateTime.now().millisecondsSinceEpoch;
      // WAV формат - работает на Windows!
      final recordPath = p.join(audioDir.path, 'audio_$timestamp.wav');

      await _recorder.start(
        path: recordPath,
        encoder: AudioEncoder.wav, // WAV вместо aacLc!
        bitRate: 128000,
        samplingRate: 44100,
      );

      _isRecording = true;
      return true;
    } catch (e) {
      debugPrint('Error starting recording: $e');
      return false;
    }
  }

  static Future<String?> stopRecording() async {
    try {
      if (!_isRecording) return null;
      final path = await _recorder.stop();
      _isRecording = false;
      return path;
    } catch (e) {
      debugPrint('Error stopping recording: $e');
      return null;
    }
  }

  static Future<void> cancelRecording() async {
    try {
      if (_isRecording) {
        await _recorder.stop();
        _isRecording = false;
      }
    } catch (e) {
      debugPrint('Error canceling: $e');
    }
  }

  // ========== ВОСПРОИЗВЕДЕНИЕ ==========

  static Future<void> playAudio(String audioPath) async {
    try {
      await _player.stop();
      await _player.play(DeviceFileSource(audioPath));
    } catch (e) {
      debugPrint('Error playing audio: $e');
    }
  }

  static Future<void> stopAudio() async {
    try {
      await _player.stop();
    } catch (e) {
      debugPrint('Error stopping audio: $e');
    }
  }

  // ========== СОСТОЯНИЕ ==========

  static bool get isRecording => _isRecording;

  static Stream<PlayerState> get playerStateStream =>
      _player.onPlayerStateChanged;

  // ========== УТИЛИТЫ ==========

  static Future<void> deleteAudio(String? audioPath) async {
    if (audioPath == null || audioPath.isEmpty) return;
    try {
      final file = File(audioPath);
      if (await file.exists()) await file.delete();
    } catch (e) {
      debugPrint('Error deleting audio: $e');
    }
  }

  static Future<bool> audioExists(String? audioPath) async {
    if (audioPath == null || audioPath.isEmpty) return false;
    return await File(audioPath).exists();
  }

  static Future<void> dispose() async {
    await _player.dispose();
    await _recorder.dispose();
  }
}


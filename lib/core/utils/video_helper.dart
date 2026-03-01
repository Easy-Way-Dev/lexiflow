import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:url_launcher/url_launcher.dart'
    as launcher; // Добавлен префикс для избежания конфликтов

class VideoHelper {
  // ========== ОПРЕДЕЛЕНИЕ ТИПА ==========

  static bool isYouTubeUrl(String url) =>
      url.contains('youtube.com') || url.contains('youtu.be');

  static bool isYouGlishUrl(String url) => url.contains('youglish.com');

  static bool isLocalFile(String url) =>
      !url.startsWith('http://') &&
      !url.startsWith('https://') &&
      (url.startsWith('/') ||
          url.contains(':\\') ||
          url.contains(':/') ||
          url.startsWith(r'\'));

  static String? extractYouTubeId(String url) {
    final regExp = RegExp(
      r'(?:youtu\.be\/|youtube\.com\/(?:watch\?v=|embed\/|v\/))([a-zA-Z0-9_-]{11})',
    );
    return regExp.firstMatch(url)?.group(1);
  }

  static String? getYouTubeThumbnail(String url) {
    final id = extractYouTubeId(url);
    if (id == null) return null;
    return 'https://img.youtube.com/vi/$id/mqdefault.jpg';
  }

  static String buildYouGlishUrl(String word, {String lang = 'english'}) {
    return 'https://youglish.com/pronounce/${Uri.encodeComponent(word)}/$lang';
  }

  static bool isValidVideoUrl(String url) {
    if (url.isEmpty) return false;
    return url.startsWith('http://') ||
        url.startsWith('https://') ||
        isLocalFile(url);
  }

  static VideoType getVideoType(String url) {
    if (isYouTubeUrl(url)) return VideoType.youtube;
    if (isYouGlishUrl(url)) return VideoType.youglish;
    if (isLocalFile(url)) return VideoType.localFile;
    return VideoType.other;
  }

  // ========== ВЫБОР ВИДЕО С КОМПЬЮТЕРА ==========

  static Future<String?> pickVideoFromFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['mp4', 'avi', 'mov', 'mkv', 'wmv', 'flv', 'webm'],
        dialogTitle: 'Выберите видео файл',
      );

      if (result == null || result.files.isEmpty) return null;
      final pickedFile = result.files.first;
      if (pickedFile.path == null) return null;

      final appDir = await getApplicationDocumentsDirectory();
      final videoDir = Directory(p.join(appDir.path, 'videos'));
      if (!await videoDir.exists()) {
        await videoDir.create(recursive: true);
      }

      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final ext = p.extension(pickedFile.path!);
      final destPath = p.join(videoDir.path, 'video_$timestamp$ext');

      await File(pickedFile.path!).copy(destPath);
      return destPath;
    } catch (e) {
      debugPrint('Error picking video: $e');
      return null;
    }
  }

  // ========== ОТКРЫТИЕ ВИДЕО И URL ==========

  /// Проверить можно ли открыть URL
  static Future<bool> canLaunchUrl(String url) async {
    try {
      final uri = Uri.parse(url);
      return await launcher.canLaunchUrl(uri);
    } catch (e) {
      return false;
    }
  }

  /// Открыть URL в браузере
  static Future<void> launchUrlInBrowser(String url) async {
    try {
      final uri = Uri.parse(url);
      await launcher.launchUrl(
        uri,
        mode: launcher.LaunchMode.externalApplication,
      );
    } catch (e) {
      debugPrint('Ошибка открытия URL: $e');
    }
  }

  static Future<void> openVideo(BuildContext context, String url) async {
    try {
      bool opened = false;

      if (Platform.isWindows) {
        // На Windows используем cmd /c start
        if (isLocalFile(url)) {
          final result = await Process.run(
            'cmd',
            ['/c', 'start', '', url],
            runInShell: true,
          );
          opened = result.exitCode == 0;
        } else {
          final result = await Process.run(
            'cmd',
            ['/c', 'start', '', url],
            runInShell: true,
          );
          opened = result.exitCode == 0;
        }
      } else {
        // Android / iOS / macOS — используем url_launcher
        final uri = isLocalFile(url) ? Uri.file(url) : Uri.parse(url);
        if (await launcher.canLaunchUrl(uri)) {
          await launcher.launchUrl(uri,
              mode: launcher.LaunchMode.externalApplication);
          opened = true;
        }
      }

      if (!opened && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('❌ Не удалось открыть видео'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      debugPrint('Error opening video: $e');
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('❌ Ошибка: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  // ========== УДАЛЕНИЕ ЛОКАЛЬНОГО ФАЙЛА ==========

  static Future<void> deleteLocalVideo(String? path) async {
    if (path == null || !isLocalFile(path)) return;
    try {
      final file = File(path);
      if (await file.exists()) await file.delete();
    } catch (e) {
      debugPrint('Error deleting video: $e');
    }
  }
}

enum VideoType { youtube, youglish, localFile, other }


import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:image_picker/image_picker.dart';

/// Сервис для работы с изображениями карточек
class ImageService {
  static final ImagePicker _picker = ImagePicker();

  /// Получить путь к папке для хранения изображений
  static Future<String> _getImagesDirectory() async {
    final appDir = await getApplicationDocumentsDirectory();
    final imagesDir = Directory(p.join(appDir.path, 'card_images'));

    if (!await imagesDir.exists()) {
      await imagesDir.create(recursive: true);
    }

    return imagesDir.path;
  }

  /// Выбрать изображение из галереи
  static Future<String?> pickImageFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1920,
        maxHeight: 1920,
        imageQuality: 85,
      );

      if (image == null) return null;

      return await _saveImage(image.path);
    } catch (e) {
      debugPrint('Ошибка выбора изображения из галереи: $e');
      return null;
    }
  }

  /// Сделать фото с камеры
  static Future<String?> pickImageFromCamera() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 1920,
        maxHeight: 1920,
        imageQuality: 85,
      );

      if (image == null) return null;

      return await _saveImage(image.path);
    } catch (e) {
      debugPrint('Ошибка создания фото: $e');
      return null;
    }
  }

  /// Сохранить изображение локально
  static Future<String> _saveImage(String tempPath) async {
    final imagesDir = await _getImagesDirectory();
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final extension = p.extension(tempPath);
    final fileName = 'card_img_$timestamp$extension';
    final savedPath = p.join(imagesDir, fileName);

    final file = File(tempPath);
    await file.copy(savedPath);

    return savedPath;
  }

  /// Удалить изображение
  static Future<void> deleteImage(String? imagePath) async {
    if (imagePath == null || imagePath.isEmpty) return;

    try {
      final file = File(imagePath);
      if (await file.exists()) {
        await file.delete();
      }
    } catch (e) {
      debugPrint('Ошибка удаления изображения: $e');
    }
  }

  /// Проверить существует ли файл изображения
  static Future<bool> imageExists(String? imagePath) async {
    if (imagePath == null || imagePath.isEmpty) return false;

    try {
      final file = File(imagePath);
      return await file.exists();
    } catch (e) {
      return false;
    }
  }

  /// Показать диалог выбора источника изображения
  static Future<String?> showImageSourceDialog(
    BuildContext context, {
    required String title,
  }) async {
    final source = await showDialog<ImageSource>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Выбрать из галереи'),
              onTap: () => Navigator.pop(context, ImageSource.gallery),
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Сделать фото'),
              onTap: () => Navigator.pop(context, ImageSource.camera),
            ),
          ],
        ),
      ),
    );

    if (source == null) return null;

    if (source == ImageSource.camera) {
      return await pickImageFromCamera();
    } else {
      return await pickImageFromGallery();
    }
  }
}


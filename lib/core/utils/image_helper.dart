import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class ImageHelper {
  static final ImagePicker _picker = ImagePicker();

  /// Выбрать изображение из галереи
  static Future<String?> pickAndSaveImage() async {
    try {
      // Выбираем изображение
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1920,
        maxHeight: 1920,
        imageQuality: 85,
      );

      if (pickedFile == null) return null;

      // Сохраняем в папку приложения
      final savedPath = await _saveImageToAppDirectory(File(pickedFile.path));
      return savedPath;
    } catch (e) {
      debugPrint('Error picking image: $e');
      return null;
    }
  }

  /// Сохранить изображение в папку приложения
  static Future<String> _saveImageToAppDirectory(File imageFile) async {
    // Получаем папку документов приложения
    final appDir = await getApplicationDocumentsDirectory();
    final imagesDir = Directory(p.join(appDir.path, 'images'));

    // Создаём папку если её нет
    if (!await imagesDir.exists()) {
      await imagesDir.create(recursive: true);
    }

    // Генерируем уникальное имя файла
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final extension = p.extension(imageFile.path);
    final fileName = 'card_$timestamp$extension';
    final savedPath = p.join(imagesDir.path, fileName);

    // Копируем файл
    await imageFile.copy(savedPath);

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
      debugPrint('Error deleting image: $e');
    }
  }

  /// Проверить существует ли изображение
  static Future<bool> imageExists(String? imagePath) async {
    if (imagePath == null || imagePath.isEmpty) return false;
    final file = File(imagePath);
    return await file.exists();
  }
}


import 'package:flutter/material.dart';
import 'package:lexiflow/core/database/app_database.dart';
import 'package:lexiflow/core/services/import_export_service.dart';

class ImportScreen extends StatefulWidget {
  final AppDatabase db;

  const ImportScreen({
    super.key,
    required this.db,
  });

  @override
  State<ImportScreen> createState() => _ImportScreenState();
}

class _ImportScreenState extends State<ImportScreen> {
  bool _isImporting = false;
  String? _selectedFilePath;
  String? _selectedFormat;
  final _deckNameController = TextEditingController();

  @override
  void dispose() {
    _deckNameController.dispose();
    super.dispose();
  }

  Future<void> _pickFile() async {
    try {
      final filePath = await ImportExportService.pickImportFile();

      if (filePath != null) {
        setState(() {
          _selectedFilePath = filePath;
          _selectedFormat = _detectFormat(filePath);

          // Автоматически заполняем название колоды из имени файла
          final fileName = filePath.split('/').last.split('.').first;
          _deckNameController.text = fileName.replaceAll('_', ' ');
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Ошибка выбора файла: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  String _detectFormat(String filePath) {
    if (filePath.endsWith('.csv')) return 'CSV';
    if (filePath.endsWith('.json')) return 'JSON';
    if (filePath.endsWith('.lexiflow')) return 'LexiFlow';
    return 'Unknown';
  }

  Future<void> _import() async {
    if (_selectedFilePath == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Выберите файл для импорта')),
      );
      return;
    }

    if (_deckNameController.text.trim().isEmpty && _selectedFormat == 'CSV') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Введите название колоды')),
      );
      return;
    }

    setState(() => _isImporting = true);

    try {
      final service = ImportExportService(widget.db);
      int importedCount = 0;

      switch (_selectedFormat) {
        case 'CSV':
          importedCount = await service.importFromCSV(
            _selectedFilePath!,
            _deckNameController.text.trim(),
          );
          break;
        case 'JSON':
          importedCount = await service.importFromJSON(_selectedFilePath!);
          break;
        case 'LexiFlow':
          importedCount = await service.importFromLexiflow(_selectedFilePath!);
          break;
        default:
          throw Exception('Неподдерживаемый формат');
      }

      if (mounted) {
        Navigator.pop(context, true);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('✅ Импортировано карточек: $importedCount'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      setState(() => _isImporting = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Ошибка импорта: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Импорт карточек'),
      ),
      body: _isImporting
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Импортируем карточки...'),
                ],
              ),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Информация о форматах
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.info_outline,
                                  color: Colors.blue),
                              const SizedBox(width: 8),
                              Text(
                                'Поддерживаемые форматы',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          _buildFormatInfo(
                            '📄 CSV',
                            'Текстовый формат (Excel, Google Sheets)',
                            Colors.green,
                          ),
                          const SizedBox(height: 8),
                          _buildFormatInfo(
                            '📋 JSON',
                            'Структурированный формат данных',
                            Colors.blue,
                          ),
                          const SizedBox(height: 8),
                          _buildFormatInfo(
                            '📦 .lexiflow',
                            'Наш формат с изображениями и аудио',
                            Colors.purple,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Выбор файла
                  Text(
                    'Шаг 1: Выберите файл',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 12),

                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: _pickFile,
                      icon: const Icon(Icons.folder_open),
                      label: const Text('Выбрать файл'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ),

                  if (_selectedFilePath != null) ...[
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.green[50],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.green),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            _getFormatIcon(_selectedFormat!),
                            color: Colors.green,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Формат: $_selectedFormat',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                                Text(
                                  _selectedFilePath!.split('/').last,
                                  style: const TextStyle(fontSize: 12),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.close, size: 20),
                            onPressed: () {
                              setState(() {
                                _selectedFilePath = null;
                                _selectedFormat = null;
                                _deckNameController.clear();
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],

                  const SizedBox(height: 24),

                  // Название колоды (только для CSV)
                  if (_selectedFormat == 'CSV') ...[
                    Text(
                      'Шаг 2: Название колоды',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _deckNameController,
                      decoration: const InputDecoration(
                        labelText: 'Название колоды',
                        hintText: 'Английские слова',
                        border: OutlineInputBorder(),
                        helperText: 'CSV файлы не содержат информацию о колоде',
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],

                  // Кнопка импорта
                  if (_selectedFilePath != null) ...[
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton.icon(
                        onPressed: _import,
                        icon: const Icon(Icons.download),
                        label: const Text('Импортировать'),
                        style: FilledButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                      ),
                    ),
                  ],

                  const SizedBox(height: 32),

                  // Справка
                  Card(
                    color: Colors.blue[50],
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.help_outline,
                                  color: Colors.blue),
                              const SizedBox(width: 8),
                              Text(
                                'Как импортировать',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            '1. Выберите файл в формате CSV, JSON или .lexiflow\n'
                            '2. Для CSV укажите название колоды\n'
                            '3. Нажмите "Импортировать"\n'
                            '4. Карточки будут добавлены в новую колоду',
                            style: TextStyle(fontSize: 14),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'Совет: Используйте .lexiflow для импорта колод с изображениями и аудио',
                            style: TextStyle(
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildFormatInfo(String title, String description, Color color) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 40,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              Text(
                description,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }

  IconData _getFormatIcon(String format) {
    switch (format) {
      case 'CSV':
        return Icons.table_chart;
      case 'JSON':
        return Icons.code;
      case 'LexiFlow':
        return Icons.inventory_2;
      default:
        return Icons.description;
    }
  }
}

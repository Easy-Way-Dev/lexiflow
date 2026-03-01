import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lexiflow/core/database/app_database.dart';
import 'package:lexiflow/core/services/import_export_service.dart';
import 'package:lexiflow/shared/widgets/adaptive_layout.dart';

class ImportScreen extends StatefulWidget {
  final AppDatabase db;
  const ImportScreen({super.key, required this.db});

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
    final l = AppLocalizations.of(context)!;
    try {
      final filePath = await ImportExportService.pickImportFile();
      if (filePath != null) {
        setState(() {
          _selectedFilePath = filePath;
          _selectedFormat = _detectFormat(filePath);
          final fileName = filePath.split('/').last.split('.').first;
          _deckNameController.text = fileName.replaceAll('_', ' ');
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(l.selectFileError), backgroundColor: Colors.red),
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
    final l = AppLocalizations.of(context)!;
    if (_selectedFilePath == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(l.pickFileToImport)));
      return;
    }

    if (_deckNameController.text.trim().isEmpty && _selectedFormat == 'CSV') {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(l.enterDeckName)));
      return;
    }

    setState(() => _isImporting = true);

    try {
      final service = ImportExportService(widget.db);
      int importedCount = 0;

      switch (_selectedFormat) {
        case 'CSV':
          importedCount = await service.importFromCSV(
              _selectedFilePath!, _deckNameController.text.trim());
          break;
        case 'JSON':
          importedCount = await service.importFromJSON(_selectedFilePath!);
          break;
        case 'LexiFlow':
          importedCount = await service.importFromLexiflow(_selectedFilePath!);
          break;
        default:
          throw Exception('Unsupported format');
      }

      if (mounted) {
        Navigator.pop(context, true);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(l.importSuccess(importedCount)),
              backgroundColor: Colors.green),
        );
      }
    } catch (e) {
      setState(() => _isImporting = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(l.errorGeneric(e.toString())),
              backgroundColor: Colors.red),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l.importTitle)),
      body: AdaptiveLayout(
        maxWidth: AppLayout.narrowMaxWidth,
        child: _isImporting
            ? Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    const CircularProgressIndicator(),
                    const SizedBox(height: 16),
                    Text(l.importInProgress),
                  ]))
            : SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(children: [
                                  const Icon(Icons.info_outline,
                                      color: Colors.blue),
                                  const SizedBox(width: 8),
                                  Text(l.supportedFormats,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ]),
                                const SizedBox(height: 12),
                                _buildFormatInfo(
                                    '📄 CSV', l.formatCsvDesc, Colors.green),
                                const SizedBox(height: 8),
                                _buildFormatInfo(
                                    '📋 JSON', l.formatJsonDesc, Colors.blue),
                                const SizedBox(height: 8),
                                _buildFormatInfo('📦 .lexiflow',
                                    l.formatLexiflowDesc, Colors.purple),
                              ]),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(l.stepSelectFile,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: _pickFile,
                          icon: const Icon(Icons.folder_open),
                          label: Text(l.pickFile),
                          style: OutlinedButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16)),
                        ),
                      ),
                      if (_selectedFilePath != null) ...[
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: Colors.green[50],
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.green)),
                          child: Row(children: [
                            Icon(_getFormatIcon(_selectedFormat!),
                                color: Colors.green),
                            const SizedBox(width: 12),
                            Expanded(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                  Text(_selectedFormat!,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green)),
                                  Text(_selectedFilePath!.split('/').last,
                                      style: const TextStyle(fontSize: 12),
                                      overflow: TextOverflow.ellipsis),
                                ])),
                            IconButton(
                                icon: const Icon(Icons.close, size: 20),
                                onPressed: () => setState(() {
                                      _selectedFilePath = null;
                                      _selectedFormat = null;
                                      _deckNameController.clear();
                                    })),
                          ]),
                        ),
                      ],
                      const SizedBox(height: 24),
                      if (_selectedFormat == 'CSV') ...[
                        Text(l.stepDeckName,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 12),
                        TextField(
                          controller: _deckNameController,
                          decoration: InputDecoration(
                            labelText: l.setNameLabel,
                            hintText: l.setNameHint,
                            border: const OutlineInputBorder(),
                            helperText: l.csvHelperText,
                          ),
                        ),
                        const SizedBox(height: 24),
                      ],
                      if (_selectedFilePath != null)
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton.icon(
                            onPressed: _import,
                            icon: const Icon(Icons.download),
                            label: Text(l.importButton),
                            style: FilledButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16)),
                          ),
                        ),
                      const SizedBox(height: 32),
                      Card(
                        color: Colors.blue[50],
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(children: [
                                  const Icon(Icons.help_outline,
                                      color: Colors.blue),
                                  const SizedBox(width: 8),
                                  Text(l.howToImport,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                ]),
                                const SizedBox(height: 12),
                                Text(l.importInstructions,
                                    style: const TextStyle(fontSize: 14)),
                                const SizedBox(height: 12),
                                Text(l.importTip,
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontStyle: FontStyle.italic)),
                              ]),
                        ),
                      ),
                    ]),
              ),
      ),
    );
  }

  Widget _buildFormatInfo(String title, String description, Color color) {
    return Row(children: [
      Container(
          width: 4,
          height: 40,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(2))),
      const SizedBox(width: 12),
      Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title,
            style: TextStyle(fontWeight: FontWeight.bold, color: color)),
        Text(description, style: const TextStyle(fontSize: 12)),
      ])),
    ]);
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


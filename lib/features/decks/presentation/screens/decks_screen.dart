import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lexiflow/core/database/app_database.dart';
import 'package:lexiflow/core/services/import_export_service.dart';
import 'package:lexiflow/core/utils/audio_helper.dart';
import 'package:lexiflow/features/cards/presentation/screens/import_screen.dart';
import 'package:drift/drift.dart' as drift;
import 'package:lexiflow/features/cards/presentation/screens/cards_list_screen.dart';
import 'package:lexiflow/main.dart';
import 'package:file_picker/file_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path_provider/path_provider.dart';
import 'package:lexiflow/app/onboarding_screen.dart';
import 'package:lexiflow/app/paywall_screen.dart';

String _transliterate(String text) {
  const map = {
    'а': 'a',
    'б': 'b',
    'в': 'v',
    'г': 'g',
    'д': 'd',
    'е': 'e',
    'ё': 'yo',
    'ж': 'zh',
    'з': 'z',
    'и': 'i',
    'й': 'y',
    'к': 'k',
    'л': 'l',
    'м': 'm',
    'н': 'n',
    'о': 'o',
    'п': 'p',
    'р': 'r',
    'с': 's',
    'т': 't',
    'у': 'u',
    'ф': 'f',
    'х': 'h',
    'ц': 'ts',
    'ч': 'ch',
    'ш': 'sh',
    'щ': 'sch',
    'ъ': '',
    'ы': 'y',
    'ь': '',
    'э': 'e',
    'ю': 'yu',
    'я': 'ya',
    'А': 'A',
    'Б': 'B',
    'В': 'V',
    'Г': 'G',
    'Д': 'D',
    'Е': 'E',
    'Ё': 'Yo',
    'Ж': 'Zh',
    'З': 'Z',
    'И': 'I',
    'Й': 'Y',
    'К': 'K',
    'Л': 'L',
    'М': 'M',
    'Н': 'N',
    'О': 'O',
    'П': 'P',
    'Р': 'R',
    'С': 'S',
    'Т': 'T',
    'У': 'U',
    'Ф': 'F',
    'Х': 'H',
    'Ц': 'Ts',
    'Ч': 'Ch',
    'Ш': 'Sh',
    'Щ': 'Sch',
    'Ъ': '',
    'Ы': 'Y',
    'Ь': '',
    'Э': 'E',
    'Ю': 'Yu',
    'Я': 'Ya',
    'і': 'i',
    'ї': 'yi',
    'є': 'ye',
    'ґ': 'g',
    'І': 'I',
    'Ї': 'Yi',
    'Є': 'Ye',
    'Ґ': 'G',
    ' ': '_',
    '-': '_',
  };
  return text
      .split('')
      .map((c) => map[c] ?? c)
      .join('')
      .replaceAll(RegExp(r'[^\w._-]'), '');
}

class DecksScreen extends StatefulWidget {
  final AppDatabase db;
  const DecksScreen({super.key, required this.db});
  @override
  State<DecksScreen> createState() => _DecksScreenState();
}

class _DecksScreenState extends State<DecksScreen>
    with TickerProviderStateMixin {
  List<Deck> _decks = [];
  bool _isLoading = true;
  int _currentStreak = 0;

  late AnimationController _pulseController;
  late AnimationController _gradientController;
  late Animation<double> _pulseAnimation;
  late Animation<Alignment> _gradientBegin;
  late Animation<Alignment> _gradientEnd;

  @override
  void initState() {
    super.initState();
    _loadDecksAndStats();
    _fixLegacyLanguageCodes();

    _pulseController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500))
      ..repeat(reverse: true);
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.03).animate(
        CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut));

    _gradientController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..repeat(reverse: true);
    _gradientBegin =
        Tween<Alignment>(begin: Alignment.topLeft, end: Alignment.bottomRight)
            .animate(_gradientController);
    _gradientEnd =
        Tween<Alignment>(begin: Alignment.bottomRight, end: Alignment.topLeft)
            .animate(_gradientController);
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _gradientController.dispose();
    super.dispose();
  }

  Future<void> _loadDecksAndStats() async {
    setState(() => _isLoading = true);
    try {
      final decks = await widget.db.getAllDecks();
      final streak = await widget.db.getCurrentStreak();
      setState(() {
        _decks = decks;
        _currentStreak = streak;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        final l = AppLocalizations.of(context);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(l.errorGeneric(e.toString()))));
      }
    }
  }

  Future<void> _fixLegacyLanguageCodes() async {
    try {
      final legacyDecks = await (widget.db.select(widget.db.decks)
            ..where((t) =>
                t.sourceLanguage.isIn(['en-US', 'en-GB', 'en-CA']) |
                t.targetLanguage.isIn(['en-US', 'en-GB', 'en-CA'])))
          .get();
      if (legacyDecks.isEmpty) {
        return;
      }
      for (final deck in legacyDecks) {
        await widget.db.into(widget.db.decks).insertOnConflictUpdate(
              deck.toCompanion(true).copyWith(
                    sourceLanguage: drift.Value(
                        deck.sourceLanguage.startsWith('en-')
                            ? 'en'
                            : deck.sourceLanguage),
                    targetLanguage: drift.Value(
                        deck.targetLanguage.startsWith('en-')
                            ? 'en'
                            : deck.targetLanguage),
                  ),
            );
      }
      _loadDecksAndStats();
    } catch (e) {
      debugPrint('Migration error: $e');
    }
  }

  String _getLanguageName(String code) {
    final map = {
      'en': 'EN 🇺🇸',
      'ru': 'RU 🇷🇺',
      'es': 'ES 🇪🇸',
      'fr': 'FR 🇫🇷',
      'de': 'DE 🇩🇪',
      'it': 'IT 🇮🇹',
      'uk': 'UK 🇺🇦'
    };
    return map[code] ?? code.toUpperCase();
  }

  void _showStoreAndStreaksDialog() {
    HapticFeedback.lightImpact();
    final l = AppLocalizations.of(context);

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Theme.of(context).colorScheme.surface,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          insetPadding: const EdgeInsets.all(16),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 450, maxHeight: 600),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.local_fire_department,
                              color: Colors.orange, size: 36),
                          const SizedBox(width: 8),
                          Text(l.streakDays(_currentStreak),
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(l.streakDesc,
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 14)),
                    ],
                  ),
                ),
                const Divider(height: 1),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      _buildMilestoneReward(
                          dayRequired: 5,
                          title: l.streakReward1,
                          icon: Icons.palette,
                          color: Colors.purple),
                      _buildMilestoneReward(
                          dayRequired: 10,
                          title: l.streakReward2,
                          icon: Icons.star_border,
                          color: Colors.blueGrey),
                      _buildMilestoneReward(
                          dayRequired: 15,
                          title: l.streakReward3,
                          icon: Icons.music_note,
                          color: Colors.blue),
                      _buildMilestoneReward(
                          dayRequired: 20,
                          title: l.streakReward4,
                          icon: Icons.work,
                          color: Colors.teal),
                      _buildMilestoneReward(
                          dayRequired: 25,
                          title: l.streakReward5,
                          icon: Icons.movie,
                          color: Colors.red,
                          oldPrice: '\$19.99'),
                      _buildMilestoneReward(
                          dayRequired: 30,
                          title: l.streakReward6,
                          icon: Icons.workspace_premium,
                          color: Colors.amber),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () => Navigator.pop(context),
                      style: FilledButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16))),
                      child: Text(l.streakGotIt,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMilestoneReward(
      {required int dayRequired,
      required String title,
      required IconData icon,
      required Color color,
      String? oldPrice}) {
    final l = AppLocalizations.of(context);
    final bool isUnlocked = _currentStreak >= dayRequired;
    final double progress = (_currentStreak / dayRequired).clamp(0.0, 1.0);
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: isUnlocked
            ? color.withValues(alpha: 0.1)
            : Theme.of(context).cardColor,
        border: Border.all(
            color: isUnlocked
                ? color.withValues(alpha: 0.5)
                : Colors.grey.withValues(alpha: 0.2),
            width: 2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: isUnlocked ? color : Colors.grey[200],
                      shape: BoxShape.circle),
                  child: Icon(isUnlocked ? icon : Icons.lock,
                      color: isUnlocked ? Colors.white : Colors.grey[400]),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Text(title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: isUnlocked
                                          ? Theme.of(context)
                                              .colorScheme
                                              .onSurface
                                          : Colors.grey[600]))),
                          if (oldPrice != null && !isUnlocked)
                            Text(oldPrice,
                                style: const TextStyle(
                                    color: Colors.red,
                                    decoration: TextDecoration.lineThrough,
                                    fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                          isUnlocked
                              ? l.streakUnlocked
                              : l.streakAvailableOn(dayRequired),
                          style: TextStyle(
                              color:
                                  isUnlocked ? Colors.green : Colors.grey[500],
                              fontWeight: isUnlocked
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              fontSize: 13)),
                    ],
                  ),
                ),
              ],
            ),
            if (!isUnlocked) ...[
              const SizedBox(height: 12),
              LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey[200],
                  color: color,
                  borderRadius: BorderRadius.circular(4)),
            ]
          ],
        ),
      ),
    );
  }

  void _showMicroSessionOptions() {
    HapticFeedback.lightImpact();
    final l = AppLocalizations.of(context);
    final currentAppLocale = Localizations.localeOf(context).languageCode;
    final mixPairs = _decks
        .map((d) => '${d.sourceLanguage}||${d.targetLanguage}')
        .toSet()
        .toList();

    String? selectedFilter;
    try {
      final defaultPair = mixPairs.firstWhere(
          (pair) => pair.split('||')[1].startsWith(currentAppLocale));
      selectedFilter = 'mix_$defaultPair';
    } catch (e) {
      if (mixPairs.isNotEmpty) {
        selectedFilter = 'mix_${mixPairs.first}';
      }
    }

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Theme.of(context).colorScheme.surface,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          insetPadding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 450),
            child: StatefulBuilder(builder: (context, setDialogState) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.bolt,
                          size: 48, color: Color(0xFF6366F1)),
                      const SizedBox(height: 16),
                      Text(l.microSessionFormat,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center),
                      const SizedBox(height: 8),
                      Text(l.microSessionDesc,
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 15)),
                      const SizedBox(height: 32),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                color: Colors.grey.withValues(alpha: 0.2),
                                width: 2)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedFilter,
                            isExpanded: true,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: [
                              ...mixPairs.map((pair) {
                                final parts = pair.split('||');
                                return DropdownMenuItem<String>(
                                    value: 'mix_$pair',
                                    child: Text(
                                        l.microSessionMix(
                                            _getLanguageName(parts[0]),
                                            _getLanguageName(parts[1])),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                        overflow: TextOverflow.ellipsis));
                              }),
                              if (mixPairs.isNotEmpty && _decks.isNotEmpty)
                                const DropdownMenuItem<String>(
                                    value: 'divider',
                                    enabled: false,
                                    child: Divider()),
                              ..._decks.map((deck) => DropdownMenuItem<String>(
                                  value: 'deck_${deck.id}',
                                  child: Text('📁 ${deck.name}',
                                      overflow: TextOverflow.ellipsis))),
                            ],
                            onChanged: (value) {
                              if (value != 'divider' && value != null) {
                                setDialogState(() => selectedFilter = value);
                              }
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      _buildSessionOptionCard(
                          title: l.microSessionExpress,
                          subtitle: l.microSessionExpressDesc,
                          icon: Icons.timer,
                          color: const Color(0xFF6366F1),
                          onTap: () {
                            Navigator.pop(context);
                            _startMicroSession(5, filter: selectedFilter);
                          }),
                      const SizedBox(height: 16),
                      _buildSessionOptionCard(
                          title: l.microSessionDeep,
                          subtitle: l.microSessionDeepDesc,
                          icon: Icons.local_fire_department,
                          color: const Color(0xFFEC4899),
                          onTap: () {
                            Navigator.pop(context);
                            _startMicroSession(10, filter: selectedFilter);
                          }),
                      const SizedBox(height: 24),
                      TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(l.cancel,
                              style: TextStyle(
                                  color: Colors.grey[600], fontSize: 16)))
                    ],
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }

  Widget _buildSessionOptionCard(
      {required String title,
      required String subtitle,
      required IconData icon,
      required Color color,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            border: Border.all(color: color.withValues(alpha: 0.3), width: 2),
            borderRadius: BorderRadius.circular(16),
            color: color.withValues(alpha: 0.05)),
        child: Row(
          children: [
            Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.1),
                    shape: BoxShape.circle),
                child: Icon(icon, color: color, size: 28)),
            const SizedBox(width: 16),
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text(title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18)),
                  const SizedBox(height: 4),
                  Text(subtitle,
                      style: TextStyle(color: Colors.grey[600], fontSize: 13))
                ])),
            Icon(Icons.arrow_forward_ios, color: Colors.grey[400], size: 16),
          ],
        ),
      ),
    );
  }

  Future<void> _startMicroSession(int count, {String? filter}) async {
    final l = AppLocalizations.of(context);

    if (filter == null) {
      return;
    }
    List<CardData> targetCards = [];

    if (filter.startsWith('mix_')) {
      final pair = filter.replaceFirst('mix_', '').split('||');
      final matchingDeckIds = _decks
          .where(
              (d) => d.sourceLanguage == pair[0] && d.targetLanguage == pair[1])
          .map((d) => d.id)
          .toList();
      final allCards = await widget.db.select(widget.db.cards).get();
      targetCards =
          allCards.where((c) => matchingDeckIds.contains(c.deckId)).toList();
    } else if (filter.startsWith('deck_')) {
      final deckId = int.tryParse(filter.replaceFirst('deck_', ''));
      if (deckId != null) {
        targetCards = await widget.db.getCardsByDeckId(deckId);
      }
    }

    if (targetCards.isEmpty) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(l.microSessionEmpty),
            backgroundColor: Theme.of(context).colorScheme.error,
            behavior: SnackBarBehavior.floating));
      }
      return;
    }

    targetCards.shuffle();
    final sessionCards = targetCards.take(count).toList();

    if (mounted) {
      showGeneralDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: Theme.of(context).colorScheme.surface,
        transitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (context, animation, secondaryAnimation) =>
            MicroSessionOverlay(
                initialCards: sessionCards,
                db: widget.db,
                requestedCount: count,
                currentFilter: filter),
      ).then((_) => _loadDecksAndStats());
    }
  }

  Future<void> _exportDeck(Deck deck) async {
    final l = AppLocalizations.of(context);
    showModalBottomSheet(
        context: context,
        backgroundColor: Theme.of(context).colorScheme.surface,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
        builder: (context) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(2))),
                  const SizedBox(height: 24),
                  Text(l.exportFormatTitle,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 24),
                  ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    leading: const Icon(Icons.inventory_2,
                        color: Colors.blue, size: 32),
                    title: const Text('.lexiflow',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    subtitle: Text(l.exportLexiflowDesc,
                        style: TextStyle(color: Colors.grey)),
                    trailing: const Icon(Icons.download, color: Colors.blue),
                    onTap: () {
                      Navigator.pop(context);
                      _processExportToLexiflow(deck);
                    },
                  ),
                  const Divider(height: 1),
                  ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    leading: const Icon(Icons.table_chart,
                        color: Colors.green, size: 32),
                    title: Row(children: [
                      Text(l.exportCsvTitle,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      const SizedBox(width: 8),
                      const Icon(Icons.workspace_premium,
                          color: Colors.amber, size: 18)
                    ]),
                    subtitle: Text(l.exportCsvDesc,
                        style: TextStyle(color: Colors.grey)),
                    trailing: const Icon(Icons.lock, color: Colors.amber),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const PaywallScreen()));
                    },
                  ),
                  const Divider(height: 1),
                  ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    leading: const Icon(Icons.data_object,
                        color: Colors.purple, size: 32),
                    title: Row(children: [
                      Text(l.exportJsonTitle,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      const SizedBox(width: 8),
                      const Icon(Icons.workspace_premium,
                          color: Colors.amber, size: 18)
                    ]),
                    subtitle: Text(l.exportJsonDesc,
                        style: TextStyle(color: Colors.grey)),
                    trailing: const Icon(Icons.lock, color: Colors.amber),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const PaywallScreen()));
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future<void> _processExportToLexiflow(Deck deck) async {
    final l = AppLocalizations.of(context);
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Row(children: [
            const SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(
                    strokeWidth: 2, color: Colors.white)),
            const SizedBox(width: 12),
            Text(l.exportCreating(deck.name))
          ]),
          duration: const Duration(seconds: 30),
          backgroundColor: Colors.blue[700]));
    }
    try {
      final service = ImportExportService(widget.db);
      final filePath = await service.exportToLexiflow(deck.id);
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      await _showExportDialog(deck, filePath);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(l.exportError(e.toString())),
            backgroundColor: Colors.red));
      }
    }
  }

  Future<void> _showDeckDialog({Deck? deckToEdit}) async {
    final l = AppLocalizations.of(context);
    final isEditing = deckToEdit != null;
    final nameController =
        TextEditingController(text: isEditing ? deckToEdit.name : '');
    final descController = TextEditingController(
        text: isEditing ? (deckToEdit.description ?? '') : '');

    // Подставляем целевой язык на основе языка приложения, если мы создаем новую колоду
    final currentAppLocale = Localizations.localeOf(context).languageCode;
    String defaultTarget =
        ['ru', 'uk', 'en'].contains(currentAppLocale) ? currentAppLocale : 'ru';

    String sourceLang = isEditing ? deckToEdit.sourceLanguage : 'en';
    String targetLang = isEditing ? deckToEdit.targetLanguage : defaultTarget;

    final result = await showDialog<bool>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: Text(isEditing ? l.editSet : l.createSetTitle),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                        labelText: l.setNameLabel,
                        hintText: l.setNameHint,
                        border: const OutlineInputBorder()),
                    autofocus: true),
                const SizedBox(height: 16),
                TextField(
                    controller: descController,
                    decoration: InputDecoration(
                        labelText: l.setDescriptionLabel,
                        border: const OutlineInputBorder()),
                    maxLines: 2),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: sourceLang,
                  decoration: InputDecoration(
                      labelText: l.studyLanguageLabel,
                      border: const OutlineInputBorder()),
                  items: const [
                    DropdownMenuItem(value: 'en', child: Text('🇺🇸 English')),
                    DropdownMenuItem(value: 'es', child: Text('🇪🇸 Español')),
                    DropdownMenuItem(value: 'fr', child: Text('🇫🇷 Français')),
                    DropdownMenuItem(value: 'de', child: Text('🇩🇪 Deutsch')),
                    DropdownMenuItem(value: 'it', child: Text('🇮🇹 Italiano')),
                  ],
                  onChanged: (v) =>
                      v != null ? setDialogState(() => sourceLang = v) : null,
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: targetLang,
                  decoration: InputDecoration(
                      labelText: l.nativeLanguageLabel,
                      border: const OutlineInputBorder()),
                  items: const [
                    DropdownMenuItem(value: 'en', child: Text('🇺🇸 English')),
                    DropdownMenuItem(value: 'ru', child: Text('🇷🇺 Русский')),
                    DropdownMenuItem(
                        value: 'uk', child: Text('🇺🇦 Українська')),
                  ],
                  onChanged: (v) =>
                      v != null ? setDialogState(() => targetLang = v) : null,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text(l.cancel)),
            FilledButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text(isEditing ? l.save : l.create)),
          ],
        ),
      ),
    );

    if (result == true && nameController.text.isNotEmpty) {
      final companion = DecksCompanion(
        id: isEditing ? drift.Value(deckToEdit.id) : const drift.Value.absent(),
        name: drift.Value(nameController.text.trim()),
        description: drift.Value(descController.text.trim().isEmpty
            ? null
            : descController.text.trim()),
        sourceLanguage: drift.Value(sourceLang),
        targetLanguage: drift.Value(targetLang),
        createdAt: isEditing
            ? drift.Value(deckToEdit.createdAt)
            : drift.Value(DateTime.now()),
      );
      await widget.db.into(widget.db.decks).insertOnConflictUpdate(companion);
      _loadDecksAndStats();
    }
  }

  Future<void> _deleteDeck(Deck deck) async {
    final l = AppLocalizations.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l.deleteSetTitle),
        content: Text(l.deleteSetContent(deck.name)),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(l.cancel)),
          FilledButton(
              onPressed: () => Navigator.pop(context, true),
              style: FilledButton.styleFrom(backgroundColor: Colors.red),
              child: Text(l.delete)),
        ],
      ),
    );
    if (confirmed == true) {
      await widget.db.deleteDeck(deck.id);
      _loadDecksAndStats();
    }
  }

  Future<void> _showExportDialog(Deck deck, String filePath) async {
    final l = AppLocalizations.of(context);
    final pathController = TextEditingController(text: filePath);

    await showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          title: Row(children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 32),
            const SizedBox(width: 12),
            Text(l.exportReady)
          ]),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('📦 ${deck.name}.lexiflow',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 6),
                Text('${l.totalCards}: ${deck.totalCards}',
                    style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                const SizedBox(height: 20),
                Text(l.shareWith,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 15)),
                const SizedBox(height: 16),
                Column(
                  children: [
                    Row(children: [
                      Expanded(
                          child: _buildBigShareButton(
                              emoji: '✈️',
                              label: 'Telegram',
                              color: const Color(0xFF0088CC),
                              onTap: () => _shareToTelegram(filePath))),
                      const SizedBox(width: 12),
                      Expanded(
                          child: _buildBigShareButton(
                              emoji: '💬',
                              label: 'WhatsApp',
                              color: const Color(0xFF25D366),
                              onTap: () => _shareToWhatsApp(filePath))),
                      const SizedBox(width: 12),
                      Expanded(
                          child: _buildBigShareButton(
                              emoji: '📘',
                              label: 'Facebook',
                              color: const Color(0xFF1877F2),
                              onTap: () => _shareToFacebook(filePath))),
                    ]),
                    const SizedBox(height: 12),
                    Row(children: [
                      Expanded(
                          child: _buildBigShareButton(
                              emoji: '📧',
                              label: 'Email',
                              color: const Color(0xFFEA4335),
                              onTap: () => _shareToEmail(filePath, deck.name))),
                      const SizedBox(width: 12),
                      Expanded(
                          child: _buildBigShareButton(
                              emoji: '💾',
                              label: 'Discord',
                              color: const Color(0xFF5865F2),
                              onTap: () => _shareToDiscord(filePath))),
                      const SizedBox(width: 12),
                      Expanded(
                          child: _buildBigShareButton(
                              emoji: '📤',
                              label: l.share,
                              color: const Color(0xFF757575),
                              onTap: () => _shareToApp(filePath, deck.name))),
                    ]),
                  ],
                ),
                const SizedBox(height: 20),
                Text(l.exportPath,
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[700])),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                        child: TextField(
                            controller: pathController,
                            decoration: InputDecoration(
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 10),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                prefixIcon: const Icon(Icons.folder, size: 18)),
                            style: const TextStyle(fontSize: 12),
                            readOnly: true)),
                    const SizedBox(width: 8),
                    OutlinedButton.icon(
                      onPressed: () async {
                        final newPath =
                            await _pickSaveLocation(deck.name, filePath);
                        if (newPath != null) {
                          setDialogState(() => pathController.text = newPath);
                        }
                      },
                      icon: const Icon(Icons.folder_open, size: 18),
                      label: Text(l.exportBrowse),
                      style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context), child: Text(l.close))
          ],
        ),
      ),
    );
  }

  Future<String> _getDownloadsPath() async {
    if (Platform.isWindows) {
      return '${Platform.environment['USERPROFILE']}\\Downloads';
    } else if (Platform.isAndroid) {
      return (await getExternalStorageDirectory())?.path ??
          '/storage/emulated/0/Download';
    } else if (Platform.isIOS || Platform.isMacOS) {
      return (await getApplicationDocumentsDirectory()).path;
    }
    return Platform.environment['HOME'] ?? '/tmp';
  }

  Future<String?> _pickSaveLocation(String deckName, String currentPath) async {
    final l = AppLocalizations.of(context);
    try {
      final downloadsPath = await _getDownloadsPath();
      final result = await FilePicker.platform.saveFile(
          dialogTitle: l.exportSaveTitle,
          initialDirectory: downloadsPath,
          fileName: '${_transliterate(deckName)}.lexiflow',
          allowedExtensions: ['lexiflow'],
          type: FileType.custom);
      if (result != null) {
        await File(currentPath).copy(result);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(l.exportSaved(result)),
              backgroundColor: Colors.green));
        }
        return result;
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(l.errorGeneric(e.toString()))));
      }
    }
    return null;
  }

  Widget _buildBigShareButton(
      {required String emoji,
      required String label,
      required Color color,
      required VoidCallback onTap}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: 72,
          decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
              border:
                  Border.all(color: color.withValues(alpha: 0.3), width: 1.5)),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(emoji, style: const TextStyle(fontSize: 28)),
            const SizedBox(height: 4),
            Text(label,
                style: TextStyle(
                    color: color, fontWeight: FontWeight.bold, fontSize: 13),
                textAlign: TextAlign.center)
          ]),
        ),
      ),
    );
  }

  Future<void> _shareToTelegram(String path) async {
    try {
      final uri = Uri.parse('tg://msg');
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        _shareToApp(path, '');
      }
    } catch (e) {
      _shareToApp(path, '');
    }
  }

  Future<void> _shareToWhatsApp(String path) async {
    try {
      final uri = Uri.parse('whatsapp://send');
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        _shareToApp(path, '');
      }
    } catch (e) {
      _shareToApp(path, '');
    }
  }

  Future<void> _shareToFacebook(String path) async {
    try {
      final uri = Uri.parse('fb://');
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        _shareToApp(path, '');
      }
    } catch (e) {
      _shareToApp(path, '');
    }
  }

  Future<void> _shareToEmail(String path, String name) async {
    try {
      final uri = Uri(scheme: 'mailto', queryParameters: {
        'subject': 'LexiFlow: $name',
        'body': 'File: ${path.split(Platform.pathSeparator).last}'
      });
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        _shareToApp(path, name);
      }
    } catch (e) {
      _shareToApp(path, name);
    }
  }

  Future<void> _shareToDiscord(String path) async {
    try {
      final uri = Uri.parse('discord://');
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        _shareToApp(path, '');
      }
    } catch (e) {
      _shareToApp(path, '');
    }
  }

  Future<void> _shareToApp(String filePath, String deckName) async {
    try {
      await ImportExportService.shareToMessengers(filePath, deckName: deckName);
    } catch (e) {
      if (mounted) {
        final l = AppLocalizations.of(context);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(l.errorGeneric(e.toString()))));
      }
    }
  }

  void _showLanguageSettings() async {
    final l = AppLocalizations.of(context);
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l.settingsLanguage),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildLangOption('en', '🇺🇸', 'English (US)'),
            _buildLangOption('ru', '🇷🇺', 'Русский'),
            _buildLangOption('uk', '🇺🇦', 'Українська'),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context), child: Text(l.close))
        ],
      ),
    );
  }

  Widget _buildLangOption(String code, String flag, String name) {
    final current = LexiFlowApp.localeNotifier.value.languageCode;
    final isSelected = current == code;
    return ListTile(
      leading: Text(flag, style: const TextStyle(fontSize: 28)),
      title: Text(name),
      trailing: isSelected
          ? Icon(Icons.check_circle,
              color: Theme.of(context).colorScheme.primary)
          : null,
      selected: isSelected,
      onTap: () async {
        await widget.db.setSetting('app_locale', code);
        LexiFlowApp.setLocale(Locale(code));
        if (mounted) {
          Navigator.pop(context);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(l.setsTitle),
        leadingWidth: 80,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
          child: ActionChip(
            backgroundColor:
                Theme.of(context).colorScheme.surfaceContainerHighest,
            side: BorderSide.none,
            avatar: const Icon(Icons.local_fire_department,
                color: Colors.orange, size: 20),
            label: Text('$_currentStreak',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            onPressed: _showStoreAndStreaksDialog,
          ),
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.school, color: Colors.blue),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OnboardingScreen(db: widget.db))),
              tooltip: 'Onboarding Test'),
          IconButton(
              icon: const Icon(Icons.language),
              onPressed: _showLanguageSettings,
              tooltip: l.settingsLanguage),
          IconButton(
              icon: const Icon(Icons.file_download),
              onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ImportScreen(db: widget.db)))
                  .then((_) => _loadDecksAndStats()),
              tooltip: l.importButton),
          IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: _loadDecksAndStats,
              tooltip: l.refresh),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: AnimatedBuilder(
                    animation: Listenable.merge(
                        [_pulseAnimation, _gradientController]),
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _pulseAnimation.value,
                        child: InkWell(
                          onTap: _showMicroSessionOptions,
                          borderRadius: BorderRadius.circular(16),
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 16),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: const [
                                      Color(0xFF6366F1),
                                      Color(0xFFEC4899),
                                      Color(0xFF6366F1)
                                    ],
                                    begin: _gradientBegin.value,
                                    end: _gradientEnd.value),
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                      color: const Color(0xFFEC4899)
                                          .withValues(alpha: 0.3),
                                      blurRadius: 15,
                                      spreadRadius: 2,
                                      offset: const Offset(0, 5))
                                ]),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.bolt,
                                      color: Colors.white, size: 28),
                                  const SizedBox(width: 8),
                                  Text(l.microSessionTitle,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 0.5))
                                ]),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                    child: _decks.isEmpty
                        ? _buildEmptyState(l)
                        : ListView.builder(
                            padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
                            itemCount: _decks.length,
                            itemBuilder: (context, index) =>
                                _buildDeckCard(_decks[index], l))),
              ],
            ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => _showDeckDialog(),
          icon: const Icon(Icons.add),
          label: Text(l.newSet)),
    );
  }

  Widget _buildEmptyState(AppLocalizations l) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.folder_open, size: 80, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(l.noSets,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: Colors.grey[600])),
          const SizedBox(height: 8),
          Text(l.noSetsSubtitle, style: TextStyle(color: Colors.grey[500])),
          const SizedBox(height: 24),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              FilledButton.icon(
                  onPressed: () => _showDeckDialog(),
                  icon: const Icon(Icons.add),
                  label: Text(l.createSet)),
              OutlinedButton.icon(
                  onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ImportScreen(db: widget.db)))
                      .then((_) => _loadDecksAndStats()),
                  icon: const Icon(Icons.file_download),
                  label: Text(l.importButton)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDeckCard(Deck deck, AppLocalizations l) {
    final progress =
        deck.totalCards > 0 ? deck.masteredCards / deck.totalCards : 0.0;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CardsListScreen(
                    db: widget.db,
                    deckId: deck.id,
                    deckName: deck.name))).then((_) => _loadDecksAndStats()),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Text(deck.name,
                            style: Theme.of(context).textTheme.titleLarge),
                        if (deck.description != null &&
                            deck.description!.isNotEmpty)
                          Text(deck.description!,
                              style: TextStyle(
                                  color: Colors.grey[600], fontSize: 13))
                      ])),
                  IconButton(
                      icon: const Icon(Icons.share, color: Colors.blue),
                      onPressed: () => _exportDeck(deck),
                      tooltip: l.exportShare),
                  PopupMenuButton<String>(
                    icon: const Icon(Icons.more_vert),
                    onSelected: (val) {
                      if (val == 'export') {
                        _exportDeck(deck);
                      }
                      if (val == 'edit') {
                        _showDeckDialog(deckToEdit: deck);
                      }
                      if (val == 'delete') {
                        _deleteDeck(deck);
                      }
                    },
                    itemBuilder: (context) => [
                      PopupMenuItem(
                          value: 'export',
                          child: Row(children: [
                            const Icon(Icons.ios_share,
                                color: Colors.blue, size: 18),
                            const SizedBox(width: 8),
                            Text(l.exportShare)
                          ])),
                      PopupMenuItem(
                          value: 'edit',
                          child: Row(children: [
                            const Icon(Icons.edit,
                                color: Colors.orange, size: 18),
                            const SizedBox(width: 8),
                            Text(l.edit)
                          ])),
                      PopupMenuItem(
                          value: 'delete',
                          child: Row(children: [
                            const Icon(Icons.delete,
                                color: Colors.red, size: 18),
                            const SizedBox(width: 8),
                            Text(l.delete,
                                style: const TextStyle(color: Colors.red))
                          ])),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  _buildLangChip(deck.sourceLanguage),
                  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(Icons.arrow_forward, size: 16)),
                  _buildLangChip(deck.targetLanguage),
                  const Spacer(),
                  Text('${deck.totalCards} ${l.cards}',
                      style: const TextStyle(fontSize: 13)),
                ],
              ),
              const SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(l.progress, style: const TextStyle(fontSize: 12)),
                        Text(
                            '${deck.masteredCards}/${deck.totalCards} (${(progress * 100).toStringAsFixed(0)}%)',
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold))
                      ]),
                  const SizedBox(height: 4),
                  LinearProgressIndicator(
                      value: progress,
                      backgroundColor: Colors.grey[200],
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(4)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLangChip(String langCode) {
    final langNames = {
      'en': 'EN',
      'ru': 'RU',
      'uk': 'UK',
      'es': 'ES',
      'fr': 'FR',
      'de': 'DE',
      'it': 'IT'
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
          color: Colors.blue[50], borderRadius: BorderRadius.circular(4)),
      child: Text(langNames[langCode] ?? langCode.toUpperCase(),
          style: const TextStyle(
              color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 12)),
    );
  }
}

class MicroSessionOverlay extends StatefulWidget {
  final List<CardData> initialCards;
  final int requestedCount;
  final String currentFilter;
  final AppDatabase db;

  const MicroSessionOverlay(
      {super.key,
      required this.initialCards,
      required this.db,
      required this.requestedCount,
      required this.currentFilter});
  @override
  State<MicroSessionOverlay> createState() => _MicroSessionOverlayState();
}

class _MicroSessionOverlayState extends State<MicroSessionOverlay>
    with SingleTickerProviderStateMixin {
  late List<CardData> _currentCards;
  int _currentIndex = 0;
  bool _isFlipped = false;
  int _correctAnswers = 0;
  late AnimationController _flipController;

  // Свайп-состояние для анимации смещения карточки
  double _swipeDx = 0.0;

  @override
  void initState() {
    super.initState();
    _currentCards = List.from(widget.initialCards);
    _flipController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
  }

  @override
  void dispose() {
    _flipController.dispose();
    AudioHelper.stopAudio();
    super.dispose();
  }

  void _flipCard() {
    HapticFeedback.lightImpact();
    if (_isFlipped) {
      _flipController.reverse();
    } else {
      _flipController.forward();
    }
    setState(() => _isFlipped = !_isFlipped);
  }

  void _nextCard(bool isKnown) async {
    HapticFeedback.mediumImpact();
    AudioHelper.stopAudio();
    if (isKnown) {
      _correctAnswers++;
    }

    if (_currentIndex < _currentCards.length - 1) {
      setState(() {
        _currentIndex++;
        _isFlipped = false;
        _swipeDx = 0;
        _flipController.reset();
      });
    } else {
      await widget.db.updateDailyStats(
        cardsStudied: _currentCards.length,
        correct: _correctAnswers,
        incorrect: _currentCards.length - _correctAnswers,
      );
      setState(() => _currentIndex++);
      HapticFeedback.heavyImpact();
    }
  }

  void _repeatCurrentCards() {
    setState(() {
      _currentIndex = 0;
      _correctAnswers = 0;
      _isFlipped = false;
      _swipeDx = 0;
      _flipController.reset();
    });
  }

  Future<void> _loadNewCards() async {
    List<CardData> targetCards = [];
    if (widget.currentFilter.startsWith('mix_')) {
      final pair = widget.currentFilter.replaceFirst('mix_', '').split('||');
      final decks = await widget.db.getAllDecks();
      final matchingDeckIds = decks
          .where(
              (d) => d.sourceLanguage == pair[0] && d.targetLanguage == pair[1])
          .map((d) => d.id)
          .toList();
      final allCards = await widget.db.select(widget.db.cards).get();
      targetCards =
          allCards.where((c) => matchingDeckIds.contains(c.deckId)).toList();
    } else if (widget.currentFilter.startsWith('deck_')) {
      final deckId =
          int.tryParse(widget.currentFilter.replaceFirst('deck_', ''));
      if (deckId != null) {
        targetCards = await widget.db.getCardsByDeckId(deckId);
      }
    }
    targetCards.shuffle();
    final newCards = targetCards.take(widget.requestedCount).toList();
    setState(() {
      _currentCards = newCards;
      _currentIndex = 0;
      _correctAnswers = 0;
      _isFlipped = false;
      _swipeDx = 0;
      _flipController.reset();
    });
  }

  void _playCardAudio(CardData card, bool isBack) {
    final audioPath = isBack ? card.backAudioPath : card.frontAudioPath;
    if (audioPath != null && audioPath.isNotEmpty) {
      AudioHelper.playAudio(audioPath);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final isFinished = _currentIndex >= _currentCards.length;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(isFinished
            ? l.microSessionEndTitle
            : l.microSessionEndWord(_currentIndex + 1, _currentCards.length)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop())
        ],
      ),
      body: SafeArea(
          child: isFinished ? _buildSuccessView(l) : _buildCardView(l)),
    );
  }

  Widget _buildCardView(AppLocalizations l) {
    final currentCard = _currentCards[_currentIndex];

    // Индикаторы свайпа (непрозрачность зависит от расстояния)
    final swipeOpacity = (_swipeDx.abs() / 80).clamp(0.0, 1.0);
    final swipeAngle = (_swipeDx / 600) * 0.15; // лёгкий наклон

    return Column(
      children: [
        LinearProgressIndicator(
            value: (_currentIndex) / _currentCards.length,
            backgroundColor: Colors.grey[200],
            color: const Color(0xFF6366F1)),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: GestureDetector(
              // Тап — перевернуть карточку (только если не свайпаем)
              onTap: () {
                if (_swipeDx.abs() < 5) _flipCard();
              },
              // Горизонтальный свайп — следующая карточка
              onHorizontalDragUpdate: (details) {
                setState(() {
                  _swipeDx += details.delta.dx;
                });
              },
              onHorizontalDragEnd: (details) {
                final velocity = details.primaryVelocity ?? 0;
                // Порог: смещение > 80px или скорость > 300
                if (_swipeDx > 80 || velocity > 300) {
                  // Свайп вправо → "Помню"
                  setState(() => _swipeDx = 0);
                  _nextCard(true);
                } else if (_swipeDx < -80 || velocity < -300) {
                  // Свайп влево → "Сложно"
                  setState(() => _swipeDx = 0);
                  _nextCard(false);
                } else {
                  // Недостаточно — вернуть на место
                  setState(() => _swipeDx = 0);
                }
              },
              child: Transform.translate(
                offset: Offset(_swipeDx, 0),
                child: Transform.rotate(
                  angle: swipeAngle,
                  child: Stack(
                    children: [
                      // Сама карточка с flip-анимацией
                      AnimatedBuilder(
                        animation: _flipController,
                        builder: (context, child) {
                          final angle = _flipController.value * pi;
                          final transform = Matrix4.identity()
                            ..setEntry(3, 2, 0.001)
                            ..rotateY(angle);
                          return Transform(
                            transform: transform,
                            alignment: Alignment.center,
                            child: angle >= pi / 2
                                ? Transform(
                                    transform: Matrix4.identity()..rotateY(pi),
                                    alignment: Alignment.center,
                                    child:
                                        _buildCardContent(currentCard, true, l))
                                : _buildCardContent(currentCard, false, l),
                          );
                        },
                      ),
                      // Индикатор "ПОМНЮ" при свайпе вправо
                      if (_swipeDx > 10)
                        Positioned(
                          top: 40,
                          left: 32,
                          child: Opacity(
                            opacity: swipeOpacity,
                            child: Transform.rotate(
                              angle: -0.2,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.green, width: 3),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  l.btnKnow.toUpperCase(),
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      // Индикатор "СЛОЖНО" при свайпе влево
                      if (_swipeDx < -10)
                        Positioned(
                          top: 40,
                          right: 32,
                          child: Opacity(
                            opacity: swipeOpacity,
                            child: Transform.rotate(
                              angle: 0.2,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.redAccent, width: 3),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  l.btnHard.toUpperCase(),
                                  style: const TextStyle(
                                    color: Colors.redAccent,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 48),
          child: Row(
            children: [
              Expanded(
                  child: FilledButton.tonal(
                      onPressed: () => _nextCard(false),
                      style: FilledButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16))),
                      child: Text(l.btnHard,
                          style: const TextStyle(fontSize: 18)))),
              const SizedBox(width: 16),
              Expanded(
                  child: FilledButton(
                      onPressed: () => _nextCard(true),
                      style: FilledButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16))),
                      child: Text(l.btnKnow,
                          style: const TextStyle(fontSize: 18)))),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCardContent(CardData card, bool isBack, AppLocalizations l) {
    final text = isBack ? card.backText : card.frontText;
    final hasAudio =
        isBack ? (card.backAudioPath != null) : (card.frontAudioPath != null);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: isBack
              ? Theme.of(context).colorScheme.primaryContainer
              : Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 20,
                spreadRadius: 2,
                offset: const Offset(0, 10))
          ]),
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(text,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: isBack
                              ? Theme.of(context).colorScheme.primary
                              : null)),
                  if (hasAudio) ...[
                    const SizedBox(height: 24),
                    IconButton.filledTonal(
                        icon: const Icon(Icons.volume_up, size: 32),
                        onPressed: () => _playCardAudio(card, isBack),
                        tooltip: l.listenPronunciation)
                  ]
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 24,
              left: 0,
              right: 0,
              child: Text(l.tapToFlip,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[500], fontSize: 14))),
        ],
      ),
    );
  }

  Widget _buildSuccessView(AppLocalizations l) {
    final bool isPerfect = _correctAnswers == _currentCards.length;
    final perfectPhrases = [
      l.phrasePerfect1,
      l.phrasePerfect2,
      l.phrasePerfect3,
      l.phrasePerfect4,
      l.phrasePerfect5
    ];
    final randomPhrase = perfectPhrases[
        DateTime.now().millisecondsSinceEpoch % perfectPhrases.length];
    final String title = isPerfect ? randomPhrase : l.msgGoodJob;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(isPerfect ? '🌟' : '💪', style: const TextStyle(fontSize: 80)),
            const SizedBox(height: 24),
            Text(title,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            const SizedBox(height: 16),
            Text(l.msgRemembered(_correctAnswers, _currentCards.length),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[600], fontSize: 16)),
            const SizedBox(height: 48),
            SizedBox(
                width: double.infinity,
                height: 56,
                child: FilledButton.tonal(
                    onPressed: _repeatCurrentCards,
                    style: FilledButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16))),
                    child: Text(l.btnRepeat,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)))),
            const SizedBox(height: 12),
            SizedBox(
                width: double.infinity,
                height: 56,
                child: FilledButton.tonal(
                    onPressed: _loadNewCards,
                    style: FilledButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).colorScheme.primaryContainer,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16))),
                    child: Text(l.btnMoreWords(widget.requestedCount),
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)))),
            const SizedBox(height: 12),
            SizedBox(
                width: double.infinity,
                height: 56,
                child: FilledButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: FilledButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16))),
                    child: Text(l.btnFinish,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)))),
          ],
        ),
      ),
    );
  }
}

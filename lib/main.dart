import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; // Правильный импорт
import 'package:lexiflow/core/database/app_database.dart';
import 'package:lexiflow/features/decks/presentation/screens/decks_screen.dart';
import 'package:lexiflow/app/language_select_screen.dart';

void main() {
  runApp(const LexiFlowApp());
}

class LexiFlowApp extends StatefulWidget {
  const LexiFlowApp({super.key});

  static final localeNotifier =
      ValueNotifier<Locale>(const Locale('en')); // Стандартный язык - EN

  static void setLocale(Locale locale) {
    localeNotifier.value = locale;
  }

  @override
  State<LexiFlowApp> createState() => _LexiFlowAppState();
}

class _LexiFlowAppState extends State<LexiFlowApp> {
  late final AppDatabase _database;
  bool _isLoading = true;
  bool _showLanguageSelect = false;

  @override
  void initState() {
    super.initState();
    _database = AppDatabase();
    _checkFirstLaunch();
  }

  Future<void> _checkFirstLaunch() async {
    final setting = await _database.getSetting('app_locale');
    if (setting == null) {
      setState(() {
        _showLanguageSelect = true;
        _isLoading = false;
      });
    } else {
      final locale = Locale(setting.value);
      LexiFlowApp.localeNotifier.value = locale;
      setState(() {
        _showLanguageSelect = false;
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _database.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Locale>(
      valueListenable: LexiFlowApp.localeNotifier,
      builder: (context, locale, _) {
        return MaterialApp(
          title: 'LexiFlow',
          debugShowCheckedModeBanner: false,
          locale: locale,

          // ИСПОЛЬЗУЕМ АВТОМАТИЧЕСКИЕ СПИСКИ ИЗ ГЕНЕРАТОРА
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,

          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF6366F1),
              brightness: Brightness.light,
            ),
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF6366F1),
              brightness: Brightness.dark,
            ),
            useMaterial3: true,
          ),
          themeMode: ThemeMode.system,

          home: _isLoading
              ? const Scaffold(body: Center(child: CircularProgressIndicator()))
              : _showLanguageSelect
                  ? LanguageSelectScreen(
                      db: _database,
                      onLanguageSelected: (newLocale) {
                        LexiFlowApp.setLocale(newLocale);
                        setState(() => _showLanguageSelect = false);
                      },
                    )
                  : DecksScreen(db: _database),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lexiflow/app/language_select_screen.dart';
import 'package:lexiflow/app/onboarding_screen.dart';
import 'package:lexiflow/core/database/app_database.dart';
import 'package:lexiflow/features/decks/presentation/screens/decks_screen.dart';

void main() {
  runApp(const LexiFlowApp());
}

class LexiFlowApp extends StatefulWidget {
  const LexiFlowApp({super.key});

  static final ValueNotifier<Locale> localeNotifier =
      ValueNotifier(const Locale('en'));
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.system);

  static void setLocale(Locale locale) {
    localeNotifier.value = locale;
  }

  static void setTheme(ThemeMode mode) {
    themeNotifier.value = mode;
  }

  @override
  State<LexiFlowApp> createState() => _LexiFlowAppState();
}

class _LexiFlowAppState extends State<LexiFlowApp> {
  late final AppDatabase _database;
  bool _isLoading = true;
  bool _showLanguageSelect = false;
  bool _showOnboarding = false;

  @override
  void initState() {
    super.initState();
    _database = AppDatabase();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    // --- ВРЕМЕННЫЙ СБРОС (ИСПРАВЛЕНО И ЗАКОММЕНТИРОВАНО) ---
    // try {
    //   // Используем одинарные кавычки для текстовых значений ключей
    //   await _database.customStatement(
    //       "DELETE FROM settings WHERE key IN ('app_locale', 'onboarding_complete')");
    // } catch (e) {
    //   debugPrint('Reset error: $e');
    // }
    // ---------------------------------------------------------

    await _loadThemePreference();
    await _checkFirstLaunch();
    await _checkOnboarding();
  }

  Future<void> _loadThemePreference() async {
    final themeSetting = await _database.getSetting('theme_mode');
    if (themeSetting != null) {
      ThemeMode mode;
      switch (themeSetting.value) {
        case 'light':
          mode = ThemeMode.light;
          break;
        case 'dark':
          mode = ThemeMode.dark;
          break;
        default:
          mode = ThemeMode.system;
      }
      LexiFlowApp.setTheme(mode);
    }
  }

  Future<void> _checkFirstLaunch() async {
    final setting = await _database.getSetting('app_locale');
    if (setting == null) {
      setState(() {
        _showLanguageSelect = true;
      });
    } else {
      LexiFlowApp.setLocale(Locale(setting.value));
    }
  }

  Future<void> _checkOnboarding() async {
    final onboardingComplete =
        await _database.getSetting('onboarding_complete');
    if (onboardingComplete == null) {
      setState(() {
        _showOnboarding = true;
      });
    }

    setState(() {
      _isLoading = false;
    });
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
      builder: (context, locale, child) {
        return ValueListenableBuilder<ThemeMode>(
          valueListenable: LexiFlowApp.themeNotifier,
          builder: (context, themeMode, child) {
            return MaterialApp(
              title: 'LexiFlow',
              debugShowCheckedModeBanner: false,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: locale,
              theme: ThemeData(
                useMaterial3: true,
                colorScheme: ColorScheme.fromSeed(
                  seedColor: Colors.blue,
                  brightness: Brightness.light,
                ),
              ),
              darkTheme: ThemeData(
                useMaterial3: true,
                colorScheme: ColorScheme.fromSeed(
                  seedColor: Colors.blue,
                  brightness: Brightness.dark,
                ),
              ),
              themeMode: themeMode,
              initialRoute: '/',
              routes: {
                '/': (context) => _getInitialScreen(),
                '/home': (context) => DecksScreen(db: _database),
              },
            );
          },
        );
      },
    );
  }

  Widget _getInitialScreen() {
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_showLanguageSelect) {
      return LanguageSelectScreen(
        db: _database,
        onLanguageSelected: (Locale locale) {
          setState(() {
            _showLanguageSelect = false;
            _checkOnboarding();
          });
        },
      );
    }

    if (_showOnboarding) {
      return OnboardingScreen(db: _database);
    }

    return DecksScreen(db: _database);
  }
}

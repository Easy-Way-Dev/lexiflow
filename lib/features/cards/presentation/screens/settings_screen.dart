import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lexiflow/core/database/app_database.dart';
import 'package:lexiflow/main.dart';

class SettingsScreen extends StatefulWidget {
  final AppDatabase db;

  const SettingsScreen({super.key, required this.db});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  ThemeMode _currentTheme = ThemeMode.system;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadThemePreference();
  }

  Future<void> _loadThemePreference() async {
    final themeSetting = await widget.db.getSetting('theme_mode');
    setState(() {
      if (themeSetting == null) {
        _currentTheme = ThemeMode.system;
      } else {
        switch (themeSetting.value) {
          case 'light':
            _currentTheme = ThemeMode.light;
            break;
          case 'dark':
            _currentTheme = ThemeMode.dark;
            break;
          default:
            _currentTheme = ThemeMode.system;
        }
      }
      _isLoading = false;
    });
  }

  Future<void> _changeTheme(ThemeMode mode) async {
    String modeString;
    switch (mode) {
      case ThemeMode.light:
        modeString = 'light';
        break;
      case ThemeMode.dark:
        modeString = 'dark';
        break;
      case ThemeMode.system:
        modeString = 'system';
        break;
    }

    await widget.db.setSetting('theme_mode', modeString);
    LexiFlowApp.setTheme(mode);

    setState(() {
      _currentTheme = mode;
    });
  }

  void _showLanguageDialog() async {
    final l = AppLocalizations.of(context)!;
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l.settingsLanguage),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildLangOption('ru', '🇷🇺', 'Русский'),
            _buildLangOption('en', '🇺🇸', 'English (US)'),
            _buildLangOption('uk', '🇺🇦', 'Українська'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l.close),
          ),
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
    final l = AppLocalizations.of(context)!;

    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text(l.settings)),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(l.settings),
      ),
      body: ListView(
        children: [
          // Appearance section
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              l.settingsAppearance,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),

          // Theme mode
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.palette),
                  title: Text(l.settingsTheme),
                  subtitle: Text(_getThemeLabel(l)),
                ),
                const Divider(height: 1),
                RadioListTile<ThemeMode>(
                  title: Row(
                    children: [
                      const Icon(Icons.light_mode, size: 20),
                      const SizedBox(width: 12),
                      Text(l.settingsThemeLight),
                    ],
                  ),
                  value: ThemeMode.light,
                  groupValue: _currentTheme,
                  onChanged: (value) {
                    if (value != null) {
                      _changeTheme(value);
                    }
                  },
                ),
                RadioListTile<ThemeMode>(
                  title: Row(
                    children: [
                      const Icon(Icons.dark_mode, size: 20),
                      const SizedBox(width: 12),
                      Text(l.settingsThemeDark),
                    ],
                  ),
                  value: ThemeMode.dark,
                  groupValue: _currentTheme,
                  onChanged: (value) {
                    if (value != null) {
                      _changeTheme(value);
                    }
                  },
                ),
                RadioListTile<ThemeMode>(
                  title: Row(
                    children: [
                      const Icon(Icons.brightness_auto, size: 20),
                      const SizedBox(width: 12),
                      Text(l.settingsThemeSystem),
                    ],
                  ),
                  value: ThemeMode.system,
                  groupValue: _currentTheme,
                  onChanged: (value) {
                    if (value != null) {
                      _changeTheme(value);
                    }
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Language section
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              l.settingsLanguageSection,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),

          Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: ListTile(
              leading: const Icon(Icons.language),
              title: Text(l.settingsLanguage),
              subtitle: Text(_getCurrentLanguageName()),
              trailing: const Icon(Icons.chevron_right),
              onTap: _showLanguageDialog,
            ),
          ),

          const SizedBox(height: 16),

          // About section
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Text(
              l.settingsAbout,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),

          Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.info_outline),
                  title: Text(l.settingsVersion),
                  subtitle: const Text('v1.2.0'),
                ),
                const Divider(height: 1),
                ListTile(
                  leading: const Icon(Icons.code),
                  title: Text(l.settingsDeveloper),
                  subtitle: const Text('LexiFlow Team'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getThemeLabel(AppLocalizations l) {
    switch (_currentTheme) {
      case ThemeMode.light:
        return l.settingsThemeLight;
      case ThemeMode.dark:
        return l.settingsThemeDark;
      case ThemeMode.system:
        return l.settingsThemeSystem;
    }
  }

  String _getCurrentLanguageName() {
    final code = LexiFlowApp.localeNotifier.value.languageCode;
    switch (code) {
      case 'ru':
        return '🇷🇺 Русский';
      case 'en':
        return '🇺🇸 English';
      case 'uk':
        return '🇺🇦 Українська';
      default:
        return 'English';
    }
  }
}


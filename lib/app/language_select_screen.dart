import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lexiflow/core/database/app_database.dart';

class LanguageSelectScreen extends StatefulWidget {
  final AppDatabase db;
  final void Function(Locale locale) onLanguageSelected;

  const LanguageSelectScreen({
    super.key,
    required this.db,
    required this.onLanguageSelected,
  });

  @override
  State<LanguageSelectScreen> createState() => _LanguageSelectScreenState();
}

class _LanguageSelectScreenState extends State<LanguageSelectScreen> {
  String? _selected;
  bool _saving = false;

  final List<_LangOption> _languages = const [
    _LangOption(
      code: 'en',
      flag: '🇺🇸',
      nativeName: 'English',
      subtitle: 'English (US)',
    ),
    _LangOption(
      code: 'ru',
      flag: '🇷🇺',
      nativeName: 'Русский',
      subtitle: 'Russian',
    ),
    _LangOption(
      code: 'uk',
      flag: '🇺🇦',
      nativeName: 'Українська',
      subtitle: 'Ukrainian',
    ),
  ];

  Future<void> _confirm() async {
    if (_selected == null) return;
    setState(() => _saving = true);

    await widget.db.setSetting('app_locale', _selected!);
    widget.onLanguageSelected(Locale(_selected!));
  }

  @override
  Widget build(BuildContext context) {
    // Безопасный вызов локализации без ? и !
    final l = AppLocalizations.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),

              // Logo
              Container(
                width: 96,
                height: 96,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Icon(
                  Icons.auto_stories,
                  size: 52,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 24),

              Text(
                'LexiFlow',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              const SizedBox(height: 8),

              Text(
                l.langSelectSubtitle,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                    ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 48),

              // Language buttons
              ...(_languages.map((lang) => _buildLangTile(lang))),

              const Spacer(),

              // Continue button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: FilledButton(
                  onPressed: (_selected == null || _saving) ? null : _confirm,
                  child: _saving
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : Text(
                          l.langSelectContinue,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLangTile(_LangOption lang) {
    final isSelected = _selected == lang.code;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.primaryContainer
              : Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Colors.grey[300]!,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Theme.of(context)
                        .colorScheme
                        .primary
                        .withValues(alpha: 0.15),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  )
                ]
              : [],
        ),
        child: InkWell(
          onTap: () => setState(() => _selected = lang.code),
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              children: [
                Text(lang.flag, style: const TextStyle(fontSize: 36)),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        lang.nativeName,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: isSelected
                                      ? Theme.of(context).colorScheme.primary
                                      : null,
                                ),
                      ),
                      Text(
                        lang.subtitle,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.grey[600],
                            ),
                      ),
                    ],
                  ),
                ),
                AnimatedScale(
                  scale: isSelected ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 200),
                  child: Icon(
                    Icons.check_circle,
                    color: Theme.of(context).colorScheme.primary,
                    size: 28,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LangOption {
  final String code;
  final String flag;
  final String nativeName;
  final String subtitle;

  const _LangOption({
    required this.code,
    required this.flag,
    required this.nativeName,
    required this.subtitle,
  });
}

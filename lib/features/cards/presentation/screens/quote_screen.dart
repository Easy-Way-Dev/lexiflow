import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lexiflow/core/services/quotes_service.dart';

class QuoteScreen extends StatelessWidget {
  final MotivationalQuote quote;
  final int studiedCards;
  final int correctAnswers;
  final int totalCards;

  const QuoteScreen({
    super.key,
    required this.quote,
    required this.studiedCards,
    required this.correctAnswers,
    required this.totalCards,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final accuracy =
        studiedCards > 0 ? (correctAnswers / studiedCards * 100).round() : 0;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.secondaryContainer,
              Theme.of(context).colorScheme.tertiaryContainer,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Кнопка закрыть
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),

              const Spacer(),

              // Цитата
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: [
                    const Icon(
                      Icons.format_quote,
                      size: 64,
                      color: Colors.black26,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '"${quote.text}"',
                      textAlign: TextAlign.center,
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w600,
                              ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      "— ${quote.author}",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Статистика сессии
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .surface
                      .withValues(alpha: 0.9),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      l.quoteSessionResults,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _StatItem(
                          icon: Icons.style,
                          label: l.quoteStudied,
                          value: '$studiedCards',
                          color: Colors.blue,
                        ),
                        _StatItem(
                          icon: Icons.check_circle,
                          label: l.quoteCorrect,
                          value: '$correctAnswers',
                          color: Colors.green,
                        ),
                        _StatItem(
                          icon: Icons.percent,
                          label: l.quoteAccuracy,
                          value: '$accuracy%',
                          color: Colors.orange,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      _getMotivationMessage(accuracy, l),
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.grey[700],
                            fontStyle: FontStyle.italic,
                          ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Кнопки
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    // Кнопка "Поделиться"
                    FilledButton.icon(
                      onPressed: () => _shareQuote(context, l),
                      icon: const Icon(Icons.share),
                      label: Text(l.quoteShare),
                      style: FilledButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                      ),
                    ),

                    const Spacer(),

                    // Кнопка "Готово"
                    OutlinedButton.icon(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.check),
                      label: Text(l.quoteDone),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  String _getMotivationMessage(int accuracy, AppLocalizations l) {
    if (accuracy == 100) return l.quoteMsgPerfect;
    if (accuracy >= 80) return l.quoteMsgExcellent;
    if (accuracy >= 60) return l.quoteMsgGood;
    if (accuracy >= 40) return l.quoteMsgNotBad;
    if (accuracy > 0) return l.quoteMsgKeepGoing;
    return l.quoteMsgProgress;
  }

  void _shareQuote(BuildContext context, AppLocalizations l) {
    final shareText = l.quoteShareText(quote.text, quote.author);

    Clipboard.setData(ClipboardData(text: shareText));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle, color: Colors.white),
            const SizedBox(width: 8),
            Text(l.quoteCopied),
          ],
        ),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _StatItem({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color, size: 28),
        const SizedBox(height: 8),
        Text(
          value,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.grey[600],
              ),
        ),
      ],
    );
  }
}

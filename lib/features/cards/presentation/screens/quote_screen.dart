import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                    tooltip: 'Закрыть',
                  ),
                ),
              ),

              // Основной контент
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Иконка успеха
                        _buildSuccessIcon(accuracy),

                        const SizedBox(height: 24),

                        // Заголовок
                        Text(
                          _getCongratulatoryMessage(accuracy),
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                              ),
                          textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 32),

                        // Статистика сессии
                        _buildStatsCard(
                            context, studiedCards, correctAnswers, accuracy),

                        const SizedBox(height: 32),

                        // Цитата
                        _buildQuoteCard(context),

                        const SizedBox(height: 32),

                        // Кнопки действий
                        _buildActionButtons(context),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSuccessIcon(int accuracy) {
    IconData icon;
    Color color;

    if (accuracy >= 80) {
      icon = Icons.emoji_events;
      color = Colors.amber;
    } else if (accuracy >= 60) {
      icon = Icons.thumb_up;
      color = Colors.green;
    } else if (accuracy >= 40) {
      icon = Icons.trending_up;
      color = Colors.blue;
    } else {
      icon = Icons.psychology;
      color = Colors.purple;
    }

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.9),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.3),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Icon(
        icon,
        size: 64,
        color: color,
      ),
    );
  }

  String _getCongratulatoryMessage(int accuracy) {
    if (accuracy >= 90) {
      return 'Невероятно! 🎉';
    } else if (accuracy >= 80) {
      return 'Отличная работа! 🌟';
    } else if (accuracy >= 70) {
      return 'Хорошо! 👍';
    } else if (accuracy >= 60) {
      return 'Неплохо! 💪';
    } else if (accuracy >= 50) {
      return 'Продолжайте! 📈';
    } else {
      return 'Каждый день - прогресс! 🌱';
    }
  }

  Widget _buildStatsCard(
      BuildContext context, int studied, int correct, int accuracy) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'Результаты сессии',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatItem(
                context,
                icon: Icons.style,
                label: 'Изучено',
                value: '$studied',
                color: Colors.blue,
              ),
              _buildStatItem(
                context,
                icon: Icons.check_circle,
                label: 'Правильно',
                value: '$correct',
                color: Colors.green,
              ),
              _buildStatItem(
                context,
                icon: Icons.percent,
                label: 'Точность',
                value: '$accuracy%',
                color: _getAccuracyColor(accuracy),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Column(
      children: [
        Icon(icon, color: color, size: 32),
        const SizedBox(height: 8),
        Text(
          value,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
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

  Color _getAccuracyColor(int accuracy) {
    if (accuracy >= 80) return Colors.green;
    if (accuracy >= 60) return Colors.blue;
    if (accuracy >= 40) return Colors.orange;
    return Colors.red;
  }

  Widget _buildQuoteCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          // Иконка кавычек
          Icon(
            Icons.format_quote,
            size: 40,
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
          ),

          const SizedBox(height: 16),

          // Текст цитаты
          Text(
            quote.text,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontStyle: FontStyle.italic,
                  height: 1.5,
                ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 16),

          // Автор
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 30,
                height: 2,
                color: Theme.of(context)
                    .colorScheme
                    .primary
                    .withValues(alpha: 0.3),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  quote.author,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ),
              Container(
                width: 30,
                height: 2,
                color: Theme.of(context)
                    .colorScheme
                    .primary
                    .withValues(alpha: 0.3),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: [
        // Кнопка "Поделиться"
        FilledButton.icon(
          onPressed: () => _shareQuote(context),
          icon: const Icon(Icons.share),
          label: const Text('Поделиться'),
          style: FilledButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primary,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
        ),

        // Кнопка "Готово"
        OutlinedButton.icon(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.check),
          label: const Text('Готово'),
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
        ),
      ],
    );
  }

  void _shareQuote(BuildContext context) {
    final shareText =
        '"${quote.text}"\n\n— ${quote.author}\n\nИзучено в LexiFlow 📚';

    Clipboard.setData(ClipboardData(text: shareText));

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Row(
          children: [
            Icon(Icons.check_circle, color: Colors.white),
            SizedBox(width: 8),
            Text('Цитата скопирована в буфер обмена!'),
          ],
        ),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

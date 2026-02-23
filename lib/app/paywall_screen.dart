import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PaywallScreen extends StatelessWidget {
  const PaywallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A), // Премиальный темный фон
      body: SafeArea(
        child: Column(
          children: [
            // Верхняя панель с крестиком (справа, как мы любим)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon:
                      const Icon(Icons.close, color: Colors.white54, size: 32),
                  onPressed: () {
                    HapticFeedback.selectionClick();
                    Navigator.pop(context);
                  },
                ),
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    // Иконка-корона
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.amber.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Colors.amber.withValues(alpha: 0.3),
                            width: 2),
                      ),
                      child: const Icon(Icons.workspace_premium,
                          size: 64, color: Colors.amber),
                    ),
                    const SizedBox(height: 32),

                    // Заголовок
                    const Text(
                      'LexiFlow PRO',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Откройте безграничные возможности для изучения языков',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[400], fontSize: 16),
                    ),
                    const SizedBox(height: 48),

                    // Список фишек
                    _buildFeatureItem(Icons.table_chart, 'Экспорт в CSV и JSON',
                        'Выгружайте слова для работы в таблицах'),
                    const SizedBox(height: 24),
                    _buildFeatureItem(Icons.psychology, 'Безлимитные AI-Сеты',
                        'Создавайте колоды с помощью нейросетей'),
                    const SizedBox(height: 24),
                    _buildFeatureItem(
                        Icons.chat_bubble_outline,
                        'AI-Собеседник (Скоро)',
                        'Практика диалогов в реальном времени'),
                    const SizedBox(height: 48),

                    // Карточки цен
                    _buildPricingCard(
                      context: context,
                      title: 'Год (Выгодно)',
                      price: '\$24.99 / год',
                      oldPrice: '\$35.88',
                      badgeText: 'Экономия 30%',
                      isSelected: true,
                    ),
                    const SizedBox(height: 16),
                    _buildPricingCard(
                      context: context,
                      title: 'Месяц',
                      price: '\$2.99 / мес',
                      isSelected: false,
                    ),
                  ],
                ),
              ),
            ),

            // Кнопка оплаты внизу
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: SizedBox(
                width: double.infinity,
                height: 64,
                child: FilledButton(
                  onPressed: () {
                    HapticFeedback.heavyImpact();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text(
                              'Интеграция RevenueCat будет добавлена позже!')),
                    );
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  child: const Text(
                    'Оформить подписку',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String title, String subtitle) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF1E293B),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.blueAccent, size: 28),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(subtitle,
                  style: TextStyle(color: Colors.grey[500], fontSize: 14)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPricingCard({
    required BuildContext context,
    required String title,
    required String price,
    String? oldPrice,
    String? badgeText,
    required bool isSelected,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF1E293B) : Colors.transparent,
        border: Border.all(
          color: isSelected ? Colors.amber : Colors.grey.withValues(alpha: 0.3),
          width: isSelected ? 2 : 1,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        if (oldPrice != null) ...[
                          Text(
                            oldPrice,
                            style: TextStyle(
                                color: Colors.grey[500],
                                decoration: TextDecoration.lineThrough,
                                fontSize: 14),
                          ),
                          const SizedBox(width: 8),
                        ],
                        Text(price,
                            style: TextStyle(
                                color: isSelected
                                    ? Colors.amber
                                    : Colors.grey[300],
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
                Icon(
                  isSelected
                      ? Icons.radio_button_checked
                      : Icons.radio_button_off,
                  color: isSelected ? Colors.amber : Colors.grey[600],
                  size: 28,
                ),
              ],
            ),
          ),
          if (badgeText != null)
            Positioned(
              top: -12,
              right: 24,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(badgeText,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold)),
              ),
            ),
        ],
      ),
    );
  }
}

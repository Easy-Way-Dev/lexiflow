import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PaywallScreen extends StatelessWidget {
  const PaywallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);

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
                    const SizedBox(height: 24),

                    // Заголовок
                    Text(
                      l.paywallTitle,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      l.paywallSubtitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[400],
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 40),

                    // Фичи
                    _buildFeatureRow(Icons.file_download_outlined,
                        l.paywallFeature1Title, l.paywallFeature1Desc),
                    const SizedBox(height: 24),
                    _buildFeatureRow(Icons.auto_awesome, l.paywallFeature2Title,
                        l.paywallFeature2Desc),
                    const SizedBox(height: 24),
                    _buildFeatureRow(Icons.record_voice_over,
                        l.paywallFeature3Title, l.paywallFeature3Desc),

                    const SizedBox(height: 48),

                    // Тарифы
                    _buildPricingOption(
                      title: l.paywallYear,
                      price: l.paywallYearPrice,
                      badgeText: l.paywallYearSave,
                      isSelected: true,
                    ),
                    const SizedBox(height: 16),
                    _buildPricingOption(
                      title: l.paywallMonth,
                      price: l.paywallMonthPrice,
                      isSelected: false,
                    ),
                  ],
                ),
              ),
            ),

            // Кнопка покупки
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: FilledButton(
                      onPressed: () {
                        HapticFeedback.heavyImpact();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(l.paywallIntegration),
                            backgroundColor: Colors.amber,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        l.paywallButton,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureRow(IconData icon, String title, String subtitle) {
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
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(subtitle,
                  style: TextStyle(color: Colors.grey[400], fontSize: 14)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPricingOption({
    required String title,
    required String price,
    String? badgeText,
    required bool isSelected,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected
            ? Colors.amber.withValues(alpha: 0.1)
            : const Color(0xFF1E293B),
        border: Border.all(
          color: isSelected ? Colors.amber : Colors.transparent,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(16),
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
                        style: TextStyle(
                            color: isSelected ? Colors.amber : Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Row(
                      children: [
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

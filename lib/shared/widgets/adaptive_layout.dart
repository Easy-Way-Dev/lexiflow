import 'package:flutter/material.dart';

/// Максимальная ширина контента для разных типов экранов
class AppLayout {
  /// Основной контент (списки, карточки)
  static const double contentMaxWidth = 720.0;

  /// Узкий контент (формы, диалоги, тренировка)
  static const double narrowMaxWidth = 600.0;

  /// Широкий контент (таблицы, списки карточек)
  static const double wideMaxWidth = 900.0;

  /// Порог — считаем экран "широким" если шире этого значения
  static const double desktopBreakpoint = 700.0;

  /// Проверка — широкий ли экран сейчас
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= desktopBreakpoint;
  }
}

/// Виджет-обёртка который центрирует и ограничивает ширину контента.
/// На мобильном — прозрачная обёртка, контент на весь экран.
/// На десктопе — контент центрируется с максимальной шириной [maxWidth].
class AdaptiveLayout extends StatelessWidget {
  final Widget child;
  final double maxWidth;
  final EdgeInsetsGeometry? padding;

  const AdaptiveLayout({
    super.key,
    required this.child,
    this.maxWidth = AppLayout.contentMaxWidth,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = AppLayout.isDesktop(context);

    if (!isDesktop) {
      // На мобильном — без изменений
      return child;
    }

    // На десктопе — центрируем с ограничением ширины
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child:
            padding != null ? Padding(padding: padding!, child: child) : child,
      ),
    );
  }
}

/// Обёртка для Scaffold.body — самый частый случай использования.
/// Автоматически применяет AdaptiveLayout ко всему телу экрана.
class AdaptiveBody extends StatelessWidget {
  final Widget child;
  final double maxWidth;

  const AdaptiveBody({
    super.key,
    required this.child,
    this.maxWidth = AppLayout.contentMaxWidth,
  });

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      maxWidth: maxWidth,
      child: child,
    );
  }
}

/// Виджет для боковых отступов на широких экранах.
/// Добавляет горизонтальные отступы пропорционально ширине экрана.
class AdaptivePadding extends StatelessWidget {
  final Widget child;
  final double mobilePadding;
  final double desktopPadding;

  const AdaptivePadding({
    super.key,
    required this.child,
    this.mobilePadding = 16.0,
    this.desktopPadding = 32.0,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = AppLayout.isDesktop(context);
    final padding = isDesktop ? desktopPadding : mobilePadding;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: child,
    );
  }
}

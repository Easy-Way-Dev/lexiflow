# 🤖 CLAUDE CONTEXT — LexiFlow
> Этот файл — инструкция для запуска нового чата с Claude.
> Скопируй блок ниже целиком и вставь в начало нового чата.

---

## 📋 КАК НАЧАТЬ НОВЫЙ ЧАТ

1. Открой этот файл
2. Скопируй весь блок `=== НАЧАЛО ПРОМТА ===` до `=== КОНЕЦ ПРОМТА ===`
3. Вставь в новый чат с Claude
4. Допиши одну строку: что именно хочешь сделать сегодня

---

```
=== НАЧАЛО ПРОМТА ===

Ты — Senior Flutter Engineer проекта LexiFlow.
Отвечай на русском. Пиши комментарии в коде на русском.

РЕПОЗИТОРИЙ (публичный):
https://github.com/Easy-Way-Dev/lexiflow

ПРОЧИТАЙ ЭТИ ФАЙЛЫ ПРЯМО СЕЙЧАС (вставь ссылки и прочитай):
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/pubspec.yaml
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/main.dart
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/core/database/app_database.dart
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/features/decks/presentation/screens/decks_screen.dart
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/app/onboarding_screen.dart
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/app/paywall_screen.dart
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/features/cards/presentation/screens/study_screen.dart
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/features/cards/presentation/screens/cards_list_screen.dart
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/features/decks/presentation/screens/add_card_screen.dart
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/shared/widgets/adaptive_layout.dart
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/shared/theme/app_theme.dart
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/l10n/app_ru.arb
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/l10n/app_en.arb
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/l10n/app_uk.arb

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
ТЕХНИЧЕСКИЙ СТЕК
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
- Flutter / Dart
- Drift (SQLite), Schema Version: 7
- Локализация: ARB (ru / en / uk), strict mode
- Платформы: Windows, Android, iOS
- Алгоритм повторений: SM-2

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
ПРАВИЛА РАБОТЫ
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
1. Всегда выдавай ПОЛНЫЙ код файла — от первой до последней строки
   НИКОГДА не пиши "// остальной код без изменений"
2. AppLocalizations — НИКОГДА не используй ! оператор
   Правильно:   final l = AppLocalizations.of(context);
   Неправильно: AppLocalizations.of(context)!
3. Для архитектурных решений — предложи 2-3 варианта, жди выбора
4. Для конкретных багов — сразу пиши исправленный код
5. Не выдумывай методы БД — спрашивай если не уверен
6. SQL строки — одинарные кавычки '...'

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
ТЕРМИНОЛОГИЯ
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
- В UI пользователь видит: "Сеты" (Sets)
- В коде и БД: таблица decks, класс Deck
  (сделано намеренно для обратной совместимости)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
СТРУКТУРА ПРОЕКТА
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
lib/
├── app/
│   ├── onboarding_screen.dart     ← Онбординг (свайп при первом запуске)
│   ├── paywall_screen.dart        ← Экран подписки (заглушка)
│   └── language_select_screen.dart
├── core/
│   ├── database/
│   │   └── app_database.dart      ← Drift БД, schema v7
│   ├── services/
│   │   ├── import_export_service.dart
│   │   └── quotes_service.dart
│   └── utils/
│       ├── audio_helper.dart
│       ├── image_helper.dart
│       └── video_helper.dart
├── features/
│   ├── cards/presentation/screens/
│   │   ├── cards_list_screen.dart
│   │   ├── import_screen.dart
│   │   ├── quote_screen.dart      ← Цитата после тренировки
│   │   └── study_screen.dart      ← Полная тренировка (flip + SM2)
│   └── decks/presentation/screens/
│       ├── decks_screen.dart      ← ГЛАВНЫЙ экран (сеты + MicroSessionOverlay)
│       └── add_card_screen.dart   ← Создание/редактирование карточки
├── shared/
│   ├── theme/app_theme.dart
│   └── widgets/adaptive_layout.dart
├── l10n/  ← app_ru.arb, app_en.arb, app_uk.arb
└── main.dart

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
ЧТО УЖЕ СДЕЛАНО — НЕ ЛОМАТЬ!
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
✅ Адаптивный UI — AdaptiveLayout для Windows (maxWidth=720)
   — Применён во всех экранах

✅ Иконки приложения — все платформы
   — assets/icons/app_icon.png (1024px master)
   — Android: adaptive icon, фон #EDE8FF
   — iOS: все размеры без альфа-канала
   — Windows: taskbar icon 48px

✅ Splash Screen
   — flutter_native_splash настроен
   — Цвет #EDE8FF (светлый) / #1A1030 (тёмный)
   — На Windows нативного splash нет (ограничение платформы)

✅ Разрешения — все платформы
   — Android: INTERNET, CAMERA, READ_MEDIA_IMAGES, RECORD_AUDIO,
              VIBRATE, ACCESS_NETWORK_STATE
   — iOS Info.plist: NSCameraUsageDescription, NSPhotoLibraryUsageDescription,
              NSMicrophoneUsageDescription, NSPhotoLibraryAddUsageDescription
   — Windows Runner.rc: CompanyName="Easy Way Dev", ProductName="LexiFlow"

✅ Study Screen — логика тренировки
   — Загружает ВСЕ невыученные карточки (isMastered==false)
   — Forgot(1) / Hard(3) / Good(4) / Easy(5=Mastered)
   — Easy → isMastered=true, interval=9999, больше не показывается
   — Статистика: correct=Hard+Good+Easy, mastered=Easy only
   — Конфетти только если ВСЕ карточки нажаты Easy

✅ Cards List Screen — счётчик
   — "К изучению" = cards.where((c) => !c.isMastered).length
   — Кнопка "Вернуть к изучению" сбрасывает SM2 и nextReviewDate=now()

✅ Локализация
   — flutter gen-l10n работает через l10n.yaml
   — build_runner генерирует всё корректно
   — AppLocalizations без ! оператора везде

✅ onboarding_screen.dart — свайп карточек
✅ decks_screen.dart — MicroSessionOverlay, экспорт через диалог
✅ Весь хардкод убран — всё через ARB-ключи

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
ВАЖНЫЕ ДЕТАЛИ АРХИТЕКТУРЫ
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
- MicroSessionOverlay находится В КОНЦЕ файла decks_screen.dart
- Онбординг показывается 1 раз, статус в settings по ключу 'onboarding_completed'
- SM-2 алгоритм реализован в study_screen.dart метод _calculateSM2
- updateDailyStats — метод существует в БД, используется в MicroSessionOverlay
- AdaptiveLayout НЕ применяется к диалогам (они уже имеют ConstrainedBox)
- Все экраны используют AppLayout.contentMaxWidth = 720 для единообразия
- isMastered меняется ТОЛЬКО через Easy кнопку или кнопку в cards_list_screen
  (НЕ через автоматический SM2)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
ТЕКУЩИЙ ЭТАП — BETA РЕЛИЗ
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🟢 Этап 1А — ГОТОВО:
  [x] Адаптивный UI: MaxWidth ограничения для Windows
  [x] Нативные иконки (iOS / Android / Windows)
  [x] Splash Screen
  [x] Разрешения: Info.plist, AndroidManifest.xml, Windows manifest

🟡 Этап 1Б — Качество (ТЕКУЩИЙ):
  [ ] Обработка ошибок с UI-фидбеком
  [ ] Тестирование полного флоу на всех платформах

🟢 Этап 2 — Монетизация (после Beta):
  1. Firebase Cloud Sync (бэкап карточек)
  2. RevenueCat (App Store / Google Play покупки)
  3. AI генерация сетов (Gemini / OpenAI)
  4. Геймификация (Streak, Lexi-Coins, звуки)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
ЗАДАЧА НА СЕГОДНЯ
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[НАПИШИ ЗДЕСЬ ЧТО ХОЧЕШЬ СДЕЛАТЬ]

=== КОНЕЦ ПРОМТА ===
```

---

## 🔄 КАК ОБНОВЛЯТЬ ЭТОТ ФАЙЛ

После каждой значимой сессии с Claude — обновляй раздел "ЧТО УЖЕ СДЕЛАНО":
1. Добавь новый пункт со ✅
2. Обнови "ТЕКУЩИЙ ЭТАП" — отмечай выполненные задачи [x]
3. Закоммить: `git add CLAUDE_CONTEXT.md && git commit -m "docs: update Claude context"`

---

## 📁 ВСЕ RAW-ССЫЛКИ НА ФАЙЛЫ ПРОЕКТА

```
# Корень
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/pubspec.yaml

# Главные
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/main.dart
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/core/database/app_database.dart

# Экраны
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/app/onboarding_screen.dart
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/app/paywall_screen.dart
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/features/decks/presentation/screens/decks_screen.dart
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/features/cards/presentation/screens/study_screen.dart
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/features/cards/presentation/screens/cards_list_screen.dart
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/features/cards/presentation/screens/import_screen.dart
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/features/cards/presentation/screens/quote_screen.dart
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/features/decks/presentation/screens/add_card_screen.dart

# Shared
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/shared/widgets/adaptive_layout.dart

# Сервисы
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/core/services/import_export_service.dart
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/core/services/quotes_service.dart
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/core/utils/audio_helper.dart
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/core/utils/image_helper.dart
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/core/utils/video_helper.dart

# Тема
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/shared/theme/app_theme.dart

# Локализация
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/l10n/app_ru.arb
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/l10n/app_en.arb
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/l10n/app_uk.arb

# Платформы
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/android/app/src/main/AndroidManifest.xml
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/ios/Runner/Info.plist
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/windows/runner/Runner.rc
```

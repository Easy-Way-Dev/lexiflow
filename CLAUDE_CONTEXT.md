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

ПРОЧИТАЙ ЭТИ ФАЙЛЫ ПРЯМО СЕЙЧАС:
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
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/app/settings_screen.dart
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/core/data/built_in_sets_data.dart
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/core/services/built_in_sets_service.dart

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
ТЕХНИЧЕСКИЙ СТЕК
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
- Flutter / Dart
- Drift (SQLite), Schema Version: 8  ← (было 7, обновлено в Stage 1C)
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
7. После изменений ARB файлов всегда запускать: flutter gen-l10n
8. Никогда не использовать const перед виджетами содержащими l.* переменные

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
ТЕРМИНОЛОГИЯ
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
- В UI пользователь видит: "Сеты" (Sets)
- В коде и БД: таблица decks, класс Deck
  (сделано намеренно для обратной совместимости)
- Встроенные наборы: builtInSets / BuiltInSet / isBuiltIn=true

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
СТРУКТУРА ПРОЕКТА
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
lib/
├── app/
│   ├── onboarding_screen.dart      ← Онбординг (свайп при первом запуске)
│   ├── paywall_screen.dart         ← Экран подписки (ЗАГЛУШКА — не активен)
│   ├── settings_screen.dart        ← Настройки (тема, язык)
│   └── language_select_screen.dart
├── core/
│   ├── database/
│   │   └── app_database.dart       ← Drift БД, schema v8
│   ├── data/
│   │   └── built_in_sets_data.dart ← 800 карточек, 20 тем × RU+UK (Stage 1C)
│   ├── services/
│   │   ├── import_export_service.dart
│   │   ├── quotes_service.dart
│   │   └── built_in_sets_service.dart ← Сидинг встроенных наборов (Stage 1C)
│   └── utils/
│       ├── audio_helper.dart
│       ├── image_helper.dart
│       └── video_helper.dart
├── features/
│   ├── cards/presentation/screens/
│   │   ├── cards_list_screen.dart
│   │   ├── import_screen.dart
│   │   ├── quote_screen.dart
│   │   ├── settings_screen.dart
│   │   └── study_screen.dart
│   └── decks/presentation/screens/
│       ├── decks_screen.dart       ← ГЛАВНЫЙ экран (Library + My Decks + MicroSession)
│       └── add_card_screen.dart
├── shared/
│   ├── theme/app_theme.dart
│   └── widgets/adaptive_layout.dart
├── l10n/  ← app_ru.arb, app_en.arb, app_uk.arb
└── main.dart

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
ЧТО УЖЕ СДЕЛАНО — НЕ ЛОМАТЬ!
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

✅ Адаптивный UI — AdaptiveLayout для Windows (maxWidth=720)
✅ Иконки приложения — все платформы
✅ Splash Screen
✅ Разрешения — все платформы
✅ Локализация (ru / en / uk)
✅ Study Screen — логика тренировки (SM-2)
✅ Cards List Screen
✅ Export / Share — платформенный шаринг
✅ Rewards Screen (код есть, скрыт до релиза)
✅ MicroSessionOverlay со свайпами в decks_screen.dart

✅ Stage 1C — Встроенная библиотека (800 карточек)
   — lib/core/data/built_in_sets_data.dart — 20 тем × 2 языка (RU+UK) × 20 карточек
   — Темы: About Myself, Daily Routine, Home & Lifestyle, Food & Eating Out,
     Shopping, Travel & Transport, Weather, Cities & Countries,
     Holidays & Traditions, Hobbies & Interests, Movies & Music,
     Books & Education, Sport & Healthy Living, Work & Career,
     Technology & The Internet (B1), Business English (B2),
     Environment (B2), Health & Medicine (A2),
     Future Plans & Dreams (B1), Character & Emotions (B1)
   — Классы: BuiltInCard, BuiltInSet, builtInSets (const List<BuiltInSet>)
   — lib/core/services/built_in_sets_service.dart — сидинг в БД
   — Сидинг: при первом запуске + при смене языка (только новые наборы)
   — Флаги: built_in_seeded_ru / built_in_seeded_uk в Settings таблице
   — isBuiltIn=true → нет кнопок удаления/редактирования в UI
   — Секция "Library" над пользовательскими сетами в decks_screen
   — schema version: 7 → 8 (addColumn isBuiltIn в Decks)
   — ARB: librarySection, newSetsAdded (ru/en/uk)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
ВАЖНЫЕ ДЕТАЛИ АРХИТЕКТУРЫ
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
- MicroSessionOverlay находится В КОНЦЕ файла decks_screen.dart
- Онбординг показывается 1 раз, статус в settings по ключу 'onboarding_completed'
- SM-2 алгоритм реализован в study_screen.dart метод _calculateSM2
- updateDailyStats — метод существует в БД, используется в MicroSessionOverlay
- Streak хранится в БД, отображается в главном экране (🔥N)
- paywall_screen.dart — заглушка, показывается при попытке использовать Premium
- Экспортированные файлы: Documents/exported_files/*.lexiflow
- BuiltInSetsService.seedForLanguage() — вызывается в main.dart и settings_screen.dart
- isBuiltIn колонка добавлена в таблицу Decks (BoolColumn, default false)
- Локаль хранится в Settings: ключ 'app_locale', значения: 'ru' / 'uk' / 'en'
- LexiFlowApp.setLocale(Locale locale) — статический метод смены языка

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
ROADMAP
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🟢 Этап 1А — ГОТОВО
🟢 Этап 1Б — Качество — ГОТОВО

🟡 Этап 1В — Встроенная библиотека (Stage 1C) — В ПРОЦЕССЕ:
  [x] built_in_sets_data.dart — 800 карточек (20 тем × RU+UK)
  [ ] built_in_sets_service.dart — написать сервис сидинга
  [ ] app_database.dart — миграция 7→8, колонка isBuiltIn
  [ ] main.dart — вызов сидинга при первом запуске
  [ ] settings_screen.dart — вызов сидинга при смене языка + SnackBar
  [ ] decks_screen.dart — секция Library + защита от удаления
  [ ] ARB файлы — librarySection, newSetsAdded (ru/en/uk)
  [ ] flutter gen-l10n после ARB

🟡 Этап 1Г — Публикация:
  [ ] Тестирование на реальных устройствах Android + iOS
  [ ] Bundle ID настройка для сторов
  [ ] Google Play Console — AAB
  [ ] App Store Connect — IPA
  [ ] Скриншоты для сторов
  [ ] Описание приложения (ru/en/uk)
  [ ] Privacy Policy страница

🟢 Этап 2 — Монетизация (после Beta):
  [ ] Rewards Screen — активировать (код уже есть!)
  [ ] Firebase Cloud Sync
  [ ] RevenueCat
  [ ] AI генерация сетов (Gemini / OpenAI)
  [ ] Геймификация

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
ЗАДАЧА НА СЕГОДНЯ
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[НАПИШИ ЗДЕСЬ ЧТО ХОЧЕШЬ СДЕЛАТЬ]

=== КОНЕЦ ПРОМТА ===
```

---

## 🔄 КАК ОБНОВЛЯТЬ ЭТОТ ФАЙЛ

После каждой сессии с Claude:
1. Добавь выполненное со ✅ в "ЧТО УЖЕ СДЕЛАНО"
2. Обнови ROADMAP — отмечай [x]
3. Закоммить: `git add CLAUDE_CONTEXT.md && git commit -m "docs: update context"`

---

## 📁 ВСЕ RAW-ССЫЛКИ НА ФАЙЛЫ ПРОЕКТА

```
# Корень
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/pubspec.yaml
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/l10n.yaml
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/analysis_options.yaml

# Главные
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/main.dart
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/core/database/app_database.dart

# App
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/app/onboarding_screen.dart
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/app/paywall_screen.dart
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/app/language_select_screen.dart
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/app/settings_screen.dart

# Cards
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/features/cards/presentation/screens/study_screen.dart
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/features/cards/presentation/screens/cards_list_screen.dart
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/features/cards/presentation/screens/import_screen.dart
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/features/cards/presentation/screens/quote_screen.dart
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/features/cards/presentation/screens/settings_screen.dart

# Decks
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/features/decks/presentation/screens/decks_screen.dart
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/features/decks/presentation/screens/add_card_screen.dart

# Shared
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/shared/widgets/adaptive_layout.dart
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/shared/theme/app_theme.dart

# Сервисы
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/core/services/import_export_service.dart
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/core/services/quotes_service.dart
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/core/services/built_in_sets_service.dart
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/core/utils/audio_helper.dart
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/core/utils/image_helper.dart
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/core/utils/video_helper.dart

# Stage 1C — Встроенная библиотека
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/core/data/built_in_sets_data.dart

# Локализация
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/l10n/app_ru.arb
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/l10n/app_en.arb
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/l10n/app_uk.arb

# Платформы
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/android/app/src/main/AndroidManifest.xml
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/ios/Runner/Info.plist
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/windows/runner/Runner.rc
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/windows/runner/main.cpp
```

---

## 🧪 КОМАНДЫ ДЛЯ РАЗРАБОТКИ

```bash
# Зависимости
flutter pub get

# Локализация (после изменений ARB)
flutter gen-l10n

# Генерация кода Drift (после изменений схемы БД)
dart run build_runner build --delete-conflicting-outputs

# Запуск
flutter run -d windows
flutter run -d chrome

# Сборка
flutter build windows
flutter build apk --release
flutter build appbundle --release
flutter build ios --release

# Splash screen
dart run flutter_native_splash:create

# Иконки
dart run flutter_launcher_icons
```

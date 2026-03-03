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
7. После изменений ARB файлов всегда запускать: flutter gen-l10n
8. Никогда не использовать const перед виджетами содержащими l.* переменные

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
│   ├── onboarding_screen.dart      ← Онбординг (свайп при первом запуске)
│   ├── paywall_screen.dart         ← Экран подписки (ЗАГЛУШКА — не активен)
│   └── language_select_screen.dart
├── core/
│   ├── database/
│   │   └── app_database.dart       ← Drift БД, schema v7
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
│   │   ├── quote_screen.dart       ← Цитата после тренировки
│   │   ├── settings_screen.dart
│   │   └── study_screen.dart       ← Полная тренировка (flip + SM2)
│   └── decks/presentation/screens/
│       ├── decks_screen.dart       ← ГЛАВНЫЙ экран (сеты + MicroSessionOverlay)
│       └── add_card_screen.dart    ← Создание/редактирование карточки
├── shared/
│   ├── theme/app_theme.dart
│   └── widgets/adaptive_layout.dart ← AdaptiveLayout + AppLayout константы
├── l10n/  ← app_ru.arb, app_en.arb, app_uk.arb
└── main.dart

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
ЧТО УЖЕ СДЕЛАНО — НЕ ЛОМАТЬ!
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

✅ Адаптивный UI — AdaptiveLayout для Windows (maxWidth=720)
   — Применён во всех основных экранах
   — AppLayout.contentMaxWidth=720, narrowMaxWidth=600, wideMaxWidth=900
   — НЕ применяется к диалогам (у них свой ConstrainedBox)

✅ Иконки приложения — все платформы
   — assets/icons/app_icon.png (1024px master)
   — Android: adaptive icon, фон #EDE8FF
   — iOS: все размеры без альфа-канала
   — Windows: taskbar icon 48px

✅ Splash Screen
   — flutter_native_splash ^2.4.3 настроен в pubspec.yaml
   — Цвет #EDE8FF (светлый) / #1A1030 (тёмный)
   — На Windows нативного splash нет (ограничение платформы)

✅ Разрешения — все платформы
   — Android: INTERNET, ACCESS_NETWORK_STATE, CAMERA,
     READ_EXTERNAL_STORAGE (maxSdkVersion=32), READ_MEDIA_IMAGES,
     RECORD_AUDIO, MODIFY_AUDIO_SETTINGS, VIBRATE
   — iOS Info.plist: NSCameraUsageDescription, NSPhotoLibraryUsageDescription,
     NSMicrophoneUsageDescription, NSPhotoLibraryAddUsageDescription
   — Windows Runner.rc: CompanyName="Easy Way Dev", ProductName="LexiFlow"

✅ Локализация (ru / en / uk)
   — Генерируется через l10n.yaml + flutter gen-l10n
   — build_runner для Drift: dart run build_runner build --delete-conflicting-outputs
   — AppLocalizations без ! везде
   — Все тексты в ARB файлах, хардкод убран

✅ Study Screen — логика тренировки (SM-2)
   — Загружает ВСЕ невыученные карточки (isMastered==false), overdue первые
   — Кнопки: Forgot(q=1) / Hard(q=3) / Good(q=4) / Easy(q=5)
   — Easy → isMastered=true, interval=9999, nextReviewDate=+9999дней
   — isMastered меняется ТОЛЬКО через Easy или кнопку в cards_list_screen
   — Конфетти только если ВСЕ карточки нажаты Easy

✅ Cards List Screen
   — Счётчик "К изучению" = cards.where((c) => !c.isMastered).length
   — Кнопка "Вернуть к изучению" → isMastered=false, nextReviewDate=now()

✅ Export / Share — платформенный шаринг
   — На Windows: "Открыть папку" / "Скопировать путь" / "Поделиться"
   — _openFileFolder открывает Проводник через launchUrl + fallback Process.run
   — На мобильных: Share.shareXFiles (системный sheet с мессенджерами)
   — Email: открывает почтовый клиент через mailto://
   — Все тексты локализованы (openFolder, copyPath, shareFile в ARB)

✅ Rewards Screen (экран наград за streak)
   — КОД СОХРАНЁН но экран скрыт до бета-релиза
   — Будет активирован после запуска в сторах
   — Содержит: темы, иконки, звуки, AI-сеты за milestone дней

✅ quote_screen.dart — исправлен двойной !! → !
✅ decks_screen.dart — lint warnings исправлены (if без скобок)
✅ onboarding_screen.dart — свайп карточек, AdaptiveLayout
✅ decks_screen.dart — MicroSessionOverlay со свайпами

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

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
ROADMAP — BETA РЕЛИЗ
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

🟢 Этап 1А — ГОТОВО:
  [x] Адаптивный UI для Windows
  [x] Нативные иконки (iOS / Android / Windows)
  [x] Splash Screen
  [x] Разрешения: Info.plist, AndroidManifest.xml, Windows manifest

🟢 Этап 1Б — Качество — ГОТОВО:
  [x] Обработка ошибок с UI-фидбеком (SnackBar везде)
  [x] Экспорт/шаринг работает корректно на всех платформах
  [x] Локализация всех строк (ru/en/uk)
  [x] Lint warnings исправлены (0 ошибок)

🟡 Этап 1В — Публикация (ТЕКУЩИЙ):
  [ ] Тестирование полного флоу на реальных Android + iOS устройствах
  [ ] Bundle ID настройка для сторов
  [ ] Google Play Console — создать приложение, загрузить AAB
  [ ] App Store Connect — создать приложение, загрузить IPA
  [ ] Скриншоты для сторов (6.5" iPhone, iPad, Android)
  [ ] Описание приложения (ru/en/uk)
  [ ] Privacy Policy страница

🟢 Этап 2 — Монетизация (после Beta):
  [ ] Rewards Screen — активировать (код уже есть!)
  [ ] Firebase Cloud Sync (бэкап карточек)
  [ ] RevenueCat (App Store / Google Play покупки)
  [ ] AI генерация сетов (Gemini / OpenAI)
  [ ] Геймификация: Lexi-Coins, звуки, разблокировка тем

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
ЧЕК-ЛИСТ ТЕСТИРОВАНИЯ ПЕРЕД РЕЛИЗОМ
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Каждый пункт должен работать на Android И iOS:

[ ] Онбординг с нуля (первый запуск, выбор языка, свайп карточек)
[ ] Создание сета (название, описание, языки)
[ ] Создание карточек вручную (слово, перевод, фото, аудио)
[ ] Тренировка — все кнопки: Forgot / Hard / Good / Easy
[ ] Easy → карточка уходит в Mastered, больше не показывается
[ ] Конфетти при 100% Easy на все карточки
[ ] Статистика после тренировки (точность, количество)
[ ] MicroSession (быстрая тренировка с главного экрана, свайпы)
[ ] Импорт .lexiflow файла
[ ] Экспорт сета → шаринг через мессенджер
[ ] Смена языка интерфейса (ru / en / uk) — все строки переключаются
[ ] Тёмная / светлая тема
[ ] Streak счётчик (🔥) увеличивается каждый день
[ ] Работа на маленьком экране (телефон) и большом (планшет)
[ ] Приложение не падает при сворачивании и возврате

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
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/core/utils/audio_helper.dart
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/core/utils/image_helper.dart
https://raw.githubusercontent.com/Easy-Way-Dev/lexiflow/main/lib/core/utils/video_helper.dart

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

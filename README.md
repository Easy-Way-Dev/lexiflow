# 🎯 LexiFlow

> AI-powered language learning flashcard app

[![Flutter](https://img.shields.io/badge/Flutter-3.0+-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.0+-0175C2?logo=dart)](https://dart.dev)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

**LexiFlow** - современное мобильное приложение для изучения иностранных языков с помощью интерактивных карточек (flashcards). Проект находится в активной разработке.

---

## ✨ Текущие возможности (v0.1.0)

- ✅ **Управление колодами** - создание, просмотр, удаление колод карточек
- ✅ **Карточки для изучения** - создание текстовых карточек с примерами
- ✅ **Локальная база данных** - все данные хранятся на устройстве (SQLite + Drift)
- ✅ **Современный UI** - Material Design 3 с поддержкой тёмной темы
- ✅ **Кроссплатформенность** - работает на Windows, Android, iOS

---

## 🎨 Скриншоты

_Скриншоты будут добавлены позже_

---

## 🚀 Запланированные функции

### Фаза 2 (в разработке)
- [ ] Режим обучения с перелистыванием карточек
- [ ] Добавление изображений к карточкам
- [ ] Редактирование карточек
- [ ] Статистика прогресса обучения

### Фаза 3
- [ ] Запись и воспроизведение произношения
- [ ] AI генерация примеров использования (ChatGPT API)
- [ ] AI проверка произношения
- [ ] Импорт/экспорт колод

### Фаза 4
- [ ] Облачная синхронизация
- [ ] Совместное использование колод
- [ ] Публикация в App Store и Google Play
- [ ] Монетизация (freemium модель)

---

## 🛠️ Технологический стек

- **Framework:** Flutter 3.0+
- **Language:** Dart 3.0+
- **Database:** SQLite с Drift ORM
- **State Management:** Riverpod
- **UI:** Material Design 3
- **Build:** build_runner для кодогенерации

### Основные зависимости

```yaml
drift: ^2.14.0              # ORM для SQLite
flutter_riverpod: ^2.4.9    # State management
google_fonts: ^6.1.0        # Красивые шрифты
image_picker: ^1.0.5        # Загрузка изображений
```

---

## 📦 Установка и запуск

### Требования

- Flutter SDK 3.0 или выше
- Dart SDK 3.0 или выше
- Android Studio / VS Code / IntelliJ IDEA
- Git

### Клонирование репозитория

```bash
git clone https://github.com/ваш-username/lexiflow.git
cd lexiflow
```

### Установка зависимостей

```bash
flutter pub get
```

### Генерация кода базы данных

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Запуск приложения

```bash
# На Windows
flutter run -d windows

# На Android эмуляторе
flutter run -d <device-id>

# В браузере (веб-версия)
flutter run -d chrome
```

---

## 📁 Структура проекта

```
lexiflow/
├── lib/
│   ├── core/
│   │   └── database/          # База данных и ORM
│   ├── features/
│   │   ├── cards/             # Функционал карточек
│   │   └── decks/             # Функционал колод
│   └── main.dart
├── assets/                    # Ресурсы (изображения, иконки)
├── pubspec.yaml               # Зависимости проекта
└── README.md
```

---

## 🗄️ Схема базы данных

### Decks (Колоды)
- `id` - уникальный идентификатор
- `name` - название колоды
- `description` - описание
- `sourceLanguage` - изучаемый язык
- `targetLanguage` - родной язык
- `totalCards` - всего карточек
- `masteredCards` - освоенных карточек
- `createdAt` - дата создания
- `lastStudiedAt` - последнее изучение

### Cards (Карточки)
- `id` - уникальный идентификатор
- `deckId` - ссылка на колоду
- `frontText` - текст лицевой стороны
- `backText` - текст обратной стороны
- `pronunciation` - транскрипция
- `example` - пример использования
- `notes` - заметки
- Алгоритм SM-2 для интервального повторения
- Статистика правильных/неправильных ответов

### ReviewHistory (История повторений)
- История изучения карточек
- Время изучения
- Оценка знания

### Settings (Настройки)
- Пользовательские настройки приложения

---

## 🤝 Вклад в проект

Проект находится в активной разработке. Если вы хотите внести свой вклад:

1. Fork репозиторий
2. Создайте ветку для новой функции (`git checkout -b feature/amazing-feature`)
3. Commit изменения (`git commit -m '✨ Add amazing feature'`)
4. Push в ветку (`git push origin feature/amazing-feature`)
5. Откройте Pull Request

### Соглашения о коммитах

Используем эмодзи для описания типа изменений:
- ✨ `:sparkles:` - Новая функция
- 🐛 `:bug:` - Исправление бага
- 🎨 `:art:` - Улучшение UI/структуры кода
- 📝 `:memo:` - Документация
- 🚀 `:rocket:` - Улучшение производительности
- ♻️ `:recycle:` - Рефакторинг

---

## 📝 Лицензия

Этот проект распространяется под лицензией MIT. Подробности в файле [LICENSE](LICENSE).

---

## 👨‍💻 Автор

Создано с ❤️ и помощью Claude AI

---

## 🔗 Полезные ссылки

- [Документация Flutter](https://docs.flutter.dev/)
- [Drift ORM](https://drift.simonbinder.eu/)
- [Material Design 3](https://m3.material.io/)
- [Техническое задание проекта](docs/ТЕХНИЧЕСКОЕ_ЗАДАНИЕ_v2.md)

---

## 📊 Статус разработки

**Текущая версия:** v0.1.0 (MVP)  
**Статус:** 🟢 В активной разработке  
**Последнее обновление:** 9 февраля 2026

---

## ⭐ Поддержка проекта

Если вам нравится проект - поставьте звёздочку! ⭐

---

**Сделано с ❤️ для изучающих языки**

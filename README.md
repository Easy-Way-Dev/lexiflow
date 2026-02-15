# 📚 LexiFlow - AI-Powered Language Learning App

> Серьёзный инструмент для изучения языков с мультимедийными карточками и алгоритмом интервальных повторений SM-2.

![Flutter](https://img.shields.io/badge/Flutter-3.27.1-blue)
![Platform](https://img.shields.io/badge/Platform-Windows%20%7C%20Android%20%7C%20iOS-green)

---

## ✨ Реализовано (v0.9.0)

- ✅ Drift БД (schema v6) + SM-2 алгоритм
- ✅ Мультимедиа: фото (галерея/камера/Google), аудио (запись/файл), видео (YouTube/YouGlish)
- ✅ Режим обучения: 3D flip, 4 кнопки оценки, подсказки, кнопка "Выучено"
- ✅ Импорт/экспорт (.lexiflow + CSV/JSON)
- ✅ Шаринг через мессенджеры
- ✅ 9 языков для колод (EN-GB/US/CA, ES, FR, DE, IT, RU, UK)
- ✅ Поля: pronunciation (русское), transcription (МФА + поиск в словаре)
- ❌ БЕЗ геймификации (баллов, уровней, streak)

## 📝 TODO

### v1.0.0 - Локализация (ПРИОРИТЕТ)
- [ ] Русский + Украинский интерфейс (l10n)
- [ ] Выбор языка при старте

### v1.1.0 - AI
- [ ] ChatGPT/Claude API
- [ ] Авто-перевод, генерация примеров

### v1.2.0 - UX
- [ ] Onboarding, тёмная тема

### v1.3.0 - Монетизация
- [ ] Freemium + магазин колод

## 🚀 Установка

```bash
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter run -d windows
```

**MIT License** | v0.9.0 | 15.02.2026

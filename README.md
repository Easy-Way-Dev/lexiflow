# 🎓 LexiFlow

**Smart Flashcards Powered by Science**

LexiFlow is a modern spaced repetition app for language learning. Built with Flutter, it uses the proven SM-2 algorithm to help you master vocabulary efficiently with multimedia support.

---

## ✨ Features

### 🎯 Smart Learning
- **SM-2 Spaced Repetition**: Cards appear exactly when you need to review them
- **3D Flip Animation**: Smooth, beautiful card interactions
- **Multimedia Cards**: Images + Audio (WAV) + Videos (YouTube/YouGlish)
- **Smart Hints**: Picture, audio, video, or first letter (no penalties!)
- **Quick Mastery**: One-tap to mark words as learned

### 🌍 Fully Localized
- **3 Interface Languages**: 🇷🇺 Русский / 🇺🇸 English / 🇺🇦 Українська
- **8 Study Languages**: English (UK/US/CA), Spanish, French, German, Italian, Russian, Ukrainian
- **First-Launch Setup**: Choose your language, start learning immediately

### 📚 Organization & Views
- **Sets System**: Organize by topic, language, or difficulty
- **Dual View Modes**: Detailed cards or compact list
- **Clickable Status**: Quick toggle between "learned" and "to study"
- **Rich Statistics**: Track repetitions, accuracy, and progress

### 📤 Import & Share
- **Import Formats**: CSV, JSON, .lexiflow
- **Export**: .lexiflow files
- **Direct Sharing**: Telegram, WhatsApp, Facebook, Email, Discord
- **Cloud Sync** *(coming soon)*: Google Drive, iCloud, or local backup

---

## 🎬 Version History

### v1.1.0 - Localization (Current)
- ✅ Full Russian/English/Ukrainian interface
- ✅ Language selection on first launch
- ✅ Real-time language switching
- ✅ Hidden front-side images (hints only)
- ✅ Removed hint penalties
- ✅ Session completion dialog
- ✅ Major bug fixes

### v1.2.0 - UX Enhancements (In Development)
- 🚧 Onboarding flow (4 welcome screens with animations)
- 🚧 Dark theme (Light/Dark/System auto)
- 🚧 Decks → Sets rename
- 🚧 Audio recording timer (3-2-1 countdown, 60s max)
- 🚧 Compact list view with clickable checkmarks

---

## 🗺️ Roadmap

### v1.3.0 - AI Integration
- Claude API for smart auto-translation
- AI-generated usage examples
- Auto-transcription (IPA + pronunciation)
- Multiple translation suggestions (user picks best)

### v1.4.0 - Mobile Beta
- Android APK
- iOS TestFlight
- Windows MSIX
- Community beta testing

### v1.5.0 - Monetization
- Google Mobile Ads (non-intrusive)
- Premium subscription:
  - Ad-free experience
  - Cloud sync (Google Drive/iCloud/Dropbox)
  - CSV/JSON export
  - Unlimited sets
  - AI features without limits
- Set marketplace (curated vocabulary packs)

---

## 🛠️ Tech Stack

| Component | Technology |
|---|---|
| Framework | Flutter 3.27.1 |
| Language | Dart 3.6.0 |
| Database | Drift (SQLite) |
| State | StatefulWidget + ValueNotifier |
| Localization | flutter_gen (ARB files) |
| Audio | audioplayers 6.0.0 |
| File System | file_picker 8.1.6 |
| Architecture | Feature-based + Clean Architecture |

---

## 📦 Quick Start

### Prerequisites
- Flutter SDK ≥ 3.27.1
- Dart SDK ≥ 3.6.0
- Windows 10/11, macOS, or Linux

### Installation

```bash
# 1. Clone repository
git clone https://github.com/yourusername/lexiflow.git
cd lexiflow

# 2. Install dependencies
flutter pub get

# 3. Generate localizations
flutter gen-l10n

# 4. Generate database code
flutter pub run build_runner build --delete-conflicting-outputs

# 5. Run app
flutter run -d windows  # or: -d macos, -d linux
```

---

## 📁 Project Structure

```
lib/
├── main.dart                          # Entry point + localization setup
├── app/
│   └── language_select_screen.dart    # First-launch language picker
├── core/
│   ├── database/
│   │   └── app_database.dart          # Drift schema v6 (Cards, Sets, Settings)
│   ├── services/
│   │   ├── import_export_service.dart # CSV/JSON/.lexiflow handling
│   │   ├── image_service.dart         # Image management
│   │   └── audio_helper.dart          # Audio playback
│   └── utils/
│       └── video_helper.dart          # YouTube/YouGlish integration
├── features/
│   ├── decks/                         # Sets CRUD + study launcher
│   │   └── presentation/screens/
│   │       ├── decks_screen.dart
│   │       └── add_card_screen.dart
│   ├── cards/                         # Study mode + card list
│   │   └── presentation/screens/
│   │       ├── cards_list_screen.dart
│   │       ├── study_screen.dart
│   │       └── import_screen.dart
│   └── learning/                      # Stats + settings (future)
└── l10n/
    ├── app_en.arb                     # English strings
    ├── app_ru.arb                     # Russian strings
    └── app_uk.arb                     # Ukrainian strings
```

---

## 🎨 Screenshots

*Screenshots coming in v1.2.0 release*

---

## 🤝 Contributing

Contributions are welcome! Here's how:

1. Fork the repository
2. Create your feature branch: `git checkout -b feature/amazing-feature`
3. Follow the code style (run `dart format .`)
4. Commit with clear messages: `git commit -m 'Add: AI translation feature'`
5. Push to your branch: `git push origin feature/amazing-feature`
6. Open a Pull Request with description

### Code Style
- Use `flutter analyze` before committing
- Follow [Effective Dart](https://dart.dev/guides/language/effective-dart)
- Add comments for complex logic
- Keep functions under 50 lines when possible

---

## 🐛 Bug Reports

Found a bug? Please [open an issue](https://github.com/yourusername/lexiflow/issues) with:
- Clear title
- Steps to reproduce
- Expected vs actual behavior
- Screenshots (if applicable)
- Device/OS version

---

## 📄 License

MIT License - see [LICENSE](LICENSE) file for details.

---

## 🙏 Credits

- **SM-2 Algorithm**: Piotr Woźniak (SuperMemo)
- **Flutter Team**: Amazing cross-platform framework
- **Drift Team**: Powerful type-safe SQLite wrapper
- **Community**: All contributors and beta testers

---

## 📧 Contact & Support

- **Issues**: [GitHub Issues](https://github.com/yourusername/lexiflow/issues)
- **Discussions**: [GitHub Discussions](https://github.com/yourusername/lexiflow/discussions)
- **Email**: lexiflow@example.com
- **Twitter**: [@LexiFlowApp](https://twitter.com/lexiflowapp)

---

## ⭐ Star History

[![Star History Chart](https://api.star-history.com/svg?repos=yourusername/lexiflow&type=Date)](https://star-history.com/#yourusername/lexiflow&Date)

---

<div align="center">

**Made with ❤️ using Flutter**

[⬆ Back to Top](#-lexiflow)

</div>

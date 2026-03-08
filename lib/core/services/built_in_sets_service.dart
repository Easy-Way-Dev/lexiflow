import 'package:drift/drift.dart' as drift;
import 'package:lexiflow/core/data/built_in_sets_data.dart';
import 'package:lexiflow/core/database/app_database.dart';

class BuiltInSetsService {
  /// Добавляет встроенные наборы для указанного языка.
  /// Уже существующие наборы (по имени + isBuiltIn) не дублируются.
  /// Возвращает количество добавленных наборов.
  static Future<int> seedForLanguage(String langCode, AppDatabase db) async {
    // Если язык не поддерживается — используем ru как fallback
    final targetLang = ['ru', 'uk'].contains(langCode) ? langCode : 'ru';

    final setsForLang =
        builtInSets.where((s) => s.langCode == targetLang).toList();
    if (setsForLang.isEmpty) return 0;

    // Получаем все существующие встроенные колоды чтобы не дублировать
    final allDecks = await db.getAllDecks();
    final existingKeys = allDecks
        .where((d) => d.isBuiltIn)
        .map((d) => '${d.name}__${d.targetLanguage}')
        .toSet();

    int added = 0;

    for (final set in setsForLang) {
      if (existingKeys.contains('${set.name}__$targetLang')) continue;

      // Создаём колоду
      final deckId = await db.createDeck(DecksCompanion.insert(
        name: set.name,
        sourceLanguage: 'en',
        targetLanguage: targetLang,
        isBuiltIn: const drift.Value(true),
      ));

      // Добавляем карточки
      for (final card in set.cards) {
        await db.createCard(CardsCompanion.insert(
          deckId: deckId,
          frontText: card.front,
          backText: card.back,
          pronunciation: drift.Value(
              card.pronunciation.isEmpty ? null : card.pronunciation),
          transcription: drift.Value(
              card.transcription.isEmpty ? null : card.transcription),
          example: drift.Value(card.example.isEmpty ? null : card.example),
          notes: drift.Value(card.notes.isEmpty ? null : card.notes),
          frontVideoUrl:
              drift.Value(card.videoUrl.isEmpty ? null : card.videoUrl),
          frontImagePath:
              drift.Value(card.imageUrl.isEmpty ? null : card.imageUrl),
        ));
      }
      added++;
    }

    return added;
  }
}

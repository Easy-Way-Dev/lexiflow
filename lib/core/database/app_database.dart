import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'app_database.g.dart';

// ============================================
// ТАБЛИЦЫ (Tables)
// ============================================

/// Таблица колод карточек
class Decks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  TextColumn get description => text().nullable()();
  TextColumn get sourceLanguage => text().withLength(min: 2, max: 5)();
  TextColumn get targetLanguage => text().withLength(min: 2, max: 5)();
  IntColumn get totalCards => integer().withDefault(const Constant(0))();
  IntColumn get masteredCards => integer().withDefault(const Constant(0))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get lastStudiedAt => dateTime().nullable()();
}

/// Таблица карточек
@DataClassName('CardData')
class Cards extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get deckId =>
      integer().references(Decks, #id, onDelete: KeyAction.cascade)();

  // Контент
  TextColumn get frontText => text()();
  TextColumn get backText => text()();
  TextColumn get frontImagePath => text().nullable()();
  TextColumn get backImagePath => text().nullable()();
  TextColumn get frontAudioPath => text().nullable()();
  TextColumn get backAudioPath => text().nullable()();
  TextColumn get pronunciation => text().nullable()();
  TextColumn get example => text().nullable()();
  TextColumn get notes => text().nullable()();

  // Прогресс обучения
  IntColumn get easinessFactor =>
      integer().withDefault(const Constant(250))(); // 2.5 * 100
  IntColumn get repetitions => integer().withDefault(const Constant(0))();
  IntColumn get interval => integer().withDefault(const Constant(0))(); // дни
  DateTimeColumn get nextReviewDate => dateTime().nullable()();
  DateTimeColumn get lastReviewedAt => dateTime().nullable()();

  // Статистика
  IntColumn get correctCount => integer().withDefault(const Constant(0))();
  IntColumn get incorrectCount => integer().withDefault(const Constant(0))();
  BoolColumn get isMastered => boolean().withDefault(const Constant(false))();

  // Метаданные
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

/// История повторений карточек
class ReviewHistory extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get cardId =>
      integer().references(Cards, #id, onDelete: KeyAction.cascade)();
  IntColumn get quality => integer()(); // 0-5 (SM-2 algorithm)
  IntColumn get timeSpentSeconds => integer()();
  DateTimeColumn get reviewedAt => dateTime().withDefault(currentDateAndTime)();
}

/// Настройки пользователя
class Settings extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get key => text().unique()();
  TextColumn get value => text()();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

// ============================================
// DATABASE
// ============================================

@DriftDatabase(tables: [Decks, Cards, ReviewHistory, Settings])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // ============================================
  // DECKS QUERIES
  // ============================================

  /// Получить все колоды
  Future<List<Deck>> getAllDecks() => select(decks).get();

  /// Получить колоду по ID
  Future<Deck?> getDeckById(int id) =>
      (select(decks)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();

  /// Создать новую колоду
  Future<int> createDeck(DecksCompanion deck) => into(decks).insert(deck);

  /// Обновить колоду
  Future<bool> updateDeck(Deck deck) => update(decks).replace(deck);

  /// Удалить колоду
  Future<int> deleteDeck(int id) =>
      (delete(decks)..where((tbl) => tbl.id.equals(id))).go();

  /// Обновить статистику колоды
  Future<void> updateDeckStats(int deckId) async {
    final cardsQuery = select(cards)..where((tbl) => tbl.deckId.equals(deckId));

    final deckCards = await cardsQuery.get();
    final totalCards = deckCards.length;
    final masteredCards = deckCards.where((c) => c.isMastered).length;

    await (update(decks)..where((tbl) => tbl.id.equals(deckId))).write(
      DecksCompanion(
        totalCards: Value(totalCards),
        masteredCards: Value(masteredCards),
      ),
    );
  }

  // ============================================
  // CARDS QUERIES
  // ============================================

  /// Получить все карточки колоды
  Future<List<CardData>> getCardsByDeckId(int deckId) =>
      (select(cards)..where((tbl) => tbl.deckId.equals(deckId))).get();

  /// Получить карточку по ID
  Future<CardData?> getCardById(int id) =>
      (select(cards)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();

  /// Создать новую карточку
  Future<int> createCard(CardsCompanion card) async {
    final cardId = await into(cards).insert(card);
    // Обновляем статистику колоды
    if (card.deckId.present) {
      await updateDeckStats(card.deckId.value);
    }
    return cardId;
  }

  /// Обновить карточку
  Future<bool> updateCard(CardData card) async {
    final result = await update(cards).replace(card);
    await updateDeckStats(card.deckId);
    return result;
  }

  /// Удалить карточку
  Future<int> deleteCard(int id) async {
    final card = await getCardById(id);
    final result =
        await (delete(cards)..where((tbl) => tbl.id.equals(id))).go();
    if (card != null) {
      await updateDeckStats(card.deckId);
    }
    return result;
  }

  /// Получить карточки для повторения
  Future<List<CardData>> getCardsForReview(int deckId) {
    final now = DateTime.now();
    return (select(cards)
          ..where((tbl) =>
              tbl.deckId.equals(deckId) &
              tbl.isMastered.equals(false) &
              (tbl.nextReviewDate.isNull() |
                  tbl.nextReviewDate.isSmallerOrEqualValue(now)))
          ..orderBy([(tbl) => OrderingTerm(expression: tbl.nextReviewDate)]))
        .get();
  }

  /// Получить освоенные карточки
  Future<List<CardData>> getMasteredCards(int deckId) => (select(cards)
        ..where(
            (tbl) => tbl.deckId.equals(deckId) & tbl.isMastered.equals(true)))
      .get();

  // ============================================
  // REVIEW HISTORY QUERIES
  // ============================================

  /// Добавить запись о повторении
  Future<int> addReviewHistory(ReviewHistoryCompanion history) =>
      into(reviewHistory).insert(history);

  /// Получить историю повторений карточки
  Future<List<ReviewHistoryData>> getCardReviewHistory(int cardId) =>
      (select(reviewHistory)
            ..where((tbl) => tbl.cardId.equals(cardId))
            ..orderBy([(tbl) => OrderingTerm.desc(tbl.reviewedAt)]))
          .get();

  /// Получить статистику за период
  Future<List<ReviewHistoryData>> getReviewHistoryByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) =>
      (select(reviewHistory)
            ..where((tbl) =>
                tbl.reviewedAt.isBiggerOrEqualValue(startDate) &
                tbl.reviewedAt.isSmallerOrEqualValue(endDate))
            ..orderBy([(tbl) => OrderingTerm.desc(tbl.reviewedAt)]))
          .get();

  // ============================================
  // SETTINGS QUERIES
  // ============================================

  /// Получить настройку
  Future<Setting?> getSetting(String key) =>
      (select(settings)..where((tbl) => tbl.key.equals(key))).getSingleOrNull();

  /// Сохранить настройку
  Future<void> setSetting(String key, String value) async {
    final existing = await getSetting(key);
    if (existing != null) {
      await (update(settings)..where((tbl) => tbl.key.equals(key))).write(
        SettingsCompanion(
          value: Value(value),
          updatedAt: Value(DateTime.now()),
        ),
      );
    } else {
      await into(settings).insert(
        SettingsCompanion(
          key: Value(key),
          value: Value(value),
        ),
      );
    }
  }

  /// Удалить настройку
  Future<int> deleteSetting(String key) =>
      (delete(settings)..where((tbl) => tbl.key.equals(key))).go();
}

// ============================================
// DATABASE CONNECTION
// ============================================

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'lexiflow.db'));
    return NativeDatabase(file);
  });
}

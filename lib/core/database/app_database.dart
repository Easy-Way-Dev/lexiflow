import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'app_database.g.dart';

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

  // НОВОЕ: Видео URL
  TextColumn get frontVideoUrl => text().nullable()();
  TextColumn get backVideoUrl => text().nullable()();

  TextColumn get pronunciation => text().nullable()();
  TextColumn get example => text().nullable()();
  TextColumn get notes => text().nullable()();

  // SM-2
  IntColumn get easinessFactor => integer().withDefault(const Constant(250))();
  IntColumn get repetitions => integer().withDefault(const Constant(0))();
  IntColumn get interval => integer().withDefault(const Constant(0))();
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

class ReviewHistory extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get cardId =>
      integer().references(Cards, #id, onDelete: KeyAction.cascade)();
  IntColumn get quality => integer()();
  IntColumn get timeSpentSeconds => integer()();
  DateTimeColumn get reviewedAt => dateTime().withDefault(currentDateAndTime)();
}

class Settings extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get key => text().unique()();
  TextColumn get value => text()();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

@DriftDatabase(tables: [Decks, Cards, ReviewHistory, Settings])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
        },
        onUpgrade: (m, from, to) async {
          // v1 → v2: ничего не меняли в Cards
          // v2 → v3: добавляем frontVideoUrl и backVideoUrl
          if (from < 3) {
            await m.addColumn(cards, cards.frontVideoUrl);
            await m.addColumn(cards, cards.backVideoUrl);
          }
        },
      );

  // ============================================
  // DECKS QUERIES
  // ============================================

  Future<List<Deck>> getAllDecks() => select(decks).get();

  Future<Deck?> getDeckById(int id) =>
      (select(decks)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();

  Future<int> createDeck(DecksCompanion deck) => into(decks).insert(deck);

  Future<bool> updateDeck(Deck deck) => update(decks).replace(deck);

  Future<int> deleteDeck(int id) =>
      (delete(decks)..where((tbl) => tbl.id.equals(id))).go();

  Future<void> updateDeckStats(int deckId) async {
    final deckCards =
        await (select(cards)..where((tbl) => tbl.deckId.equals(deckId))).get();
    await (update(decks)..where((tbl) => tbl.id.equals(deckId))).write(
      DecksCompanion(
        totalCards: Value(deckCards.length),
        masteredCards: Value(deckCards.where((c) => c.isMastered).length),
      ),
    );
  }

  // ============================================
  // CARDS QUERIES
  // ============================================

  Future<List<CardData>> getCardsByDeckId(int deckId) =>
      (select(cards)..where((tbl) => tbl.deckId.equals(deckId))).get();

  Future<CardData?> getCardById(int id) =>
      (select(cards)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();

  Future<int> createCard(CardsCompanion card) async {
    final cardId = await into(cards).insert(card);
    if (card.deckId.present) await updateDeckStats(card.deckId.value);
    return cardId;
  }

  Future<bool> updateCard(CardData card) async {
    final result = await update(cards).replace(card);
    await updateDeckStats(card.deckId);
    return result;
  }

  Future<int> deleteCard(int id) async {
    final card = await getCardById(id);
    final result =
        await (delete(cards)..where((tbl) => tbl.id.equals(id))).go();
    if (card != null) await updateDeckStats(card.deckId);
    return result;
  }

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

  Future<List<CardData>> getMasteredCards(int deckId) => (select(cards)
        ..where(
            (tbl) => tbl.deckId.equals(deckId) & tbl.isMastered.equals(true)))
      .get();

  // ============================================
  // REVIEW HISTORY
  // ============================================

  Future<int> addReviewHistory(ReviewHistoryCompanion history) =>
      into(reviewHistory).insert(history);

  Future<List<ReviewHistoryData>> getCardReviewHistory(int cardId) =>
      (select(reviewHistory)
            ..where((tbl) => tbl.cardId.equals(cardId))
            ..orderBy([(tbl) => OrderingTerm.desc(tbl.reviewedAt)]))
          .get();

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
  // SETTINGS
  // ============================================

  Future<Setting?> getSetting(String key) =>
      (select(settings)..where((tbl) => tbl.key.equals(key))).getSingleOrNull();

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
        SettingsCompanion(key: Value(key), value: Value(value)),
      );
    }
  }

  Future<int> deleteSetting(String key) =>
      (delete(settings)..where((tbl) => tbl.key.equals(key))).go();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'lexiflow.db'));
    return NativeDatabase(file);
  });
}

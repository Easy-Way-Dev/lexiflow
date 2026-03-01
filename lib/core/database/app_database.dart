import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'app_database.g.dart';

// ============================================
// TABLES
// ============================================

class Decks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  TextColumn get description => text().nullable()();
  TextColumn get sourceLanguage => text().withLength(min: 2, max: 10)();
  TextColumn get targetLanguage => text().withLength(min: 2, max: 10)();
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
  TextColumn get frontText => text()();
  TextColumn get backText => text()();
  TextColumn get frontImagePath => text().nullable()();
  TextColumn get backImagePath => text().nullable()();
  TextColumn get frontAudioPath => text().nullable()();
  TextColumn get backAudioPath => text().nullable()();
  TextColumn get frontVideoUrl => text().nullable()();
  TextColumn get backVideoUrl => text().nullable()();
  TextColumn get pronunciation => text().nullable()();
  TextColumn get transcription => text().nullable()();
  TextColumn get example => text().nullable()();
  TextColumn get notes => text().nullable()();
  IntColumn get easinessFactor => integer().withDefault(const Constant(250))();
  IntColumn get repetitions => integer().withDefault(const Constant(0))();
  IntColumn get interval => integer().withDefault(const Constant(0))();
  DateTimeColumn get nextReviewDate => dateTime().nullable()();
  DateTimeColumn get lastReviewedAt => dateTime().nullable()();
  IntColumn get correctCount => integer().withDefault(const Constant(0))();
  IntColumn get incorrectCount => integer().withDefault(const Constant(0))();
  BoolColumn get isMastered => boolean().withDefault(const Constant(false))();
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

@DataClassName('DailyStatsData')
class DailyStats extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get date => dateTime()();
  IntColumn get cardsStudied => integer().withDefault(const Constant(0))();
  IntColumn get correctAnswers => integer().withDefault(const Constant(0))();
  IntColumn get incorrectAnswers => integer().withDefault(const Constant(0))();
  IntColumn get timeSpentMinutes => integer().withDefault(const Constant(0))();
  IntColumn get sessionsCount => integer().withDefault(const Constant(0))();
}

// ============================================
// DATABASE
// ============================================

@DriftDatabase(tables: [Decks, Cards, ReviewHistory, Settings, DailyStats])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  // Подняли версию до 7, чтобы форсировать миграцию
  @override
  int get schemaVersion => 7;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
        },
        onUpgrade: (m, from, to) async {
          if (from < 2) {
            await m.createTable(dailyStats);
          }
          if (from < 3) {
            await m.addColumn(cards, cards.frontVideoUrl);
            await m.addColumn(cards, cards.backVideoUrl);
          }
          if (from < 6) {
            await m.addColumn(cards, cards.transcription);
          }
          // Новая миграция для фикса пропущенных таблиц
          if (from < 7) {
            try {
              await m.createTable(dailyStats);
            } catch (_) {
              // Если таблица уже есть, просто идем дальше
            }
          }
        },
      );

  // ============================================
  // DECKS
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
  // CARDS
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
          DateTime startDate, DateTime endDate) =>
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
      await into(settings)
          .insert(SettingsCompanion(key: Value(key), value: Value(value)));
    }
  }

  // ============================================
  // DAILY STATS
  // ============================================

  Future<DailyStatsData?> getDailyStats(DateTime date) async {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));
    final all = await select(dailyStats).get();
    try {
      return all.firstWhere((s) =>
          s.date.isAfter(startOfDay.subtract(const Duration(seconds: 1))) &&
          s.date.isBefore(endOfDay));
    } catch (_) {
      return null;
    }
  }

  Future<void> updateDailyStats({
    required int cardsStudied,
    required int correct,
    required int incorrect,
  }) async {
    final today = DateTime.now();
    final existing = await getDailyStats(today);
    if (existing != null) {
      await (update(dailyStats)..where((tbl) => tbl.id.equals(existing.id)))
          .write(DailyStatsCompanion(
        cardsStudied: Value(existing.cardsStudied + cardsStudied),
        correctAnswers: Value(existing.correctAnswers + correct),
        incorrectAnswers: Value(existing.incorrectAnswers + incorrect),
        sessionsCount: Value(existing.sessionsCount + 1),
      ));
    } else {
      await into(dailyStats).insert(DailyStatsCompanion(
        date: Value(today),
        cardsStudied: Value(cardsStudied),
        correctAnswers: Value(correct),
        incorrectAnswers: Value(incorrect),
        sessionsCount: const Value(1),
      ));
    }
  }

  // ============================================
  // STREAK CALCULATION
  // ============================================

  Future<int> getCurrentStreak() async {
    final today = DateTime.now();
    final stats = await select(dailyStats).get();

    if (stats.isEmpty) return 0;

    stats.sort((a, b) => b.date.compareTo(a.date));

    int streak = 0;
    DateTime checkDate = DateTime(today.year, today.month, today.day);

    for (final stat in stats) {
      final statDate = DateTime(stat.date.year, stat.date.month, stat.date.day);

      if (statDate == checkDate) {
        streak++;
        checkDate = checkDate.subtract(const Duration(days: 1));
      } else if (statDate.isBefore(checkDate)) {
        break;
      }
    }

    return streak;
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'lexiflow.db'));
    return NativeDatabase(file);
  });
}


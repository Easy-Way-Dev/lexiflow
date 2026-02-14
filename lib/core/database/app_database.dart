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
  TextColumn get frontText => text()();
  TextColumn get backText => text()();
  TextColumn get frontImagePath => text().nullable()();
  TextColumn get backImagePath => text().nullable()();
  TextColumn get frontAudioPath => text().nullable()();
  TextColumn get backAudioPath => text().nullable()();
  TextColumn get frontVideoUrl => text().nullable()();
  TextColumn get backVideoUrl => text().nullable()();
  TextColumn get pronunciation => text().nullable()();
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

// ===== ДОБАВЛЕНА АННОТАЦИЯ! =====
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

@DataClassName('UserProgressData')
class UserProgress extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get totalPoints => integer().withDefault(const Constant(0))();
  IntColumn get currentLevel => integer().withDefault(const Constant(1))();
  IntColumn get currentStreak => integer().withDefault(const Constant(0))();
  IntColumn get longestStreak => integer().withDefault(const Constant(0))();
  IntColumn get totalCardsStudied => integer().withDefault(const Constant(0))();
  IntColumn get totalCorrect => integer().withDefault(const Constant(0))();
  IntColumn get totalSessions => integer().withDefault(const Constant(0))();
  DateTimeColumn get lastStudyDate => dateTime().nullable()();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

// ============================================
// DATABASE
// ============================================

@DriftDatabase(
    tables: [Decks, Cards, ReviewHistory, Settings, DailyStats, UserProgress])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
          await into(userProgress).insert(
            const UserProgressCompanion(),
          );
        },
        onUpgrade: (m, from, to) async {
          if (from < 2) {
            await m.createTable(dailyStats);
          }
          if (from < 3) {
            await m.addColumn(cards, cards.frontVideoUrl);
            await m.addColumn(cards, cards.backVideoUrl);
          }
          if (from < 4) {
            await m.createTable(userProgress);
            await into(userProgress).insert(
              const UserProgressCompanion(),
            );
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
  // USER PROGRESS
  // ============================================

  Future<UserProgressData?> getUserProgress() =>
      (select(userProgress)..limit(1)).getSingleOrNull();

  Future<int> addPoints(int points) async {
    final progress = await getUserProgress();
    if (progress == null) return 0;

    final newTotal = progress.totalPoints + points;
    final newLevel = LevelSystem.getLevelForPoints(newTotal);
    final newStudied = progress.totalCardsStudied + 1;
    final newCorrect =
        points > 0 ? progress.totalCorrect + 1 : progress.totalCorrect;

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    int newStreak = progress.currentStreak;
    int newLongest = progress.longestStreak;

    if (progress.lastStudyDate != null) {
      final last = progress.lastStudyDate!;
      final lastDate = DateTime(last.year, last.month, last.day);
      final diff = today.difference(lastDate).inDays;
      if (diff == 1) {
        newStreak++;
      } else if (diff > 1) {
        newStreak = 1;
      }
    } else {
      newStreak = 1;
    }
    if (newStreak > newLongest) newLongest = newStreak;

    await (update(userProgress)..where((tbl) => tbl.id.equals(progress.id)))
        .write(UserProgressCompanion(
      totalPoints: Value(newTotal),
      currentLevel: Value(newLevel),
      currentStreak: Value(newStreak),
      longestStreak: Value(newLongest),
      totalCardsStudied: Value(newStudied),
      totalCorrect: Value(newCorrect),
      lastStudyDate: Value(now),
      updatedAt: Value(now),
    ));

    return newTotal;
  }

  Future<void> addSessionBonus(int cardsCount, int correctCount) async {
    final bonus = LevelSystem.sessionBonus(cardsCount, correctCount);
    if (bonus > 0) await addPoints(bonus);
  }
}

// ============================================
// СИСТЕМА УРОВНЕЙ
// ============================================

class LevelSystem {
  static int pointsForQuality(int quality, {int hintsUsed = 0}) {
    if (quality < 3) return 0;
    final base = switch (quality) {
      3 => 5,
      4 => 10,
      5 => 15,
      _ => 0,
    };
    final penalty = hintsUsed * 2;
    return (base - penalty).clamp(0, base);
  }

  static int sessionBonus(int total, int correct) {
    if (total == 0) return 0;
    final accuracy = correct / total;
    if (accuracy >= 1.0) return 30;
    if (accuracy >= 0.8) return 15;
    if (accuracy >= 0.6) return 5;
    return 0;
  }

  static int getLevelForPoints(int points) {
    for (int i = levels.length - 1; i >= 0; i--) {
      if (points >= levels[i].minPoints) return levels[i].level;
    }
    return 1;
  }

  static LevelInfo getLevelInfo(int level) =>
      levels.firstWhere((l) => l.level == level, orElse: () => levels.last);

  static LevelInfo? getNextLevel(int level) {
    final idx = levels.indexWhere((l) => l.level == level);
    if (idx == -1 || idx == levels.length - 1) return null;
    return levels[idx + 1];
  }

  static double levelProgress(int totalPoints, int level) {
    final current = getLevelInfo(level);
    final next = getNextLevel(level);
    if (next == null) return 1.0;
    final range = next.minPoints - current.minPoints;
    final earned = totalPoints - current.minPoints;
    return (earned / range).clamp(0.0, 1.0);
  }

  static const List<LevelInfo> levels = [
    LevelInfo(level: 1, name: 'Новичок', emoji: '🌱', minPoints: 0),
    LevelInfo(level: 2, name: 'Ученик', emoji: '📖', minPoints: 100),
    LevelInfo(level: 3, name: 'Студент', emoji: '🎓', minPoints: 300),
    LevelInfo(level: 4, name: 'Знаток', emoji: '🧠', minPoints: 700),
    LevelInfo(level: 5, name: 'Эксперт', emoji: '⭐', minPoints: 1500),
    LevelInfo(level: 6, name: 'Мастер', emoji: '🏆', minPoints: 3000),
    LevelInfo(level: 7, name: 'Полиглот', emoji: '🌍', minPoints: 6000),
    LevelInfo(level: 8, name: 'Легенда', emoji: '👑', minPoints: 12000),
  ];
}

class LevelInfo {
  final int level;
  final String name;
  final String emoji;
  final int minPoints;

  const LevelInfo({
    required this.level,
    required this.name,
    required this.emoji,
    required this.minPoints,
  });
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'lexiflow.db'));
    return NativeDatabase(file);
  });
}

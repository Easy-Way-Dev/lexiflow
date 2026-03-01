/// Модель мотивационной цитаты
class MotivationalQuote {
  final String text;
  final String author;
  final String category;

  const MotivationalQuote({
    required this.text,
    required this.author,
    required this.category,
  });
}

/// Сервис для работы с цитатами
class QuotesService {
  static const List<MotivationalQuote> _allQuotes = [
    // КАТЕГОРИЯ: О ЯЗЫКАХ
    MotivationalQuote(
      text: "The limits of my language mean the limits of my world.",
      author: "Ludwig Wittgenstein",
      category: "language",
    ),
    MotivationalQuote(
      text:
          "One language sets you in a corridor for life. Two languages open every door along the way.",
      author: "Frank Smith",
      category: "language",
    ),
    MotivationalQuote(
      text: "To have another language is to possess a second soul.",
      author: "Charlemagne",
      category: "language",
    ),
    MotivationalQuote(
      text: "Language is the road map of a culture.",
      author: "Rita Mae Brown",
      category: "language",
    ),
    MotivationalQuote(
      text: "A different language is a different vision of life.",
      author: "Federico Fellini",
      category: "language",
    ),
    MotivationalQuote(
      text:
          "Those who know nothing of foreign languages know nothing of their own.",
      author: "Johann Wolfgang von Goethe",
      category: "language",
    ),
    MotivationalQuote(
      text: "The more languages you know, the more you are human.",
      author: "Tomáš Garrigue Masaryk",
      category: "language",
    ),
    MotivationalQuote(
      text: "With languages, you are at home anywhere.",
      author: "Edmund de Waal",
      category: "language",
    ),
    MotivationalQuote(
      text: "Learn a new language and get a new soul.",
      author: "Czech Proverb",
      category: "language",
    ),
    MotivationalQuote(
      text: "Knowledge of languages is the doorway to wisdom.",
      author: "Roger Bacon",
      category: "language",
    ),
    MotivationalQuote(
      text:
          "To learn a language is to have one more window from which to look at the world.",
      author: "Chinese Proverb",
      category: "language",
    ),

    // КАТЕГОРИЯ: ОБ ОБУЧЕНИИ
    MotivationalQuote(
      text: "Learning never exhausts the mind.",
      author: "Leonardo da Vinci",
      category: "learning",
    ),
    MotivationalQuote(
      text:
          "The beautiful thing about learning is that no one can take it away from you.",
      author: "B.B. King",
      category: "learning",
    ),
    MotivationalQuote(
      text:
          "Live as if you were to die tomorrow. Learn as if you were to live forever.",
      author: "Mahatma Gandhi",
      category: "learning",
    ),
    MotivationalQuote(
      text: "Anyone who stops learning is old, whether at twenty or eighty.",
      author: "Henry Ford",
      category: "learning",
    ),
    MotivationalQuote(
      text:
          "The capacity to learn is a gift; the ability to learn is a skill; the willingness to learn is a choice.",
      author: "Brian Herbert",
      category: "learning",
    ),
    MotivationalQuote(
      text:
          "Learning is not attained by chance, it must be sought for with ardor.",
      author: "Abigail Adams",
      category: "learning",
    ),
    MotivationalQuote(
      text: "The expert in anything was once a beginner.",
      author: "Helen Hayes",
      category: "learning",
    ),
    MotivationalQuote(
      text: "Education is the passport to the future.",
      author: "Malcolm X",
      category: "learning",
    ),
    MotivationalQuote(
      text: "The more that you read, the more things you will know.",
      author: "Dr. Seuss",
      category: "learning",
    ),
    MotivationalQuote(
      text: "Learning is a treasure that will follow its owner everywhere.",
      author: "Chinese Proverb",
      category: "learning",
    ),

    // КАТЕГОРИЯ: МОТИВАЦИЯ
    MotivationalQuote(
      text: "Success is the sum of small efforts repeated day in and day out.",
      author: "Robert Collier",
      category: "motivation",
    ),
    MotivationalQuote(
      text: "Don't watch the clock; do what it does. Keep going.",
      author: "Sam Levenson",
      category: "motivation",
    ),
    MotivationalQuote(
      text: "The secret of getting ahead is getting started.",
      author: "Mark Twain",
      category: "motivation",
    ),
    MotivationalQuote(
      text: "It does not matter how slowly you go as long as you do not stop.",
      author: "Confucius",
      category: "motivation",
    ),
    MotivationalQuote(
      text: "Believe you can and you're halfway there.",
      author: "Theodore Roosevelt",
      category: "motivation",
    ),
    MotivationalQuote(
      text: "The only way to do great work is to love what you do.",
      author: "Steve Jobs",
      category: "motivation",
    ),
    MotivationalQuote(
      text: "Start where you are. Use what you have. Do what you can.",
      author: "Arthur Ashe",
      category: "motivation",
    ),
    MotivationalQuote(
      text: "Small daily improvements over time lead to stunning results.",
      author: "Robin Sharma",
      category: "motivation",
    ),
    MotivationalQuote(
      text:
          "You don't have to be great to start, but you have to start to be great.",
      author: "Zig Ziglar",
      category: "motivation",
    ),
    MotivationalQuote(
      text: "Excellence is not a destination; it is a continuous journey.",
      author: "Brian Tracy",
      category: "motivation",
    ),

    // КАТЕГОРИЯ: УСПЕХ
    MotivationalQuote(
      text:
          "Success is not final, failure is not fatal: it is the courage to continue that counts.",
      author: "Winston Churchill",
      category: "success",
    ),
    MotivationalQuote(
      text:
          "The only place where success comes before work is in the dictionary.",
      author: "Vidal Sassoon",
      category: "success",
    ),
    MotivationalQuote(
      text:
          "Success usually comes to those who are too busy to be looking for it.",
      author: "Henry David Thoreau",
      category: "success",
    ),
    MotivationalQuote(
      text: "I find that the harder I work, the more luck I seem to have.",
      author: "Thomas Jefferson",
      category: "success",
    ),
    MotivationalQuote(
      text:
          "Success is walking from failure to failure with no loss of enthusiasm.",
      author: "Winston Churchill",
      category: "success",
    ),
    MotivationalQuote(
      text:
          "The road to success and the road to failure are almost exactly the same.",
      author: "Colin R. Davis",
      category: "success",
    ),
    MotivationalQuote(
      text:
          "Success is liking yourself, liking what you do, and liking how you do it.",
      author: "Maya Angelou",
      category: "success",
    ),
    MotivationalQuote(
      text: "Opportunities don't happen. You create them.",
      author: "Chris Grosser",
      category: "success",
    ),

    // КАТЕГОРИЯ: НАСТОЙЧИВОСТЬ
    MotivationalQuote(
      text:
          "It's not that I'm so smart, it's just that I stay with problems longer.",
      author: "Albert Einstein",
      category: "persistence",
    ),
    MotivationalQuote(
      text: "Persistence is the twin sister of excellence.",
      author: "Marabel Morgan",
      category: "persistence",
    ),
    MotivationalQuote(
      text: "Fall seven times, stand up eight.",
      author: "Japanese Proverb",
      category: "persistence",
    ),
    MotivationalQuote(
      text:
          "The difference between a successful person and others is not lack of strength but lack in will.",
      author: "Vince Lombardi",
      category: "persistence",
    ),
    MotivationalQuote(
      text:
          "Many of life's failures are people who did not realize how close they were to success when they gave up.",
      author: "Thomas Edison",
      category: "persistence",
    ),
    MotivationalQuote(
      text:
          "Patience, persistence and perspiration make an unbeatable combination for success.",
      author: "Napoleon Hill",
      category: "persistence",
    ),
    MotivationalQuote(
      text: "The only guarantee for failure is to stop trying.",
      author: "John C. Maxwell",
      category: "persistence",
    ),

    // КАТЕГОРИЯ: ВДОХНОВЕНИЕ
    MotivationalQuote(
      text:
          "The future belongs to those who believe in the beauty of their dreams.",
      author: "Eleanor Roosevelt",
      category: "inspiration",
    ),
    MotivationalQuote(
      text:
          "You are never too old to set another goal or to dream a new dream.",
      author: "C.S. Lewis",
      category: "inspiration",
    ),
    MotivationalQuote(
      text:
          "What lies behind us and what lies before us are tiny matters compared to what lies within us.",
      author: "Ralph Waldo Emerson",
      category: "inspiration",
    ),
    MotivationalQuote(
      text: "Everything you've ever wanted is on the other side of fear.",
      author: "George Addair",
      category: "inspiration",
    ),
    MotivationalQuote(
      text: "Dream big and dare to fail.",
      author: "Norman Vaughan",
      category: "inspiration",
    ),
    MotivationalQuote(
      text:
          "The best time to plant a tree was 20 years ago. The second best time is now.",
      author: "Chinese Proverb",
      category: "inspiration",
    ),
  ];

  /// Получить случайную цитату
  static MotivationalQuote getRandomQuote() {
    final random = DateTime.now().millisecondsSinceEpoch;
    final index = random % _allQuotes.length;
    return _allQuotes[index];
  }

  /// Получить случайную цитату определённой категории
  static MotivationalQuote getRandomQuoteByCategory(String category) {
    final categoryQuotes =
        _allQuotes.where((q) => q.category == category).toList();
    if (categoryQuotes.isEmpty) return getRandomQuote();

    final random = DateTime.now().millisecondsSinceEpoch;
    final index = random % categoryQuotes.length;
    return categoryQuotes[index];
  }

  /// Получить цитату в зависимости от прогресса
  static MotivationalQuote getQuoteByProgress({
    required int studiedCards,
    required int totalCards,
  }) {
    final progress = studiedCards / totalCards;

    if (progress >= 0.8) {
      // Почти закончили - мотивационные цитаты
      return getRandomQuoteByCategory('motivation');
    } else if (progress >= 0.5) {
      // Половина пройдена - цитаты о настойчивости
      return getRandomQuoteByCategory('persistence');
    } else {
      // Начало - цитаты о языках и обучении
      final categories = ['language', 'learning', 'inspiration'];
      final categoryIndex =
          DateTime.now().millisecondsSinceEpoch % categories.length;
      return getRandomQuoteByCategory(categories[categoryIndex]);
    }
  }

  /// Получить все категории
  static List<String> getAllCategories() {
    return _allQuotes.map((q) => q.category).toSet().toList();
  }

  /// Получить количество цитат
  static int getTotalQuotesCount() => _allQuotes.length;
}


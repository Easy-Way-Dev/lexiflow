import 'dart:math';

class Quote {
  final String text;
  final String author;
  final String category;

  const Quote({
    required this.text,
    required this.author,
    required this.category,
  });
}

class AppQuotes {
  static const List<Quote> allQuotes = [
    // ЯЗЫКИ
    Quote(
      text: "The limits of my language mean the limits of my world.",
      author: "Ludwig Wittgenstein",
      category: "language",
    ),
    Quote(
      text:
          "One language sets you in a corridor for life. Two languages open every door along the way.",
      author: "Frank Smith",
      category: "language",
    ),
    Quote(
      text: "To have another language is to possess a second soul.",
      author: "Charlemagne",
      category: "language",
    ),
    Quote(
      text: "A different language is a different vision of life.",
      author: "Federico Fellini",
      category: "language",
    ),
    Quote(
      text: "Language is the road map of a culture.",
      author: "Rita Mae Brown",
      category: "language",
    ),

    // ОБУЧЕНИЕ
    Quote(
      text: "Learning never exhausts the mind.",
      author: "Leonardo da Vinci",
      category: "learning",
    ),
    Quote(
      text:
          "The beautiful thing about learning is that no one can take it away from you.",
      author: "B.B. King",
      category: "learning",
    ),
    Quote(
      text:
          "Live as if you were to die tomorrow. Learn as if you were to live forever.",
      author: "Mahatma Gandhi",
      category: "learning",
    ),
    Quote(
      text: "The expert in anything was once a beginner.",
      author: "Helen Hayes",
      category: "learning",
    ),
    Quote(
      text: "Learn everything you can, anytime you can, from anyone you can.",
      author: "Sarah Caldwell",
      category: "learning",
    ),

    // МОТИВАЦИЯ
    Quote(
      text: "Success is the sum of small efforts repeated day in and day out.",
      author: "Robert Collier",
      category: "motivation",
    ),
    Quote(
      text: "Don't watch the clock; do what it does. Keep going.",
      author: "Sam Levenson",
      category: "motivation",
    ),
    Quote(
      text:
          "You don't have to be great to start, but you have to start to be great.",
      author: "Zig Ziglar",
      category: "motivation",
    ),
    Quote(
      text: "Believe you can and you're halfway there.",
      author: "Theodore Roosevelt",
      category: "motivation",
    ),
    Quote(
      text: "The only way to do great work is to love what you do.",
      author: "Steve Jobs",
      category: "motivation",
    ),
    Quote(
      text: "Start where you are. Use what you have. Do what you can.",
      author: "Arthur Ashe",
      category: "motivation",
    ),
    Quote(
      text: "It always seems impossible until it's done.",
      author: "Nelson Mandela",
      category: "motivation",
    ),
    Quote(
      text: "Dream big and dare to fail.",
      author: "Norman Vaughan",
      category: "motivation",
    ),

    // ПОСТОЯНСТВО
    Quote(
      text: "A little progress each day adds up to big results.",
      author: "Satya Nani",
      category: "persistence",
    ),
    Quote(
      text: "It does not matter how slowly you go as long as you do not stop.",
      author: "Confucius",
      category: "persistence",
    ),
    Quote(
      text:
          "We are what we repeatedly do. Excellence is not an act, but a habit.",
      author: "Aristotle",
      category: "persistence",
    ),
    Quote(
      text:
          "Success is not final, failure is not fatal: it is the courage to continue that counts.",
      author: "Winston Churchill",
      category: "persistence",
    ),
    Quote(
      text:
          "The difference between winning and losing is most often not quitting.",
      author: "Walt Disney",
      category: "persistence",
    ),
  ];

  // Получить случайную цитату
  static Quote getRandomQuote() {
    final random = Random();
    return allQuotes[random.nextInt(allQuotes.length)];
  }

  // Получить цитату по категории
  static Quote getQuoteByCategory(String category) {
    final filtered = allQuotes.where((q) => q.category == category).toList();
    if (filtered.isEmpty) return getRandomQuote();
    final random = Random();
    return filtered[random.nextInt(filtered.length)];
  }
}


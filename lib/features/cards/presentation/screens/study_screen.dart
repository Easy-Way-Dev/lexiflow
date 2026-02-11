import 'package:flutter/material.dart';
import 'package:lexiflow/core/database/app_database.dart';
import 'package:drift/drift.dart' as drift;
import 'dart:math' as math;
import 'dart:io';

class StudyScreen extends StatefulWidget {
  final AppDatabase db;
  final int deckId;
  final String deckName;

  const StudyScreen({
    super.key,
    required this.db,
    required this.deckId,
    required this.deckName,
  });

  @override
  State<StudyScreen> createState() => _StudyScreenState();
}

class _StudyScreenState extends State<StudyScreen>
    with SingleTickerProviderStateMixin {
  List<CardData> _cards = [];
  int _currentIndex = 0;
  bool _isFlipped = false;
  bool _isLoading = true;

  late AnimationController _flipController;
  late Animation<double> _flipAnimation;

  @override
  void initState() {
    super.initState();
    _setupAnimation();
    _loadCards();
  }

  void _setupAnimation() {
    _flipController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _flipAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _flipController, curve: Curves.easeInOut),
    );
  }

  Future<void> _loadCards() async {
    setState(() => _isLoading = true);
    try {
      final cards = await widget.db.getCardsForReview(widget.deckId);

      if (cards.isEmpty) {
        final allCards = await widget.db.getCardsByDeckId(widget.deckId);
        setState(() {
          _cards = allCards;
          _isLoading = false;
        });
      } else {
        setState(() {
          _cards = cards;
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ошибка загрузки: $e')),
        );
      }
    }
  }

  void _flipCard() {
    if (_flipController.isAnimating) return;

    setState(() => _isFlipped = !_isFlipped);

    if (_isFlipped) {
      _flipController.forward();
    } else {
      _flipController.reverse();
    }
  }

  Future<void> _answerCard(int quality) async {
    if (_currentIndex >= _cards.length) return;

    final card = _cards[_currentIndex];
    final startTime = DateTime.now();

    final result = _calculateSM2(
      quality: quality,
      repetitions: card.repetitions,
      easinessFactor: card.easinessFactor / 100,
      interval: card.interval,
    );

    final updatedCard = CardsCompanion(
      id: drift.Value(card.id),
      deckId: drift.Value(card.deckId),
      frontText: drift.Value(card.frontText),
      backText: drift.Value(card.backText),
      frontImagePath: drift.Value(card.frontImagePath),
      backImagePath: drift.Value(card.backImagePath),
      frontAudioPath: drift.Value(card.frontAudioPath),
      backAudioPath: drift.Value(card.backAudioPath),
      pronunciation: drift.Value(card.pronunciation),
      example: drift.Value(card.example),
      notes: drift.Value(card.notes),
      easinessFactor: drift.Value((result.easinessFactor * 100).round()),
      repetitions: drift.Value(result.repetitions),
      interval: drift.Value(result.interval),
      nextReviewDate:
          drift.Value(DateTime.now().add(Duration(days: result.interval))),
      lastReviewedAt: drift.Value(DateTime.now()),
      correctCount:
          drift.Value(quality >= 3 ? card.correctCount + 1 : card.correctCount),
      incorrectCount: drift.Value(
          quality < 3 ? card.incorrectCount + 1 : card.incorrectCount),
      isMastered: drift.Value(result.repetitions >= 5 && result.interval >= 21),
      createdAt: drift.Value(card.createdAt),
      updatedAt: drift.Value(DateTime.now()),
    );

    try {
      await widget.db.into(widget.db.cards).insertOnConflictUpdate(updatedCard);

      await widget.db.addReviewHistory(
        ReviewHistoryCompanion(
          cardId: drift.Value(card.id),
          quality: drift.Value(quality),
          timeSpentSeconds:
              drift.Value(DateTime.now().difference(startTime).inSeconds),
        ),
      );

      _nextCard();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ошибка сохранения: $e')),
        );
      }
    }
  }

  SM2Result _calculateSM2({
    required int quality,
    required int repetitions,
    required double easinessFactor,
    required int interval,
  }) {
    double newEF =
        easinessFactor + (0.1 - (5 - quality) * (0.08 + (5 - quality) * 0.02));

    if (newEF < 1.3) newEF = 1.3;

    int newRepetitions;
    int newInterval;

    if (quality < 3) {
      newRepetitions = 0;
      newInterval = 0;
    } else {
      newRepetitions = repetitions + 1;

      if (newRepetitions == 1) {
        newInterval = 1;
      } else if (newRepetitions == 2) {
        newInterval = 6;
      } else {
        newInterval = (interval * newEF).round();
      }
    }

    return SM2Result(
      easinessFactor: newEF,
      repetitions: newRepetitions,
      interval: newInterval,
    );
  }

  void _nextCard() {
    if (_currentIndex < _cards.length - 1) {
      setState(() {
        _currentIndex++;
        _isFlipped = false;
      });
      _flipController.reset();
    } else {
      _showCompletionDialog();
    }
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.celebration, color: Colors.amber, size: 32),
            SizedBox(width: 8),
            Text('Отлично!'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Вы завершили изучение всех карточек в этой колоде!',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'Изучено карточек: ${_cards.length}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('Готово'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                _currentIndex = 0;
                _isFlipped = false;
              });
              _flipController.reset();
              _loadCards();
            },
            child: const Text('Повторить снова'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _flipController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.deckName),
        actions: [
          if (!_isLoading && _cards.isNotEmpty)
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text(
                  '${_currentIndex + 1} / ${_cards.length}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _cards.isEmpty
              ? _buildEmptyState()
              : _buildStudyInterface(),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.check_circle_outline, size: 80, color: Colors.green[400]),
          const SizedBox(height: 16),
          Text(
            'Нет карточек для изучения',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 8),
          const Text(
            'Все карточки изучены!\nВозвращайтесь позже для повторения.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
            label: const Text('Назад к колодам'),
          ),
        ],
      ),
    );
  }

  Widget _buildStudyInterface() {
    final card = _cards[_currentIndex];
    final progress = (_currentIndex + 1) / _cards.length;

    return Column(
      children: [
        LinearProgressIndicator(
          value: progress,
          backgroundColor: Colors.grey[200],
          minHeight: 4,
        ),
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: _buildFlipCard(card)),
                  const SizedBox(height: 24),
                  if (_isFlipped) _buildAnswerButtons(),
                  if (!_isFlipped) ...[
                    const SizedBox(height: 48),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.touch_app, color: Colors.grey[400]),
                        const SizedBox(width: 8),
                        Text(
                          'Нажмите на карточку чтобы увидеть ответ',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFlipCard(CardData card) {
    return GestureDetector(
      onTap: _flipCard,
      child: AnimatedBuilder(
        animation: _flipAnimation,
        builder: (context, child) {
          final angle = _flipAnimation.value * math.pi;
          final transform = Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(angle);

          return Transform(
            transform: transform,
            alignment: Alignment.center,
            child: angle < math.pi / 2
                ? _buildCardFace(card, isFront: true)
                : Transform(
                    transform: Matrix4.identity()..rotateY(math.pi),
                    alignment: Alignment.center,
                    child: _buildCardFace(card, isFront: false),
                  ),
          );
        },
      ),
    );
  }

  Widget _buildCardFace(CardData card, {required bool isFront}) {
    final text = isFront ? card.frontText : card.backText;
    final imagePath = isFront ? card.frontImagePath : card.backImagePath;
    final hasImage = imagePath != null && imagePath.isNotEmpty;

    final backgroundColor = isFront
        ? Theme.of(context).colorScheme.primaryContainer
        : Theme.of(context).colorScheme.secondaryContainer;

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(maxWidth: 500),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ИЗОБРАЖЕНИЕ (если есть)
                if (hasImage) ...[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.file(
                      File(imagePath),
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 200,
                          color: Colors.grey[300],
                          child: const Center(
                            child: Icon(Icons.broken_image, size: 48),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                ],

                // ТЕКСТ
                Text(
                  text,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                ),

                // ПРОИЗНОШЕНИЕ (только на обратной стороне)
                if (!isFront &&
                    card.pronunciation != null &&
                    card.pronunciation!.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  Text(
                    card.pronunciation!,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.blue,
                          fontStyle: FontStyle.italic,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],

                // ПРИМЕР (только на обратной стороне)
                if (!isFront &&
                    card.example != null &&
                    card.example!.isNotEmpty) ...[
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      card.example!,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontStyle: FontStyle.italic,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnswerButtons() {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: [
        _buildAnswerButton(
          label: 'Не помню',
          icon: Icons.close,
          color: Colors.red,
          quality: 0,
        ),
        _buildAnswerButton(
          label: 'Сложно',
          icon: Icons.sentiment_dissatisfied,
          color: Colors.orange,
          quality: 3,
        ),
        _buildAnswerButton(
          label: 'Хорошо',
          icon: Icons.sentiment_satisfied,
          color: Colors.blue,
          quality: 4,
        ),
        _buildAnswerButton(
          label: 'Легко',
          icon: Icons.sentiment_very_satisfied,
          color: Colors.green,
          quality: 5,
        ),
      ],
    );
  }

  Widget _buildAnswerButton({
    required String label,
    required IconData icon,
    required Color color,
    required int quality,
  }) {
    return FilledButton.icon(
      onPressed: () => _answerCard(quality),
      icon: Icon(icon),
      label: Text(label),
      style: FilledButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}

class SM2Result {
  final double easinessFactor;
  final int repetitions;
  final int interval;

  SM2Result({
    required this.easinessFactor,
    required this.repetitions,
    required this.interval,
  });
}

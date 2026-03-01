import 'dart:io';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:lexiflow/core/database/app_database.dart';
import 'package:lexiflow/core/utils/audio_helper.dart';
import 'package:lexiflow/core/utils/video_helper.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:drift/drift.dart' as drift;
import 'package:lexiflow/shared/widgets/adaptive_layout.dart';

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
  final List<CardData> _incorrectCards = [];
  int _currentIndex = 0;
  bool _isFlipped = false;
  bool _isLoading = true;
  int _correctAnswers = 0;

  final Set<HintType> _usedHints = {};
  bool _hintImageVisible = false;
  bool _hintFirstLetterVisible = false;

  late AnimationController _flipController;
  late Animation<double> _flipAnimation;
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 3));
    _loadCards();
  }

  void _setupAnimations() {
    _flipController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _flipAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _flipController, curve: Curves.easeInOut),
    );
  }

  Future<void> _loadCards() async {
    setState(() {
      _isLoading = true;
    });

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
      setState(() {
        _isLoading = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading: $e')),
        );
      }
    }
  }

  void _flipCard() {
    if (_flipController.isAnimating) return;
    setState(() {
      _isFlipped = !_isFlipped;
    });

    if (_isFlipped) {
      _flipController.forward();
    } else {
      _flipController.reverse();
    }
  }

  void _useHint(HintType hint) {
    if (_usedHints.contains(hint)) return;

    setState(() {
      _usedHints.add(hint);
    });

    switch (hint) {
      case HintType.image:
        setState(() {
          _hintImageVisible = true;
        });
        break;
      case HintType.audio:
        final audioPath = _cards[_currentIndex].frontAudioPath;
        if (audioPath != null && audioPath.isNotEmpty) {
          AudioHelper.playAudio(audioPath);
        }
        break;
      case HintType.video:
        final videoUrl = _cards[_currentIndex].frontVideoUrl;
        if (videoUrl != null && videoUrl.isNotEmpty) {
          VideoHelper.openVideo(context, videoUrl);
        }
        break;
      case HintType.firstLetter:
        setState(() {
          _hintFirstLetterVisible = true;
        });
        break;
    }
  }

  void _resetHints() {
    _usedHints.clear();
    _hintImageVisible = false;
    _hintFirstLetterVisible = false;
  }

  Future<void> _answerCard(int quality) async {
    if (_currentIndex >= _cards.length) return;

    final card = _cards[_currentIndex];

    if (quality == 5) {
      _correctAnswers++;
    } else {
      if (!_incorrectCards.contains(card)) {
        _incorrectCards.add(card);
      }
    }

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
      frontVideoUrl: drift.Value(card.frontVideoUrl),
      backVideoUrl: drift.Value(card.backVideoUrl),
      pronunciation: drift.Value(card.pronunciation),
      transcription: drift.Value(card.transcription),
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
      await widget.db.addReviewHistory(ReviewHistoryCompanion(
        cardId: drift.Value(card.id),
        quality: drift.Value(quality),
        timeSpentSeconds: const drift.Value(0),
      ));
      _nextCard();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  Future<void> _markAsMastered() async {
    if (_currentIndex >= _cards.length) return;

    final card = _cards[_currentIndex];
    _correctAnswers++;

    final updatedCard = CardsCompanion(
      id: drift.Value(card.id),
      deckId: drift.Value(card.deckId),
      frontText: drift.Value(card.frontText),
      backText: drift.Value(card.backText),
      frontImagePath: drift.Value(card.frontImagePath),
      backImagePath: drift.Value(card.backImagePath),
      frontAudioPath: drift.Value(card.frontAudioPath),
      backAudioPath: drift.Value(card.backAudioPath),
      frontVideoUrl: drift.Value(card.frontVideoUrl),
      backVideoUrl: drift.Value(card.backVideoUrl),
      pronunciation: drift.Value(card.pronunciation),
      transcription: drift.Value(card.transcription),
      example: drift.Value(card.example),
      notes: drift.Value(card.notes),
      easinessFactor: drift.Value(card.easinessFactor),
      repetitions: const drift.Value(999),
      interval: const drift.Value(30),
      nextReviewDate: drift.Value(DateTime.now().add(const Duration(days: 30))),
      lastReviewedAt: drift.Value(DateTime.now()),
      correctCount: drift.Value(card.correctCount + 1),
      incorrectCount: drift.Value(card.incorrectCount),
      isMastered: const drift.Value(true),
      createdAt: drift.Value(card.createdAt),
      updatedAt: drift.Value(DateTime.now()),
    );

    try {
      await widget.db.into(widget.db.cards).insertOnConflictUpdate(updatedCard);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('✅ Card mastered!'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );
      }
      _nextCard();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
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
    AudioHelper.stopAudio();
    _resetHints();

    if (_currentIndex < _cards.length - 1) {
      setState(() {
        _currentIndex++;
        _isFlipped = false;
      });
      _flipController.reset();
    } else {
      _finishSession();
    }
  }

  Future<void> _finishSession() async {
    // Убрали updateDailyStats - таблицы нет в БД

    if (mounted) {
      if (_correctAnswers == _cards.length && _cards.isNotEmpty) {
        _confettiController.play();
      }
      _showCompletionDialog();
    }
  }

  void _showCompletionDialog() {
    final accuracy = _cards.isEmpty ? 0.0 : _correctAnswers / _cards.length;
    final isPerfect = accuracy == 1.0 && _cards.isNotEmpty;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Stack(
        children: [
          if (isPerfect) ...[
            Align(
              alignment: Alignment.topCenter,
              child: ConfettiWidget(
                confettiController: _confettiController,
                blastDirectionality: BlastDirectionality.explosive,
                particleDrag: 0.05,
                emissionFrequency: 0.05,
                numberOfParticles: 50,
                gravity: 0.2,
                shouldLoop: false,
                colors: const [
                  Colors.green,
                  Colors.blue,
                  Colors.pink,
                  Colors.orange,
                  Colors.purple,
                  Colors.yellow,
                ],
              ),
            ),
          ],
          AlertDialog(
            title: isPerfect
                ? const Column(
                    children: [
                      Text('🎊', style: TextStyle(fontSize: 48)),
                      SizedBox(height: 8),
                      Text('CONGRATULATIONS!',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('✨ All cards mastered! ✨',
                          style: TextStyle(fontSize: 16)),
                    ],
                  )
                : const Row(
                    children: [
                      Icon(Icons.celebration, color: Colors.amber, size: 32),
                      SizedBox(width: 8),
                      Text('Session Complete!'),
                    ],
                  ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isPerfect ? Colors.green[50] : Colors.blue[50],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Text(
                        isPerfect ? 'Perfect score!' : 'Statistics:',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color:
                              isPerfect ? Colors.green[700] : Colors.blue[700],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildStatItem('📚', '${_cards.length}', 'Cards'),
                          _buildStatItem('✅', '$_correctAnswers', 'Perfect'),
                          _buildStatItem(
                              '🎯',
                              '${(accuracy * 100).toStringAsFixed(0)}%',
                              'Accuracy'),
                        ],
                      ),
                      if (!isPerfect && _incorrectCards.isNotEmpty) ...[
                        const SizedBox(height: 12),
                        Text(
                          'To review: ${_incorrectCards.length}',
                          style: TextStyle(
                            color: Colors.orange[700],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
            actions: [
              if (_incorrectCards.isNotEmpty) ...[
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                      setState(() {
                        _cards = List.from(_incorrectCards);
                        _incorrectCards.clear();
                        _currentIndex = 0;
                        _isFlipped = false;
                        _correctAnswers = 0;
                      });
                      _resetHints();
                      _flipController.reset();
                    },
                    icon: const Icon(Icons.replay),
                    label: Text(
                        '🔄 Review incorrect cards (${_incorrectCards.length})'),
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
              ],
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {
                      _incorrectCards.clear();
                      _currentIndex = 0;
                      _isFlipped = false;
                      _correctAnswers = 0;
                    });
                    _resetHints();
                    _flipController.reset();
                  },
                  icon: const Icon(Icons.refresh),
                  label: const Text('📚 Start over'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: TextButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('🏠 Back to decks'),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String emoji, String value, String label) {
    return Column(
      children: [
        Text(emoji, style: const TextStyle(fontSize: 20)),
        Text(value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text(label, style: TextStyle(fontSize: 11, color: Colors.grey[600])),
      ],
    );
  }

  @override
  void dispose() {
    AudioHelper.stopAudio();
    _flipController.dispose();
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.deckName),
        actions: [
          if (!_isLoading && _cards.isNotEmpty) ...[
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text(
                  '${_currentIndex + 1}/${_cards.length}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
          ],
        ],
      ),
      body: AdaptiveLayout(
        maxWidth: AppLayout.narrowMaxWidth,
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : _cards.isEmpty
                ? _buildEmptyState()
                : _buildStudyInterface(),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.check_circle_outline, size: 80, color: Colors.green[400]),
          const SizedBox(height: 16),
          const Text('No cards to study',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('All cards are learned!\nCome back later.',
              textAlign: TextAlign.center),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
            label: const Text('Back'),
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
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Expanded(child: _buildFlipCard(card)),
                const SizedBox(height: 16),
                if (!_isFlipped) ...[
                  _buildHintsPanel(card),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.touch_app, color: Colors.grey[400], size: 18),
                      const SizedBox(width: 6),
                      Text('Tap to reveal answer',
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 13)),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
                if (_isFlipped) ...[
                  _buildAnswerButtons(),
                  const SizedBox(height: 8),
                  OutlinedButton.icon(
                    onPressed: _markAsMastered,
                    icon: const Icon(Icons.check_circle, color: Colors.green),
                    label: const Text('Mastered! Don\'t show again'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.green,
                      side: const BorderSide(color: Colors.green),
                      minimumSize: const Size(double.infinity, 40),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHintsPanel(CardData card) {
    final hasImage =
        card.frontImagePath != null && card.frontImagePath!.isNotEmpty;
    final hasAudio =
        card.frontAudioPath != null && card.frontAudioPath!.isNotEmpty;
    final hasVideo =
        card.frontVideoUrl != null && card.frontVideoUrl!.isNotEmpty;
    final hasBack = card.backText.isNotEmpty;

    if (!hasImage && !hasAudio && !hasVideo && !hasBack) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lightbulb_outline, size: 16, color: Colors.amber[700]),
              const SizedBox(width: 4),
              Text(
                _usedHints.isEmpty
                    ? 'Hints'
                    : 'Hints (used: ${_usedHints.length})',
                style: TextStyle(
                  fontSize: 12,
                  color: _usedHints.isNotEmpty
                      ? Colors.orange[700]
                      : Colors.grey[600],
                  fontWeight: _usedHints.isNotEmpty
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: [
              if (hasImage) ...[
                _buildHintChip(
                    hint: HintType.image,
                    icon: Icons.image,
                    label: 'Picture',
                    color: Colors.blue),
              ],
              if (hasAudio) ...[
                _buildHintChip(
                    hint: HintType.audio,
                    icon: Icons.volume_up,
                    label: 'Audio',
                    color: Colors.green),
              ],
              if (hasVideo) ...[
                _buildHintChip(
                    hint: HintType.video,
                    icon: Icons.play_circle,
                    label: 'Video',
                    color: Colors.red),
              ],
              if (hasBack) ...[
                _buildHintChip(
                    hint: HintType.firstLetter,
                    icon: Icons.abc,
                    label: 'First letter',
                    color: Colors.purple),
              ],
            ],
          ),
          if (_hintFirstLetterVisible && card.backText.isNotEmpty) ...[
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.purple[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.purple[200]!),
              ),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: card.backText[0].toUpperCase(),
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple[700]),
                    ),
                    TextSpan(
                      text: '_ ' * (card.backText.length - 1).clamp(1, 12),
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.purple[300],
                          letterSpacing: 2),
                    ),
                  ],
                ),
              ),
            ),
          ],
          if (_hintImageVisible &&
              card.frontImagePath != null &&
              card.frontImagePath!.isNotEmpty) ...[
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.file(
                File(card.frontImagePath!),
                height: 120,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const SizedBox.shrink(),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildHintChip({
    required HintType hint,
    required IconData icon,
    required String label,
    required Color color,
  }) {
    final isUsed = _usedHints.contains(hint);

    return GestureDetector(
      onTap: isUsed ? null : () => _useHint(hint),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isUsed ? Colors.grey[200] : color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isUsed ? Colors.grey[400]! : color.withValues(alpha: 0.5),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(isUsed ? Icons.check : icon,
                size: 16, color: isUsed ? Colors.grey[500] : color),
            const SizedBox(width: 4),
            Text(
              isUsed ? '$label ✓' : label,
              style: TextStyle(
                fontSize: 13,
                color: isUsed ? Colors.grey[500] : color,
                fontWeight: FontWeight.w500,
                decoration: isUsed ? TextDecoration.lineThrough : null,
              ),
            ),
          ],
        ),
      ),
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
    final audioPath = isFront ? card.frontAudioPath : card.backAudioPath;
    final videoUrl = isFront ? card.frontVideoUrl : card.backVideoUrl;
    final hasImage = imagePath != null && imagePath.isNotEmpty;
    final hasAudio = audioPath != null && audioPath.isNotEmpty;
    final hasVideo = videoUrl != null && videoUrl.isNotEmpty;
    final showImage = hasImage && (!isFront || _hintImageVisible);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: isFront
            ? Theme.of(context).colorScheme.primaryContainer
            : Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
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
                if (showImage) ...[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.file(
                      File(imagePath),
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        height: 180,
                        color: Colors.grey[300],
                        child: const Center(
                            child: Icon(Icons.broken_image, size: 48)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
                Text(
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                if (!isFront &&
                    card.pronunciation != null &&
                    card.pronunciation!.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  Text(
                    card.pronunciation!,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.blue,
                          fontStyle: FontStyle.italic,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
                if (!isFront &&
                    card.transcription != null &&
                    card.transcription!.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Text(
                    card.transcription!,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.purple,
                          fontFamily: 'monospace',
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
                if (hasAudio && !isFront) ...[
                  const SizedBox(height: 16),
                  _AudioPlayButton(audioPath: audioPath),
                ],
                if (hasVideo && !isFront) ...[
                  const SizedBox(height: 12),
                  _VideoButton(videoUrl: videoUrl),
                ],
                if (!isFront &&
                    card.example != null &&
                    card.example!.isNotEmpty) ...[
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      card.example!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontStyle: FontStyle.italic),
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
            label: 'Forgot', icon: Icons.close, color: Colors.red, quality: 0),
        _buildAnswerButton(
            label: 'Hard',
            icon: Icons.sentiment_dissatisfied,
            color: Colors.orange,
            quality: 3),
        _buildAnswerButton(
            label: 'Good',
            icon: Icons.sentiment_satisfied,
            color: Colors.blue,
            quality: 4),
        _buildAnswerButton(
            label: 'Easy',
            icon: Icons.sentiment_very_satisfied,
            color: Colors.green,
            quality: 5),
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
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      ),
    );
  }
}

class _AudioPlayButton extends StatefulWidget {
  final String audioPath;
  const _AudioPlayButton({required this.audioPath});

  @override
  State<_AudioPlayButton> createState() => _AudioPlayButtonState();
}

class _AudioPlayButtonState extends State<_AudioPlayButton> {
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    AudioHelper.playerStateStream.listen((state) {
      if (mounted) {
        setState(() {
          _isPlaying = state == PlayerState.playing;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () async {
        if (_isPlaying) {
          await AudioHelper.stopAudio();
        } else {
          await AudioHelper.playAudio(widget.audioPath);
        }
      },
      icon: Icon(_isPlaying ? Icons.stop_circle : Icons.volume_up, size: 22),
      label: Text(_isPlaying ? 'Stop' : 'Listen'),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: const BorderSide(color: Colors.white54),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
    );
  }
}

class _VideoButton extends StatelessWidget {
  final String videoUrl;
  const _VideoButton({required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    final isYouTube = VideoHelper.isYouTubeUrl(videoUrl);
    final isYouGlish = VideoHelper.isYouGlishUrl(videoUrl);

    return OutlinedButton.icon(
      onPressed: () => VideoHelper.openVideo(context, videoUrl),
      icon: Icon(
        isYouTube
            ? Icons.smart_display
            : (isYouGlish ? Icons.record_voice_over : Icons.play_circle),
        size: 22,
        color: isYouTube ? Colors.red : Colors.white,
      ),
      label: Text(isYouTube ? 'YouTube' : (isYouGlish ? 'YouGlish' : 'Watch')),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: BorderSide(color: isYouTube ? Colors.red : Colors.white54),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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

enum HintType { image, audio, video, firstLetter }


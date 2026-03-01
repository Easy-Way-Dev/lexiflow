import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lexiflow/core/database/app_database.dart';
import 'package:drift/drift.dart' as drift;
import 'package:lexiflow/shared/widgets/adaptive_layout.dart';

class OnboardingScreen extends StatefulWidget {
  final AppDatabase db;

  const OnboardingScreen({super.key, required this.db});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  final FocusNode _focusNode = FocusNode();
  int _currentPage = 0;
  String? _selectedGoal;

  List<Map<String, String>> _swipeWords = [];
  int _swipedCardsCount = 0;
  bool _isCreatingDeck = false;

  // Флаги для внешнего триггера свайпа (клавиатура / кнопки)
  // Используем ValueNotifier чтобы не конфликтовать с GlobalKey
  final ValueNotifier<int> _swipeTrigger = ValueNotifier(0);
  // 0 = нет, 1 = влево, 2 = вправо
  int _pendingSwipeDirection = 0;

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_swipeWords.isEmpty) {
      final l = AppLocalizations.of(context);
      _swipeWords = _getSwipeWords(l);
    }
  }

  List<Map<String, String>> _getSwipeWords(AppLocalizations l) {
    return [
      {'word': l.swipeWord1, 'translation': l.swipeTrans1},
      {'word': l.swipeWord2, 'translation': l.swipeTrans2},
      {'word': l.swipeWord3, 'translation': l.swipeTrans3},
      {'word': l.swipeWord4, 'translation': l.swipeTrans4},
      {'word': l.swipeWord5, 'translation': l.swipeTrans5},
      {'word': l.swipeWord6, 'translation': l.swipeTrans6},
      {'word': l.swipeWord7, 'translation': l.swipeTrans7},
      {'word': l.swipeWord8, 'translation': l.swipeTrans8},
      {'word': l.swipeWord9, 'translation': l.swipeTrans9},
      {'word': l.swipeWord10, 'translation': l.swipeTrans10},
    ];
  }

  @override
  void dispose() {
    _pageController.dispose();
    _focusNode.dispose();
    _swipeTrigger.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentPage++;
      });
      if (_currentPage == 1) {
        _focusNode.requestFocus();
      }
    }
  }

  // Вызвать свайп влево у текущей верхней карточки
  void _triggerSwipeLeft() {
    if (_swipedCardsCount >= _swipeWords.length) return;
    _pendingSwipeDirection = 1; // влево
    _swipeTrigger.value++;
  }

  // Вызвать свайп вправо у текущей верхней карточки
  void _triggerSwipeRight() {
    if (_swipedCardsCount >= _swipeWords.length) return;
    _pendingSwipeDirection = 2; // вправо
    _swipeTrigger.value++;
  }

  Future<void> _finishOnboarding(AppLocalizations l) async {
    setState(() {
      _isCreatingDeck = true;
    });

    try {
      final currentAppLocale = Localizations.localeOf(context).languageCode;
      String defaultTarget = ['ru', 'uk', 'en'].contains(currentAppLocale)
          ? currentAppLocale
          : 'ru';

      final String deckGoal = _selectedGoal ?? "Basic";
      final deckId = await widget.db.into(widget.db.decks).insert(
            DecksCompanion.insert(
              name: l.finishDeckName(deckGoal),
              description: drift.Value(l.finishDeckDesc),
              sourceLanguage: 'en',
              targetLanguage: defaultTarget,
            ),
          );

      for (int i = 0; i < _swipeWords.length; i++) {
        await widget.db.into(widget.db.cards).insert(
              CardsCompanion.insert(
                deckId: deckId,
                frontText: _swipeWords[i]['word']!,
                backText: _swipeWords[i]['translation']!,
                nextReviewDate: drift.Value(DateTime.now()),
                createdAt: drift.Value(DateTime.now()),
              ),
            );
      }

      await widget.db.setSetting('onboarding_completed', 'true');

      if (mounted) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (e) {
      debugPrint('Error creating initial set: $e');
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);

    return Focus(
      focusNode: _focusNode,
      autofocus: true,
      onKeyEvent: (node, event) {
        if (_currentPage != 1) return KeyEventResult.ignored;
        if (event is KeyDownEvent) {
          if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
            _triggerSwipeLeft();
            return KeyEventResult.handled;
          } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
            _triggerSwipeRight();
            return KeyEventResult.handled;
          }
        }
        return KeyEventResult.ignored;
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SafeArea(
          child: AdaptiveLayout(
            maxWidth: AppLayout.contentMaxWidth,
            child: Stack(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 48, vertical: 16),
                      child: Row(
                        children: List.generate(
                          3,
                          (index) => Expanded(
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              height: 8,
                              decoration: BoxDecoration(
                                color: index <= _currentPage
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context)
                                        .colorScheme
                                        .surfaceContainerHighest,
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: PageView(
                        controller: _pageController,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          _buildGoalSelection(l),
                          _buildSwipeTest(l),
                          _buildFinishScreen(l),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.grey, size: 28),
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGoalSelection(AppLocalizations l) {
    final goals = [
      {
        'id': 'work',
        'icon': Icons.work_outline,
        'title': l.goalWorkTitle,
        'desc': l.goalWorkDesc
      },
      {
        'id': 'travel',
        'icon': Icons.flight_takeoff,
        'title': l.goalTravelTitle,
        'desc': l.goalTravelDesc
      },
      {
        'id': 'movies',
        'icon': Icons.movie_filter_outlined,
        'title': l.goalMoviesTitle,
        'desc': l.goalMoviesDesc
      },
      {
        'id': 'abroad',
        'icon': Icons.public,
        'title': l.goalAbroadTitle,
        'desc': l.goalAbroadDesc
      },
      {
        'id': 'million',
        'icon': Icons.attach_money,
        'title': l.goalMillionTitle,
        'desc': l.goalMillionDesc
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l.goalQuestion,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            l.goalSubtitle,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey[600],
                ),
          ),
          const SizedBox(height: 32),
          Expanded(
            child: ListView.separated(
              itemCount: goals.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final goal = goals[index];
                final isSelected = _selectedGoal == goal['title'];

                return Card(
                  elevation: isSelected ? 4 : 0,
                  color: isSelected
                      ? Theme.of(context).colorScheme.primaryContainer
                      : Theme.of(context)
                          .colorScheme
                          .surfaceContainerHighest
                          .withValues(alpha: 0.3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(
                      color: isSelected
                          ? Theme.of(context).colorScheme.primary
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      HapticFeedback.selectionClick();
                      setState(() => _selectedGoal = goal['title'] as String);
                    },
                    borderRadius: BorderRadius.circular(16),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 16),
                      child: Row(
                        children: [
                          Icon(
                            goal['icon'] as IconData,
                            size: 32,
                            color: isSelected
                                ? Theme.of(context).colorScheme.primary
                                : Colors.grey[600],
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  goal['title'] as String,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: isSelected
                                            ? Theme.of(context)
                                                .colorScheme
                                                .primary
                                            : null,
                                      ),
                                ),
                                Text(
                                  goal['desc'] as String,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: Colors.grey[600],
                                      ),
                                ),
                              ],
                            ),
                          ),
                          if (isSelected)
                            Icon(
                              Icons.check_circle,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: _selectedGoal == null ? null : _nextPage,
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                l.goalContinue,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSwipeTest(AppLocalizations l) {
    final remaining = _swipeWords.length - _swipedCardsCount;

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Text(
            l.swipeTestTitle,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            l.swipeTestSubtitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey[600],
                ),
          ),
          const SizedBox(height: 32),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Подложка — видна когда карточки закончились
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.45,
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .surfaceContainerHighest
                        .withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(24),
                    border:
                        Border.all(color: Colors.grey.withValues(alpha: 0.2)),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    l.swipeTopCardGood,
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // Фоновые карточки (стопка) — только визуал, не интерактивны
                for (int stackPos = min(2, remaining - 1);
                    stackPos > 0;
                    stackPos--)
                  _buildBackgroundCard(stackPos),

                // Верхняя карточка — интерактивна
                // ValueKey гарантирует что при смене слова создаётся НОВЫЙ виджет
                if (remaining > 0)
                  _SwipeableCard(
                    key: ValueKey(
                        _swipedCardsCount), // новый State при каждой карточке
                    word: _swipeWords[_swipedCardsCount]['word']!,
                    translation: _swipeWords[_swipedCardsCount]['translation']!,
                    swipeTrigger: _swipeTrigger,
                    getSwipeDirection: () => _pendingSwipeDirection,
                    onSwipe: (knowIt) {
                      setState(() {
                        _swipedCardsCount++;
                        if (_swipedCardsCount >= _swipeWords.length) {
                          Future.delayed(const Duration(milliseconds: 400), () {
                            if (mounted) _nextPage();
                          });
                        }
                      });
                    },
                  ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSwipeButton(
                icon: Icons.close,
                color: Colors.redAccent,
                label: l.swipeIDontKnow,
                onTap: _triggerSwipeLeft,
              ),
              _buildSwipeButton(
                icon: Icons.favorite,
                color: Colors.green,
                label: l.swipeIKnow,
                onTap: _triggerSwipeRight,
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  // Простая статичная карточка-фон для эффекта стопки
  Widget _buildBackgroundCard(int stackPosition) {
    return Transform.translate(
      offset: Offset(0, stackPosition * 8.0),
      child: Transform.scale(
        scale: 1.0 - stackPosition * 0.03,
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.45,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSwipeButton({
    required IconData icon,
    required Color color,
    required String label,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(20),
            backgroundColor: Theme.of(context).colorScheme.surface,
            foregroundColor: color,
            elevation: 4,
            shadowColor: color.withValues(alpha: 0.4),
          ),
          child: Icon(icon, size: 36),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildFinishScreen(AppLocalizations l) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 800),
            curve: Curves.elasticOut,
            builder: (context, value, child) {
              return Transform.scale(scale: value, child: child);
            },
            child: Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.rocket_launch,
                size: 80,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(height: 40),
          Text(
            l.finishTitle,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            l.finishSubtitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.grey[600],
                  height: 1.5,
                ),
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: _isCreatingDeck ? null : () => _finishOnboarding(l),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: _isCreatingDeck
                  ? const SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(
                          strokeWidth: 2, color: Colors.white),
                    )
                  : Text(
                      l.finishButton,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// _SwipeableCard — карточка с анимацией свайпа
// Использует ValueKey(index) — при смене карточки создаётся
// полностью новый State. Нет GlobalKey, нет конфликтов.
// ═══════════════════════════════════════════════════════════
class _SwipeableCard extends StatefulWidget {
  final String word;
  final String translation;
  final ValueNotifier<int> swipeTrigger;
  final int Function() getSwipeDirection; // 1=влево, 2=вправо
  final Function(bool knowIt) onSwipe;

  const _SwipeableCard({
    super.key,
    required this.word,
    required this.translation,
    required this.swipeTrigger,
    required this.getSwipeDirection,
    required this.onSwipe,
  });

  @override
  State<_SwipeableCard> createState() => _SwipeableCardState();
}

class _SwipeableCardState extends State<_SwipeableCard>
    with SingleTickerProviderStateMixin {
  Offset _position = Offset.zero;
  double _angle = 0;

  late AnimationController _animationController;
  late Animation<Offset> _animation;

  bool _swiped = false; // предотвращаем двойной вызов onSwipe

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    _animationController.addListener(() {
      if (mounted) {
        setState(() {
          _position = _animation.value;
        });
      }
    });
    // Подписываемся на внешние триггеры свайпа
    widget.swipeTrigger.addListener(_onTrigger);
  }

  @override
  void dispose() {
    widget.swipeTrigger.removeListener(_onTrigger);
    _animationController.dispose();
    super.dispose();
  }

  void _onTrigger() {
    if (_swiped) return;
    final dir = widget.getSwipeDirection();
    if (dir == 1) {
      _doSwipeLeft();
    } else if (dir == 2) {
      _doSwipeRight();
    }
  }

  void _doSwipeRight() {
    if (_swiped) return;
    final screenW = MediaQuery.of(context).size.width;
    _animateSwipe(Offset(screenW + 300, 0), true);
  }

  void _doSwipeLeft() {
    if (_swiped) return;
    final screenW = MediaQuery.of(context).size.width;
    _animateSwipe(Offset(-(screenW + 300), 0), false);
  }

  void _onPanStart(DragStartDetails details) {
    if (_swiped) return;
    if (_animationController.isAnimating) {
      _animationController.stop();
    }
  }

  void _onPanUpdate(DragUpdateDetails details) {
    if (_swiped) return;
    final screenW = MediaQuery.of(context).size.width;
    setState(() {
      _position += details.delta;
      _angle = 15 * (_position.dx / screenW) * (pi / 180);
    });
  }

  void _onPanEnd(DragEndDetails details) {
    if (_swiped) return;
    final screenW = MediaQuery.of(context).size.width;

    if (_position.dx > 100) {
      _animateSwipe(Offset(screenW + 300, _position.dy), true);
    } else if (_position.dx < -100) {
      _animateSwipe(Offset(-(screenW + 300), _position.dy), false);
    } else {
      // Возврат на место
      _animation = Tween<Offset>(begin: _position, end: Offset.zero)
          .animate(CurvedAnimation(
        parent: _animationController,
        curve: Curves.elasticOut,
      ));
      _animationController.forward(from: 0);
      setState(() => _angle = 0);
    }
  }

  void _animateSwipe(Offset targetPosition, bool knowIt) {
    if (_swiped) return;
    _swiped = true;

    _animation = Tween<Offset>(begin: _position, end: targetPosition).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );
    _animationController.forward(from: 0).then((_) {
      if (mounted) {
        widget.onSwipe(knowIt);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isSwipingRight = _position.dx > 0;
    final opacity = (_position.dx.abs() / 80).clamp(0.0, 1.0);

    return GestureDetector(
      onPanStart: _swiped ? null : _onPanStart,
      onPanUpdate: _swiped ? null : _onPanUpdate,
      onPanEnd: _swiped ? null : _onPanEnd,
      child: Transform.translate(
        offset: _position,
        child: Transform.rotate(
          angle: _angle,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.45,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 10,
                          spreadRadius: 2,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.word,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Text(
                            widget.translation,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  color: Colors.grey[600],
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Индикатор знаю/не знаю при свайпе
                  if (_position.dx.abs() > 20)
                    Positioned(
                      top: 40,
                      left: isSwipingRight ? 40 : null,
                      right: isSwipingRight ? null : 40,
                      child: Transform.rotate(
                        angle: isSwipingRight ? -0.2 : 0.2,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: (isSwipingRight
                                      ? Colors.green
                                      : Colors.redAccent)
                                  .withValues(alpha: opacity),
                              width: 4,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            isSwipingRight
                                ? AppLocalizations.of(context)
                                    .swipeIKnow
                                    .toUpperCase()
                                : AppLocalizations.of(context)
                                    .swipeIDontKnow
                                    .toUpperCase(),
                            style: TextStyle(
                              color: (isSwipingRight
                                      ? Colors.green
                                      : Colors.redAccent)
                                  .withValues(alpha: opacity),
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

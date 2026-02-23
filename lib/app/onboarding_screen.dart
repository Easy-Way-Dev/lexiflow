import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lexiflow/core/database/app_database.dart';
import 'package:drift/drift.dart' as drift;

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

  // Уникальные ключи для каждой карточки, чтобы управлять их анимацией снаружи
  final Map<String, GlobalKey<_SwipeableCardState>> _cardKeys = {};

  // Временная тестовая база из 10 слов для отладки логики
  final List<Map<String, String>> _swipeWords = [
    {'word': 'Resilient', 'translation': 'Устойчивый, жизнерадостный'},
    {'word': 'Pragmatic', 'translation': 'Прагматичный, практичный'},
    {'word': 'Ubiquitous', 'translation': 'Вездесущий, повсеместный'},
    {'word': 'Eloquent', 'translation': 'Красноречивый'},
    {'word': 'Paradigm', 'translation': 'Парадигма, система взглядов'},
    {'word': 'Tenacious', 'translation': 'Цепкий, упорный'},
    {'word': 'Serendipity', 'translation': 'Счастливая случайность'},
    {'word': 'Inevitable', 'translation': 'Неизбежный'},
    {'word': 'Catalyst', 'translation': 'Катализатор, стимул'},
    {'word': 'Ephemeral', 'translation': 'Эфемерный, недолговечный'},
  ];

  final List<Map<String, dynamic>> _swipeResults = [];

  @override
  void initState() {
    super.initState();
    for (var word in _swipeWords) {
      _cardKeys[word['word']!] = GlobalKey<_SwipeableCardState>();
    }
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _completeOnboardingAndCreateDeck() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      final goalName = _selectedGoal ?? 'Общая лексика';
      final deckId = await widget.db.createDeck(
        DecksCompanion.insert(
          name: 'Мой старт: $goalName',
          description: drift.Value(
              'Персональная колода, созданная AI на основе вашего теста.'),
          sourceLanguage: 'en-US',
          targetLanguage: 'ru',
        ),
      );

      for (final result in _swipeResults) {
        final isKnown = result['known'] as bool;

        await widget.db.createCard(
          CardsCompanion.insert(
            deckId: deckId,
            frontText: result['word'] as String,
            backText: result['translation'] as String,
            isMastered: drift.Value(isKnown),
            repetitions: drift.Value(isKnown ? 1 : 0),
            easinessFactor: const drift.Value(250),
            interval: drift.Value(isKnown ? 30 : 0),
            nextReviewDate: drift.Value(
              isKnown
                  ? DateTime.now().add(const Duration(days: 30))
                  : DateTime.now(),
            ),
          ),
        );
      }

      await widget.db.setSetting('onboarding_complete', 'true');

      if (mounted) {
        Navigator.of(context).pop();
        Navigator.of(context).pushReplacementNamed('/home');
      }
    } catch (e) {
      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ошибка создания колоды: $e')),
        );
      }
    }
  }

  void _nextPage() {
    HapticFeedback.lightImpact();
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOutCubic,
      );
    } else {
      _completeOnboardingAndCreateDeck();
    }
  }

  void _onSwipeComplete(bool known, Map<String, String> wordData) {
    setState(() {
      _swipeResults.add({
        'word': wordData['word'],
        'translation': wordData['translation'],
        'known': known,
      });
    });

    if (_swipeResults.length == _swipeWords.length) {
      _nextPage();
    }
  }

  void _triggerSwipe(bool isKnown) {
    if (_currentPage != 1) return;
    final currentIndex = _swipeResults.length;
    if (currentIndex < _swipeWords.length) {
      final wordData = _swipeWords[currentIndex];
      final key = _cardKeys[wordData['word']];
      key?.currentState?.animateOut(isRight: isKnown);
    }
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: _focusNode,
      onKeyEvent: (KeyEvent event) {
        if (event is KeyDownEvent) {
          if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
            _triggerSwipe(false);
          } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
            _triggerSwipe(true);
          }
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: 4,
                        alignment: Alignment.centerLeft,
                        child: FractionallySizedBox(
                          widthFactor: (_currentPage + 1) / 3,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(4),
                                bottomRight: Radius.circular(4),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.grey),
                      tooltip: 'Закрыть',
                      onPressed: () {
                        HapticFeedback.selectionClick();
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (index) {
                    setState(() => _currentPage = index);
                  },
                  children: [
                    _buildGoalSelectionPage(),
                    _buildSwipeTestPage(),
                    _buildFinishPage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ==========================================
  // ШАГ 1: ВЫБОР ЦЕЛИ
  // ==========================================
  Widget _buildGoalSelectionPage() {
    final goals = [
      {
        'icon': '💼',
        'title': 'Работа и карьера',
        'desc': 'IT, бизнес, собеседования'
      },
      {
        'icon': '✈️',
        'title': 'Путешествия',
        'desc': 'Аэропорт, отели, выживание'
      },
      {
        'icon': '🎬',
        'title': 'Кино и сериалы',
        'desc': 'Понимать Netflix в оригинале'
      },
      {
        'icon': '🌍',
        'title': 'Выжить за границей',
        'desc': 'Бытовые ситуации и сленг'
      },
      {
        'icon': '💰',
        'title': 'Заработать \$1,000,000',
        'desc': 'Секретный уровень для амбициозных'
      },
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Какая у вас цель?',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.5,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'LexiFlow настроит алгоритм и подберет слова специально для вас.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey[600],
                ),
          ),
          const SizedBox(height: 32),
          Expanded(
            child: ListView.builder(
              itemCount: goals.length,
              itemBuilder: (context, index) {
                final goal = goals[index];
                final isSelected = _selectedGoal == goal['title'];

                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Theme.of(context).colorScheme.primaryContainer
                          : Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isSelected
                            ? Theme.of(context).colorScheme.primary
                            : Colors.grey.withValues(alpha: 0.2),
                        width: isSelected ? 2 : 1,
                      ),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withValues(alpha: 0.2),
                                blurRadius: 15,
                                offset: const Offset(0, 5),
                              )
                            ]
                          : [],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          HapticFeedback.selectionClick();
                          setState(() => _selectedGoal = goal['title']);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              Text(goal['icon']!,
                                  style: const TextStyle(fontSize: 32)),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      goal['title']!,
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
                                    const SizedBox(height: 4),
                                    Text(
                                      goal['desc']!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: Colors.grey[600],
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              if (isSelected)
                                Icon(Icons.check_circle,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: FilledButton(
              onPressed: _selectedGoal != null ? _nextPage : null,
              style: FilledButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
              ),
              child: const Text('Продолжить',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================
  // ШАГ 2: TINDER-СВАЙП ТЕСТ
  // ==========================================
  Widget _buildSwipeTestPage() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
          child: Column(
            children: [
              Text(
                'Проверка уровня',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      letterSpacing: -0.5,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Смахните вправо, если знаете слово.\nСмахните влево, если не знаете.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.grey[600],
                    ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Center(
            child: SizedBox(
              height: 400,
              width: MediaQuery.of(context).size.width * 0.85,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (_swipeResults.length >= _swipeWords.length)
                    const Text('Отлично! Идем дальше...',
                        style: TextStyle(fontSize: 20, color: Colors.grey)),

                  // ВАЖНО: reversed ставит текущую карточку наверх Stack
                  ..._swipeWords.asMap().entries.toList().reversed.map((entry) {
                    final index = entry.key;
                    final wordData = entry.value;

                    if (index < _swipeResults.length)
                      return const SizedBox.shrink();

                    final isTopCard = index == _swipeResults.length;

                    return isTopCard
                        ? SwipeableCard(
                            key: _cardKeys[wordData['word']],
                            wordData: wordData,
                            onSwipeLeft: () =>
                                _onSwipeComplete(false, wordData),
                            onSwipeRight: () =>
                                _onSwipeComplete(true, wordData),
                          )
                        : Transform.scale(
                            scale: 0.95 - (index - _swipeResults.length) * 0.05,
                            child: Transform.translate(
                              offset: Offset(
                                  0, (index - _swipeResults.length) * 15.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(32),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          Colors.black.withValues(alpha: 0.05),
                                      blurRadius: 10,
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                  }),
                ],
              ),
            ),
          ),
        ),
        // Индикаторы управления внизу
        Padding(
          padding: const EdgeInsets.only(bottom: 48.0, left: 32, right: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSwipeButton(
                  Icons.close, Colors.redAccent, 'Не знаю', false),
              const SizedBox(width: 32),
              _buildSwipeButton(
                  Icons.favorite, Colors.greenAccent[700]!, 'Знаю', true),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSwipeButton(
      IconData icon, Color color, String label, bool isKnown) {
    return GestureDetector(
      onTap: () => _triggerSwipe(isKnown),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  color: color.withValues(alpha: 0.2),
                  blurRadius: 15,
                  spreadRadius: 2,
                )
              ],
              border: Border.all(color: color.withValues(alpha: 0.3), width: 2),
            ),
            child: Icon(icon, color: color, size: 32),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(color: color, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // ==========================================
  // ШАГ 3: ФИНИШ И ГЕНЕРАЦИЯ БАЗЫ
  // ==========================================
  Widget _buildFinishPage() {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 1),
            duration: const Duration(milliseconds: 800),
            curve: Curves.elasticOut,
            builder: (context, double value, child) {
              return Transform.scale(
                scale: value,
                child: Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context)
                            .colorScheme
                            .primary
                            .withValues(alpha: 0.3),
                        blurRadius: 30,
                        spreadRadius: 5,
                      )
                    ],
                  ),
                  child: Icon(
                    Icons.rocket_launch,
                    size: 70,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 48),
          Text(
            'Все готово!',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'Мы проанализировали ваши ответы и подготовили вашу первую персональную колоду.\n\nПора начинать!',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey[600],
                  height: 1.5,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: FilledButton(
              onPressed: _completeOnboardingAndCreateDeck,
              style: FilledButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
              ),
              child: const Text('Погнали!',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// КАСТОМНЫЙ ВИДЖЕТ: Tinder-Карточка
// ==========================================
class SwipeableCard extends StatefulWidget {
  final Map<String, String> wordData;
  final VoidCallback onSwipeLeft;
  final VoidCallback onSwipeRight;

  const SwipeableCard({
    super.key,
    required this.wordData,
    required this.onSwipeLeft,
    required this.onSwipeRight,
  });

  @override
  State<SwipeableCard> createState() => _SwipeableCardState();
}

class _SwipeableCardState extends State<SwipeableCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  Offset _dragOffset = Offset.zero;
  double _angle = 0;
  bool _isDragging = false;
  bool _isAnimatingOut = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onPanStart(DragStartDetails details) {
    if (_isAnimatingOut) return;
    setState(() {
      _isDragging = true;
    });
  }

  void _onPanUpdate(DragUpdateDetails details) {
    if (_isAnimatingOut) return;
    setState(() {
      _dragOffset += details.delta;
      _angle = 45 * (_dragOffset.dx / MediaQuery.of(context).size.width);
    });
  }

  void _onPanEnd(DragEndDetails details) {
    if (_isAnimatingOut) return;
    setState(() {
      _isDragging = false;
    });

    final threshold = MediaQuery.of(context).size.width * 0.25;

    if (_dragOffset.dx > threshold) {
      animateOut(isRight: true);
    } else if (_dragOffset.dx < -threshold) {
      animateOut(isRight: false);
    } else {
      _resetPosition();
    }
  }

  void animateOut({required bool isRight}) {
    if (_isAnimatingOut) return;
    _isAnimatingOut = true;

    HapticFeedback.mediumImpact();

    final screenWidth = MediaQuery.of(context).size.width;
    final endOffset = Offset(
      isRight ? screenWidth : -screenWidth,
      _dragOffset.dy,
    );

    final animation = Tween<Offset>(begin: _dragOffset, end: endOffset).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    final angleAnimation =
        Tween<double>(begin: _angle, end: isRight ? 45 : -45).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
    );

    _animationController.forward(from: 0).then((_) {
      if (isRight) {
        widget.onSwipeRight();
      } else {
        widget.onSwipeLeft();
      }
    });

    animation.addListener(() {
      setState(() {
        _dragOffset = animation.value;
        _angle = angleAnimation.value;
      });
    });
  }

  void _resetPosition() {
    final animation =
        Tween<Offset>(begin: _dragOffset, end: Offset.zero).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticOut),
    );

    final angleAnimation = Tween<double>(begin: _angle, end: 0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticOut),
    );

    _animationController.forward(from: 0);

    animation.addListener(() {
      setState(() {
        _dragOffset = animation.value;
        _angle = angleAnimation.value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final double opacity = min((_dragOffset.dx.abs() / 150), 1.0);
    final bool isSwipingRight = _dragOffset.dx > 0;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onPanStart: _onPanStart,
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: Transform.translate(
        offset: _dragOffset,
        child: Transform.rotate(
          angle: _angle * (pi / 180),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(32),
              border: Border.all(
                  color: Colors.grey.withValues(alpha: 0.1), width: 1),
              boxShadow: [
                BoxShadow(
                  color:
                      Colors.black.withValues(alpha: _isDragging ? 0.15 : 0.05),
                  blurRadius: _isDragging ? 20 : 10,
                  spreadRadius: _isDragging ? 2 : 0,
                )
              ],
            ),
            child: Stack(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.wordData['word']!,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.grey.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            widget.wordData['translation']!,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: Colors.grey[700],
                                ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (opacity > 0.1)
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
                                .withOpacity(opacity),
                            width: 4,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          isSwipingRight ? 'ЗНАЮ' : 'НЕ ЗНАЮ',
                          style: TextStyle(
                            color: (isSwipingRight
                                    ? Colors.green
                                    : Colors.redAccent)
                                .withOpacity(opacity),
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

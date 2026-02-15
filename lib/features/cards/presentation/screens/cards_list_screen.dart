import 'dart:io';
import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import 'package:lexiflow/core/database/app_database.dart';
import 'package:lexiflow/core/services/image_service.dart';
import 'package:lexiflow/features/decks/presentation/screens/add_card_screen.dart';
import 'package:lexiflow/features/cards/presentation/screens/study_screen.dart';

class CardsListScreen extends StatefulWidget {
  final AppDatabase db;
  final int deckId;
  final String deckName;

  const CardsListScreen({
    super.key,
    required this.db,
    required this.deckId,
    required this.deckName,
  });

  @override
  State<CardsListScreen> createState() => _CardsListScreenState();
}

class _CardsListScreenState extends State<CardsListScreen> {
  List<CardData> _cards = [];
  bool _isLoading = true;
  bool _showFront = true;

  @override
  void initState() {
    super.initState();
    _loadCards();
  }

  Future<void> _loadCards() async {
    setState(() => _isLoading = true);
    try {
      final cards = await widget.db.getCardsByDeckId(widget.deckId);
      setState(() {
        _cards = cards;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ошибка загрузки: $e')),
        );
      }
    }
  }

  Future<void> _deleteCard(CardData card) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Удалить карточку?'),
        content:
            Text('Карточка "${card.frontText}" будет удалена безвозвратно.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Отмена'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Удалить'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      try {
        if (card.frontImagePath != null) {
          await ImageService.deleteImage(card.frontImagePath);
        }
        if (card.backImagePath != null) {
          await ImageService.deleteImage(card.backImagePath);
        }
        await widget.db.deleteCard(card.id);
        await _loadCards();
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Карточка удалена')),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Ошибка удаления: $e')),
          );
        }
      }
    }
  }

  Future<void> _toggleMastered(CardData card) async {
    try {
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
        repetitions: drift.Value(card.repetitions),
        interval: drift.Value(card.interval),
        nextReviewDate: drift.Value<DateTime?>(
          card.isMastered ? null : DateTime.now().add(const Duration(days: 30)),
        ),
        lastReviewedAt: drift.Value<DateTime?>(card.lastReviewedAt),
        correctCount: drift.Value(card.correctCount),
        incorrectCount: drift.Value(card.incorrectCount),
        isMastered: drift.Value(!card.isMastered),
        createdAt: drift.Value(card.createdAt),
        updatedAt: drift.Value(DateTime.now()),
      );

      await widget.db.into(widget.db.cards).insertOnConflictUpdate(updatedCard);
      await _loadCards();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              !card.isMastered
                  ? '✅ Карточка отмечена как выученная'
                  : 'Карточка возвращена в обучение',
            ),
            backgroundColor: !card.isMastered ? Colors.green : Colors.blue,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ошибка: $e')),
        );
      }
    }
  }

  void _startStudy() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StudyScreen(
          db: widget.db,
          deckId: widget.deckId,
          deckName: widget.deckName,
        ),
      ),
    ).then((_) => _loadCards());
  }

  @override
  Widget build(BuildContext context) {
    final cardsToReview = _cards.where((c) => !c.isMastered).length;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.deckName),
        actions: [
          IconButton(
            icon: Icon(_showFront ? Icons.flip_to_back : Icons.flip_to_front),
            onPressed: () => setState(() => _showFront = !_showFront),
            tooltip:
                _showFront ? 'Показать обратную сторону' : 'Показать переднюю',
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadCards,
            tooltip: 'Обновить',
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _cards.isEmpty
              ? _buildEmptyState()
              : Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      color: Theme.of(context).colorScheme.primaryContainer,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildStatItem(
                            icon: Icons.style,
                            label: 'Всего',
                            value: '${_cards.length}',
                            color: Colors.blue,
                          ),
                          _buildStatItem(
                            icon: Icons.school,
                            label: 'К изучению',
                            value: '$cardsToReview',
                            color: Colors.orange,
                          ),
                          _buildStatItem(
                            icon: Icons.check_circle,
                            label: 'Освоено',
                            value: '${_cards.length - cardsToReview}',
                            color: Colors.green,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: _cards.length,
                        itemBuilder: (context, index) =>
                            _buildCardItem(_cards[index]),
                      ),
                    ),
                  ],
                ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (cardsToReview > 0)
            FloatingActionButton.extended(
              onPressed: _startStudy,
              icon: const Icon(Icons.school),
              label: Text('Начать обучение ($cardsToReview)'),
              heroTag: 'study',
            ),
          const SizedBox(height: 12),
          FloatingActionButton(
            heroTag: 'add',
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddCardScreen(
                    db: widget.db,
                    deckId: widget.deckId,
                  ),
                ),
              );
              _loadCards();
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.style_outlined, size: 80, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text(
            'Нет карточек',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: Colors.grey[600]),
          ),
          const SizedBox(height: 8),
          Text(
            'Добавьте первую карточку для изучения',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.grey[500]),
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddCardScreen(
                    db: widget.db,
                    deckId: widget.deckId,
                  ),
                ),
              );
              _loadCards();
            },
            icon: const Icon(Icons.add),
            label: const Text('Создать карточку'),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Column(
      children: [
        Icon(icon, color: color, size: 28),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
        ),
      ],
    );
  }

  Widget _buildCardItem(CardData card) {
    final text = _showFront ? card.frontText : card.backText;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddCardScreen(
                db: widget.db,
                deckId: widget.deckId,
                cardToEdit: card,
              ),
            ),
          );
          _loadCards();
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      text,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  if (card.isMastered)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.check_circle,
                              size: 16, color: Colors.green[700]),
                          const SizedBox(width: 4),
                          Text(
                            'Освоено',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Colors.green[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              if (card.pronunciation != null &&
                  card.pronunciation!.isNotEmpty) ...[
                const SizedBox(height: 4),
                Text(
                  card.pronunciation!,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.blue,
                        fontStyle: FontStyle.italic,
                      ),
                ),
              ],
              if (card.transcription != null &&
                  card.transcription!.isNotEmpty) ...[
                const SizedBox(height: 4),
                Text(
                  card.transcription!,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.purple,
                        fontFamily: 'monospace',
                      ),
                ),
              ],
              if (card.example != null && card.example!.isNotEmpty) ...[
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    card.example!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontStyle: FontStyle.italic),
                  ),
                ),
              ],
              const SizedBox(height: 12),
              Row(
                children: [
                  _buildCardStat(
                    icon: Icons.repeat,
                    label: 'Повторений',
                    value: '${card.repetitions}',
                  ),
                  const SizedBox(width: 16),
                  _buildCardStat(
                    icon: Icons.check_circle_outline,
                    label: 'Правильно',
                    value: '${card.correctCount}',
                    color: Colors.green,
                  ),
                  const SizedBox(width: 16),
                  _buildCardStat(
                    icon: Icons.cancel_outlined,
                    label: 'Ошибок',
                    value: '${card.incorrectCount}',
                    color: Colors.red,
                  ),
                  const Spacer(),
                  if (card.frontImagePath != null || card.backImagePath != null)
                    const Icon(Icons.image, size: 16, color: Colors.grey),
                  if (card.frontAudioPath != null ||
                      card.backAudioPath != null) ...[
                    const SizedBox(width: 4),
                    const Icon(Icons.volume_up, size: 16, color: Colors.grey),
                  ],
                  if (card.frontVideoUrl != null ||
                      card.backVideoUrl != null) ...[
                    const SizedBox(width: 4),
                    const Icon(Icons.play_circle, size: 16, color: Colors.grey),
                  ],
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () => _toggleMastered(card),
                      icon: Icon(
                        card.isMastered
                            ? Icons.restart_alt
                            : Icons.check_circle,
                        size: 18,
                      ),
                      label: Text(
                        card.isMastered ? 'Вернуть' : 'Выучено',
                        style: const TextStyle(fontSize: 13),
                      ),
                      style: OutlinedButton.styleFrom(
                        foregroundColor:
                            card.isMastered ? Colors.blue : Colors.green,
                        side: BorderSide(
                          color: card.isMastered ? Colors.blue : Colors.green,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddCardScreen(
                              db: widget.db,
                              deckId: widget.deckId,
                              cardToEdit: card,
                            ),
                          ),
                        );
                        _loadCards();
                      },
                      icon: const Icon(Icons.edit, size: 18),
                      label: const Text('Изменить',
                          style: TextStyle(fontSize: 13)),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: () => _deleteCard(card),
                    icon: const Icon(Icons.delete, color: Colors.red),
                    tooltip: 'Удалить',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardStat({
    required IconData icon,
    required String label,
    required String value,
    Color? color,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: color ?? Colors.grey[600]),
        const SizedBox(width: 4),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            Text(
              label,
              style: TextStyle(fontSize: 9, color: Colors.grey[600]),
            ),
          ],
        ),
      ],
    );
  }
}

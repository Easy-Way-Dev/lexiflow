import 'dart:io';
import 'package:flutter/material.dart';
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
  bool _showBackSide = false;

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

  Future<void> _addCard() async {
    final result = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (context) => AddCardScreen(
          db: widget.db,
          deckId: widget.deckId,
        ),
      ),
    );

    if (result == true) {
      _loadCards();
    }
  }

  Future<void> _editCard(CardData card) async {
    final result = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (context) => AddCardScreen(
          db: widget.db,
          deckId: widget.deckId,
          cardToEdit: card,
        ),
      ),
    );

    if (result == true) {
      _loadCards();
    }
  }

  Future<void> _startStudy() async {
    if (_cards.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Добавьте хотя бы одну карточку')),
      );
      return;
    }

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StudyScreen(
          db: widget.db,
          deckId: widget.deckId,
          deckName: widget.deckName,
        ),
      ),
    );

    _loadCards();
  }

  Future<void> _deleteCard(CardData card) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Удалить карточку?'),
        content: const Text('Эта карточка будет удалена безвозвратно.'),
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
        // Удаляем изображения
        await ImageService.deleteImage(card.frontImagePath);
        await ImageService.deleteImage(card.backImagePath);

        // Удаляем карточку
        await widget.db.deleteCard(card.id);
        _loadCards();

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Карточка удалена')),
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.deckName),
        actions: [
          IconButton(
            icon:
                Icon(_showBackSide ? Icons.flip_to_front : Icons.flip_to_back),
            onPressed: () {
              setState(() => _showBackSide = !_showBackSide);
            },
            tooltip: _showBackSide
                ? 'Показать лицевую сторону'
                : 'Показать обратную сторону',
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
                    if (_cards.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: SizedBox(
                          width: double.infinity,
                          child: FilledButton.icon(
                            onPressed: _startStudy,
                            icon: const Icon(Icons.school),
                            label: const Text('Начать обучение'),
                            style: FilledButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              textStyle: const TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    Expanded(
                      child: _buildCardsList(),
                    ),
                  ],
                ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addCard,
        icon: const Icon(Icons.add),
        label: const Text('Новая карточка'),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.style_outlined,
            size: 80,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'Нет карточек',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.grey[600],
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Добавьте первую карточку для изучения',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[500],
                ),
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: _addCard,
            icon: const Icon(Icons.add),
            label: const Text('Создать карточку'),
          ),
        ],
      ),
    );
  }

  Widget _buildCardsList() {
    return RefreshIndicator(
      onRefresh: _loadCards,
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _cards.length,
        itemBuilder: (context, index) {
          final card = _cards[index];
          return _buildCardItem(card);
        },
      ),
    );
  }

  Widget _buildCardItem(CardData card) {
    final displayText = _showBackSide ? card.backText : card.frontText;
    final displayImagePath =
        _showBackSide ? card.backImagePath : card.frontImagePath;
    final hasExample = card.example != null && card.example!.isNotEmpty;
    final hasPronunciation =
        card.pronunciation != null && card.pronunciation!.isNotEmpty;
    final hasImage = displayImagePath != null && displayImagePath.isNotEmpty;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => _editCard(card),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Изображение (если есть)
            if (hasImage)
              Image.file(
                File(displayImagePath),
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),

            // Текстовая информация
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          displayText,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      PopupMenuButton(
                        itemBuilder: (context) => [
                          const PopupMenuItem(
                            value: 'edit',
                            child: Row(
                              children: [
                                Icon(Icons.edit),
                                SizedBox(width: 8),
                                Text('Редактировать'),
                              ],
                            ),
                          ),
                          const PopupMenuItem(
                            value: 'delete',
                            child: Row(
                              children: [
                                Icon(Icons.delete, color: Colors.red),
                                SizedBox(width: 8),
                                Text('Удалить'),
                              ],
                            ),
                          ),
                        ],
                        onSelected: (value) {
                          if (value == 'delete') {
                            _deleteCard(card);
                          } else if (value == 'edit') {
                            _editCard(card);
                          }
                        },
                      ),
                    ],
                  ),
                  if (hasPronunciation) ...[
                    const SizedBox(height: 4),
                    Text(
                      card.pronunciation!,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.blue,
                            fontStyle: FontStyle.italic,
                          ),
                    ),
                  ],
                  if (hasExample) ...[
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        card.example!,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontStyle: FontStyle.italic,
                            ),
                      ),
                    ),
                  ],
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      if (card.isMastered)
                        const Chip(
                          label: Text('Освоено'),
                          backgroundColor: Colors.green,
                          labelStyle: TextStyle(color: Colors.white),
                          padding: EdgeInsets.symmetric(horizontal: 8),
                        )
                      else
                        Chip(
                          label: Text('Повторений: ${card.repetitions}'),
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                        ),
                      const SizedBox(width: 8),
                      if (card.correctCount > 0 || card.incorrectCount > 0)
                        Text(
                          '✓${card.correctCount} ✗${card.incorrectCount}',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.grey[600],
                                  ),
                        ),
                      const Spacer(),
                      // Иконки наличия медиа
                      if (card.frontImagePath != null ||
                          card.backImagePath != null)
                        Icon(Icons.image, size: 16, color: Colors.grey[600]),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

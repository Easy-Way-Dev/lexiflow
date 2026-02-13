import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:lexiflow/core/utils/audio_helper.dart';

class AudioRecorderWidget extends StatefulWidget {
  final String? audioPath;
  final Function(String?) onAudioChanged;
  final String label;

  const AudioRecorderWidget({
    super.key,
    required this.audioPath,
    required this.onAudioChanged,
    this.label = 'Аудио произношение',
  });

  @override
  State<AudioRecorderWidget> createState() => _AudioRecorderWidgetState();
}

class _AudioRecorderWidgetState extends State<AudioRecorderWidget> {
  bool _isRecording = false;
  bool _isPlaying = false;
  String? _currentAudioPath;
  int _recordingSeconds = 0;
  Timer? _recordingTimer;
  StreamSubscription? _playerSubscription;

  @override
  void initState() {
    super.initState();
    _currentAudioPath = widget.audioPath;

    _playerSubscription = AudioHelper.playerStateStream.listen((state) {
      if (mounted) {
        setState(() => _isPlaying = state == PlayerState.playing);
      }
    });
  }

  @override
  void dispose() {
    _recordingTimer?.cancel();
    _playerSubscription?.cancel();
    super.dispose();
  }

  // Таймер записи
  void _startTimer() {
    _recordingSeconds = 0;
    _recordingTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) setState(() => _recordingSeconds++);
    });
  }

  void _stopTimer() {
    _recordingTimer?.cancel();
    _recordingTimer = null;
  }

  String get _formattedTime {
    final mins = _recordingSeconds ~/ 60;
    final secs = _recordingSeconds % 60;
    return '${mins.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  Future<void> _toggleRecording() async {
    if (_isRecording) {
      // Останавливаем запись
      _stopTimer();
      setState(() => _isRecording = false);
      final path = await AudioHelper.stopRecording();

      if (path != null) {
        if (_currentAudioPath != null) {
          await AudioHelper.deleteAudio(_currentAudioPath);
        }
        setState(() => _currentAudioPath = path);
        widget.onAudioChanged(path);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.white),
                  SizedBox(width: 8),
                  Text('✅ Аудио записано!'),
                ],
              ),
              backgroundColor: Colors.green,
              duration: const Duration(seconds: 2),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('❌ Ошибка записи'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } else {
      // Начинаем запись
      final started = await AudioHelper.startRecording();
      if (started) {
        _startTimer();
        setState(() => _isRecording = true);
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('❌ Нет разрешения на запись микрофона'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }

  Future<void> _playAudio() async {
    if (_currentAudioPath == null) return;
    if (_isPlaying) {
      await AudioHelper.stopAudio();
    } else {
      await AudioHelper.playAudio(_currentAudioPath!);
    }
  }

  Future<void> _deleteAudio() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Удалить аудио?'),
        content: const Text('Запись будет удалена безвозвратно.'),
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
      await AudioHelper.stopAudio();
      await AudioHelper.deleteAudio(_currentAudioPath);
      setState(() => _currentAudioPath = null);
      widget.onAudioChanged(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    final hasAudio = _currentAudioPath != null && _currentAudioPath!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
        const SizedBox(height: 8),
        if (_isRecording) ...[
          // ===== ИДЁТ ЗАПИСЬ =====
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.red[50],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.red[300]!),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    // Мигающая точка
                    const _PulsingDot(),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Идёт запись...',
                            style: TextStyle(
                              color: Colors.red[700],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Говорите в микрофон',
                            style: TextStyle(
                              color: Colors.red[400],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Таймер
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red[100],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        _formattedTime,
                        style: TextStyle(
                          color: Colors.red[700],
                          fontWeight: FontWeight.bold,
                          fontFamily: 'monospace',
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // Индикатор уровня звука (анимированные полоски)
                const _SoundWaveIndicator(),
                const SizedBox(height: 12),
                // Кнопка стоп
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: _toggleRecording,
                    icon: const Icon(Icons.stop),
                    label: const Text('Остановить запись'),
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ] else if (hasAudio) ...[
          // ===== АУДИО ЗАПИСАНО =====
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.green[50],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.green[200]!),
            ),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: Colors.green[100],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.audiotrack,
                    color: Colors.green[700],
                    size: 22,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Аудио записано ✅',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.green[700],
                        ),
                      ),
                      Text(
                        _isPlaying
                            ? '▶ Воспроизведение...'
                            : 'Нажмите ▶ чтобы послушать',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.green[500],
                        ),
                      ),
                    ],
                  ),
                ),
                // Кнопка воспроизведения
                IconButton(
                  icon: Icon(
                    _isPlaying ? Icons.stop_circle : Icons.play_circle,
                    color: Colors.green[700],
                    size: 32,
                  ),
                  onPressed: _playAudio,
                  tooltip: _isPlaying ? 'Стоп' : 'Слушать',
                ),
                // Кнопка удаления
                IconButton(
                  icon: const Icon(Icons.delete_outline, color: Colors.red),
                  onPressed: _deleteAudio,
                  tooltip: 'Удалить',
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // Кнопка перезаписи
          OutlinedButton.icon(
            onPressed: _toggleRecording,
            icon: const Icon(Icons.mic, color: Colors.orange),
            label: const Text(
              'Записать заново',
              style: TextStyle(color: Colors.orange),
            ),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.orange),
              minimumSize: const Size(double.infinity, 44),
            ),
          ),
        ] else ...[
          // ===== НЕТ АУДИО =====
          OutlinedButton.icon(
            onPressed: _toggleRecording,
            icon: const Icon(Icons.mic, color: Colors.red),
            label: const Text('Записать произношение'),
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(double.infinity, 48),
              side: const BorderSide(color: Colors.red),
              foregroundColor: Colors.red,
            ),
          ),
        ],
      ],
    );
  }
}

// ===== МИГАЮЩАЯ ТОЧКА =====
class _PulsingDot extends StatefulWidget {
  const _PulsingDot();

  @override
  State<_PulsingDot> createState() => _PulsingDotState();
}

class _PulsingDotState extends State<_PulsingDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.3, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: Colors.red.withValues(alpha: _animation.value),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.red.withValues(alpha: _animation.value * 0.5),
                blurRadius: 8,
                spreadRadius: 2,
              ),
            ],
          ),
        );
      },
    );
  }
}

// ===== АНИМИРОВАННЫЕ ВОЛНЫ ЗВУКА =====
class _SoundWaveIndicator extends StatefulWidget {
  const _SoundWaveIndicator();

  @override
  State<_SoundWaveIndicator> createState() => _SoundWaveIndicatorState();
}

class _SoundWaveIndicatorState extends State<_SoundWaveIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: List.generate(12, (index) {
            // Каждая полоска имеет свою фазу
            final phase = (index / 12) * 2 * 3.14159;
            final value = (0.5 +
                        0.5 *
                            _sinApprox(
                                _controller.value * 2 * 3.14159 + phase)) *
                    0.8 +
                0.2;

            return Container(
              width: 6,
              height: 4 + value * 28,
              margin: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                color: Colors.red[400],
                borderRadius: BorderRadius.circular(3),
              ),
            );
          }),
        );
      },
    );
  }

  double _sinApprox(double x) {
    // Простая аппроксимация синуса
    x = x % (2 * 3.14159);
    if (x < 0) x += 2 * 3.14159;
    if (x < 3.14159) {
      return 4 * x * (3.14159 - x) / (3.14159 * 3.14159);
    } else {
      x -= 3.14159;
      return -4 * x * (3.14159 - x) / (3.14159 * 3.14159);
    }
  }
}

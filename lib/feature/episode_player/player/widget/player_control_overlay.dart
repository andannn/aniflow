import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayerControlOverlay extends StatelessWidget {
  const PlayerControlOverlay({
    super.key,
    required this.state,
    required this.title,
    required this.isFullScreen,
    required this.onRequestToggle,
    required this.onSeekToPositionMs,
    required this.onTogglePlay,
  });

  final VideoPlayerValue state;
  final String title;
  final bool isFullScreen;
  final VoidCallback onRequestToggle;
  final void Function(int) onSeekToPositionMs;
  final VoidCallback onTogglePlay;

  double get progress => state.position.inMilliseconds.toDouble();

  double get duration => state.duration.inMilliseconds.toDouble();

  bool get isPlaying => state.isPlaying;

  double get progressFactor => (progress / duration).clamp(0, 1);

  String get progressText =>
      "${_toDurationText(progress)} / ${_toDurationText(duration)}";

  @override
  Widget build(BuildContext context) {
    final bottomPadding = isFullScreen ? 22.0 : 0.0;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Center(
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.black26,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: onTogglePlay,
              icon: Icon(
                !isPlaying ? Icons.play_arrow : Icons.pause,
                size: 48,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: bottomPadding + -22,
          left: -24,
          right: -24,
          child: Slider(
            value: progressFactor,
            onChanged: (factor) {
              onSeekToPositionMs((factor * duration).toInt());
            },
          ),
        ),
        if (isFullScreen)
          Positioned(
            left: 3,
            top: 3,
            child: SizedBox(
              height: 64,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: onRequestToggle,
                    icon: const Icon(Icons.navigate_before, color: Colors.white70),
                  ),
                  Text(
                    title,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        Positioned(
          left: 8,
          bottom: bottomPadding + 12,
          child: Text(
            progressText,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        Positioned(
          right: 8,
          bottom: bottomPadding + 12,
          child: IconButton(
            onPressed: onRequestToggle,
            icon: const Icon(Icons.fullscreen, color: Colors.white70),
          ),
        )
      ],
    );
  }

  String _toDurationText(double progress) {
    final duration = Duration(milliseconds: progress.toInt());
    return "${duration.inMinutes.toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}";
  }
}

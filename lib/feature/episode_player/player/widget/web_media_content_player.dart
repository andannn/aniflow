import 'dart:async';

import 'package:aniflow/feature/episode_player/player/widget/player_control_overlay.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayerWithControlPanel extends StatefulWidget {
  const PlayerWithControlPanel({
    super.key,
    required this.url,
    required this.state,
    required this.onRequestToggleFullscreen,
    required this.controller,
    required this.onSeekToPositionMs,
    required this.onTogglePlay,
    required this.isFullScreen,
    required this.title,
    required this.onPlayCompleted,
  });

  final String url;
  final VideoPlayerValue state;
  final String title;
  final bool isFullScreen;
  final VideoPlayerController controller;

  final VoidCallback onRequestToggleFullscreen;
  final void Function(int) onSeekToPositionMs;
  final VoidCallback onTogglePlay;
  final VoidCallback onPlayCompleted;

  @override
  State<PlayerWithControlPanel> createState() => _PlayerWithControlPanelState();
}

class _PlayerWithControlPanelState extends State<PlayerWithControlPanel> {
  VideoPlayerController get controller => widget.controller;

  @override
  void initState() {
    super.initState();

    controller.addListener(_checkVideoEnded);
  }

  @override
  void dispose() {
    controller.removeListener(_checkVideoEnded);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !widget.isFullScreen,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          widget.onRequestToggleFullscreen();
        }
      },
      child: Stack(
        children: [
          Center(
            child: widget.state.isInitialized
                ? AspectRatio(
                    aspectRatio: widget.state.aspectRatio,
                    child: VideoPlayer(widget.controller),
                  )
                : Container(),
          ),
          // if (isReady)
          _PlayerGestureController(
            overlay: PlayerControlOverlay(
              state: widget.state,
              title: widget.title,
              isFullScreen: widget.isFullScreen,
              onRequestToggle: widget.onRequestToggleFullscreen,
              onSeekToPositionMs: widget.onSeekToPositionMs,
              onTogglePlay: widget.onTogglePlay,
            ),
          ),
        ],
      ),
    );
  }

  void _checkVideoEnded() {
    if (!controller.value.isInitialized) return;

    final position = controller.value.position;
    final duration = controller.value.duration;

    final isEnded = position.inMilliseconds >= (duration.inMilliseconds - 500);

    if (isEnded && !controller.value.isPlaying) {
      widget.onPlayCompleted();
    }
  }
}

class _PlayerGestureController extends StatefulWidget {
  const _PlayerGestureController({required this.overlay});

  final Widget overlay;

  @override
  State<_PlayerGestureController> createState() =>
      _PlayerGestureControllerState();
}

class _PlayerGestureControllerState extends State<_PlayerGestureController> {
  final isOverlayShowing = ValueNotifier(true);
  Timer? hideTimer;

  @override
  void initState() {
    _handleVisibilityChanged();
    isOverlayShowing.addListener(_handleVisibilityChanged);
    super.initState();
  }

  @override
  void dispose() {
    hideTimer?.cancel();
    isOverlayShowing.dispose();
    super.dispose();
  }

  void _handleVisibilityChanged() {
    hideTimer?.cancel();
    if (isOverlayShowing.value) {
      hideTimer = Timer(const Duration(seconds: 3), () {
        isOverlayShowing.value = false;
        setState(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTapDown: (details) {
        setState(() {
          isOverlayShowing.value = !isOverlayShowing.value;
        });
      },
      child: AnimatedOpacity(
        opacity: isOverlayShowing.value ? 1 : 0,
        duration: const Duration(milliseconds: 300),
        child: IgnorePointer(
          ignoring: !isOverlayShowing.value,
          child: widget.overlay,
        ),
      ),
    );
  }
}

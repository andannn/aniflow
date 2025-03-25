import 'dart:async';

import 'package:aniflow/feature/episode_player/player/widget/player_control_overlay.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayerWithControlPanel extends StatelessWidget {
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
  });

  final String url;
  final VideoPlayerValue state;
  final String title;
  final bool isFullScreen;
  final VideoPlayerController controller;

  final VoidCallback onRequestToggleFullscreen;
  final void Function(int) onSeekToPositionMs;
  final VoidCallback onTogglePlay;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !isFullScreen,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          onRequestToggleFullscreen();
        }
      },
      child: Stack(
        children: [
          Center(
            child: state.isInitialized
                ? AspectRatio(
                    aspectRatio: state.aspectRatio,
                    child: VideoPlayer(controller),
                  )
                : Container(),
          ),
          // if (isReady)
          _PlayerGestureController(
            overlay: PlayerControlOverlay(
              state: state,
              title: title,
              isFullScreen: isFullScreen,
              onRequestToggle: onRequestToggleFullscreen,
              onSeekToPositionMs: onSeekToPositionMs,
              onTogglePlay: onTogglePlay,
            ),
          ),
        ],
      ),
    );
  }
}

class _PlayerGestureController extends StatefulWidget {
  const _PlayerGestureController({super.key, required this.overlay});

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

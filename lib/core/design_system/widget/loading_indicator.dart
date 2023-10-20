import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({required this.isLoading, super.key});

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isLoading ? 1.0 : 0.0,
      duration: Config.defaultAnimationDuration,
      child: LoadingAnimationWidget.fourRotatingDots(
        color: Theme.of(context).colorScheme.onSurfaceVariant,
        size: 33.0,
      ),
    );
  }
}

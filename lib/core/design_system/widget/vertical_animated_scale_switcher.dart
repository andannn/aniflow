import 'package:aniflow/core/design_system/animation/scale_transaction_animation.dart';
import 'package:flutter/material.dart';

class AnimatedScaleSwitcher extends StatelessWidget {
  const AnimatedScaleSwitcher(
      {required this.builder, required this.visible, super.key});

  final Widget Function() builder;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      switchInCurve: Curves.ease,
      transitionBuilder: buildSizeTransition,
      child: visible ? builder() : const SizedBox(),
    );
  }
}

class AnimatedFadeSwitcher extends StatelessWidget {
  const AnimatedFadeSwitcher(
      {required this.builder, required this.visible, super.key});

  final Widget Function() builder;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      switchInCurve: Curves.ease,
      transitionBuilder: buildFadeTransition,
      child: visible ? builder() : const SizedBox(),
    );
  }

  Widget buildFadeTransition(Widget child, Animation<double> animation) {
    return FadeTransition(opacity: animation, child: child);
  }
}

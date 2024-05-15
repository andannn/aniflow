import 'package:aniflow/core/design_system/animation/scale_transaction_animation.dart';
import 'package:flutter/material.dart';

class VerticalScaleSwitcher extends StatelessWidget {
  const VerticalScaleSwitcher(
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

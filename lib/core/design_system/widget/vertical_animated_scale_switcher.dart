import 'package:anime_tracker/core/design_system/animetion/scale_transaction_animetion.dart';
import 'package:flutter/material.dart';

class VerticalScaleSwitcher extends StatelessWidget {
  const VerticalScaleSwitcher({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      switchInCurve: Curves.ease,
      transitionBuilder: buildSizeTransition,
      child: child,
    );
  }
}
import 'package:aniflow/core/design_system/animetion/scale_transaction_animetion.dart';
import 'package:flutter/material.dart';

class VerticalScaleSwitcher extends StatelessWidget {
  const VerticalScaleSwitcher(
      {required this.child, required this.visible, super.key});

  final Widget child;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      switchInCurve: Curves.ease,
      transitionBuilder: buildSizeTransition,
      child: visible ? child : const SizedBox(),
    );
  }
}

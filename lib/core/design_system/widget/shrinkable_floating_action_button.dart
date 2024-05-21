import 'package:flutter/material.dart';

class ShrinkableFloatingActionButton extends StatelessWidget {
  const ShrinkableFloatingActionButton({
    super.key,
    required this.isExtended,
    required this.onPressed,
    this.icon,
    this.label, this.heroTag,
  });

  final bool isExtended;
  final VoidCallback onPressed;
  final Widget? icon;
  final Widget? label;
  final Object? heroTag;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      heroTag: heroTag,
      onPressed: onPressed,
      label: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        switchInCurve: Curves.ease,
        transitionBuilder: _buildTransition,
        child: isExtended
            ? Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: icon,
                  ),
                  label ?? const SizedBox()
                ],
              )
            : icon,
      ),
    );
  }

  Widget _buildTransition(Widget child, Animation<double> animation) {
    return FadeTransition(
      opacity: animation,
      child: SizeTransition(
        sizeFactor: animation,
        axis: Axis.horizontal,
        child: child,
      ),
    );
  }
}

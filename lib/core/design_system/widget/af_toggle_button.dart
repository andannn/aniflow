import 'package:flutter/material.dart';

class AniFlowToggleButton extends StatelessWidget {
  const AniFlowToggleButton(
      {required this.selected,
      required this.onClick,
      required this.label,
      super.key});

  final bool selected;
  final VoidCallback onClick;
  final String label;

  @override
  Widget build(BuildContext context) {
    if (selected) {
      return FilledButton.tonalIcon(
          onPressed: onClick,
          icon: const Icon(Icons.check),
          label: Text(label));
    } else {
      return OutlinedButton(onPressed: onClick, child: Text(label));
    }
  }
}

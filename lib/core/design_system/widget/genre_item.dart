import 'package:flutter/material.dart';

class GenreItem extends StatelessWidget {
  const GenreItem({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const StadiumBorder(),
      color: Theme.of(context).colorScheme.secondaryContainer,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4.0),
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
    );
  }
}

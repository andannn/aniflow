import 'package:flutter/material.dart';

class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Coming soon..',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}

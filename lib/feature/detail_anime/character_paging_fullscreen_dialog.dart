import 'package:flutter/material.dart';

class CharactersPaging extends StatefulWidget {
  const CharactersPaging({super.key});

  @override
  State<CharactersPaging> createState() => _CharactersPagingState();
}

class _CharactersPagingState extends State<CharactersPaging> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(title: const Text('Characters')),
    );
  }
}

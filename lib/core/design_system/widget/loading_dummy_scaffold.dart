import 'package:aniflow/core/design_system/widget/loading_indicator.dart';
import 'package:flutter/material.dart';

class LoadingDummyScaffold extends StatelessWidget {
  const LoadingDummyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('----'),
        actions: const [
          LoadingIndicator(isLoading: true),
          SizedBox(width: 10),
        ],
      ),
      body: const SizedBox(),
    );
  }
}

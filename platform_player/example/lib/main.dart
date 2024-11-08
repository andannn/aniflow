import 'package:flutter/material.dart';
import 'package:platform_player/platform_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _platformPlayerPlugin = PlatformPlayer();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: TextButton(
            onPressed: () {
              _platformPlayerPlugin.navigateToPlayer("https://storage.googleapis.com/exoplayer-test-media-1/mp4/dizzy-with-tx3g.mp4");
            },
            child: const Text("navigateToPlayer"),
          ),
        ),
      ),
    );
  }
}

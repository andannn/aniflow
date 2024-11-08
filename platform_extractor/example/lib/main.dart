import 'package:flutter/material.dart';
import 'dart:async';

import 'package:platform_extractor/platform_extractor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _source = 'Unknown';
  final _platformExtractorPlugin = PlatformExtractor();

  @override
  void initState() {
    super.initState();

    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String source;
    try {
      source =
          await _platformExtractorPlugin.extract("https://megacloud.tv/embed-2/e-1/KwTQtCalS9Hc?k=1");
    } on Exception catch (e) {
      source = '$e';
    }

    if (!mounted) return;

    setState(() {
      _source = source;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text(_source),
        ),
      ),
    );
  }
}

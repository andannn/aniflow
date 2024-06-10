import 'package:flutter/material.dart';
import 'dart:async';

import 'package:platform_downloader/platform_downloader.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _platformDownloaderPlugin = PlatformDownloader();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    await _platformDownloaderPlugin.downloadImageToExternalStorage(
      "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx1-CXtrrkMpJ8Zq.png",
      'aniflow',
      'test',
    );

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
      ),
    );
  }
}

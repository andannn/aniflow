import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:platform_notification/notification_channel_model.dart';
import 'package:platform_notification/notification_model.dart';
import 'package:platform_notification/platform_notification.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? _areNotificationsEnabled;
  final _platformNotificationPlugin = PlatformNotification();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    bool? areNotificationsEnabled;
    try {
      areNotificationsEnabled =
          await _platformNotificationPlugin.areNotificationsEnabled();
    } on PlatformException {}

    setState(() {
      _areNotificationsEnabled = areNotificationsEnabled;
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
          child: Column(
            children: [
              Text('Running on: $_areNotificationsEnabled\n'),
              TextButton(
                onPressed: () {
                  _platformNotificationPlugin.sendNotification(
                    const NotificationModel(
                      id: 1,
                      title: "AAA",
                      body: "BBBB",
                      notificationChannel: NotificationChannelModel(
                        id: "1",
                        name: 'channel 1',
                        description: "Channel 1",
                        importance: 1
                      ),
                    ),
                  );
                },
                child: const Text('send notification'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:aniflow/app/app.dart';
import 'package:aniflow/core/firebase/analytics/firebase_analytics_util.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// init package info
  await PackageInfo.fromPlatform();

  /// init firebase
  await Firebase.initializeApp();

  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
  ));

  /// run app after core instance initialized.
  runApp(const AniFlowApp());

  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  unawaited(FirebaseAnalytics.instance.setInitialUserProperty());
  unawaited(FirebaseAnalytics.instance.logAppDataSizeEvent());

  unawaited(requestNotificationPermissionIfNeeded());

// TODO:
  // GetItScope.of(context).get<BackgroundTaskManager>();
}

Future requestNotificationPermissionIfNeeded() async {
  await Permission.notification.request();
}

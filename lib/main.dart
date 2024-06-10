import 'dart:async';
import 'dart:ui';

import 'package:aniflow/app/app.dart';
import 'package:aniflow/core/firebase/firebase_analytics_util.dart';
import 'package:aniflow/di/get_it_di.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDI(GetIt.instance);

  /// init firebase
  await Firebase.initializeApp();

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
}

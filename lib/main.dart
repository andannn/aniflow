import 'dart:async';
import 'dart:ui';

import 'package:aniflow/app/app.dart';
import 'package:aniflow/core/background_task/excutor.dart';
import 'package:aniflow/core/background_task/task.dart';
import 'package:aniflow/core/firebase/analytics/firebase_analytics_util.dart';
import 'package:aniflow/di/get_it_di.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:workmanager/workmanager.dart';

@pragma('vm:entry-point')
void callbackDispatcher() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await initDI(GetIt.instance);

  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  Workmanager().executeTask((taskName, inputData) async {
    final executor = Executor.convertToExecutor((taskName, inputData).toTask());
    if (executor == null) {
      throw 'no support task of name $taskName, inputData $inputData.';
    }

    return executor.execute();
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// init firebase
  await Firebase.initializeApp();

  await initDI(GetIt.instance);

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

  unawaited(registerBackgroundTasks());
}

Future registerBackgroundTasks() async {
  await Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
  final register = getAllTasks().map((task) {
    switch (task) {
      case PeriodicTask(name: final name, frequency: final freq):
        // return Workmanager().registerPeriodicTask(name, name, frequency: freq);
        return Workmanager().registerOneOffTask(name, name);
    }
  });
  await Future.wait(register);
}

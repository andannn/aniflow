import 'dart:async';

import 'package:aniflow/app/app.dart';
import 'package:aniflow/core/background_task/executor/executor.dart';
import 'package:aniflow/core/background_task/task.dart';
import 'package:aniflow/core/background_task/task_factory.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/firebase/analytics/firebase_analytics_util.dart';
import 'package:aniflow/di/get_it_di.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:workmanager/workmanager.dart';

/// entry point to receive callback of work-manager(android)
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

  unawaited(requestNotificationPermissionIfNeeded());
}

Future requestNotificationPermissionIfNeeded() async {
  await Permission.notification.request();
}

Future registerBackgroundTasks() async {
  await Workmanager().initialize(callbackDispatcher, isInDebugMode: kDebugMode);
  final factory = GetIt.instance.get<BackgroundTaskFactory>();
  final tasks = await factory.createTasks();
  logger.d('tasks is registered $tasks');
  final register = tasks.map((task) {
    switch (task) {
      case PeriodicTask(
          name: final name,
          frequency: final freq,
          existingWorkPolicy: final existingWorkPolicy,
          constraints: final constraints,
        ):
        return Workmanager().registerPeriodicTask(
          name,
          name,
          frequency: freq,
          existingWorkPolicy: existingWorkPolicy,
          constraints: constraints,
        );
    }
  });
  await Future.wait(register);
}

import 'dart:async';

import 'package:aniflow/app/app.dart';
import 'package:aniflow/core/background_task/executor.dart';
import 'package:aniflow/core/background_task/task_manager.dart';
import 'package:aniflow/core/background_task/task.dart';
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

  Workmanager().executeTask((taskName, inputData) async {
    try {
      final task = TaskConverter().fromInputData(taskName, inputData);
      final executor = Executor.fromTask(task);
      if (executor == null) {
        throw 'no support task of name $taskName, inputData $inputData.';
      }

      return executor.execute();
    } on Exception catch (e) {
      await FirebaseCrashlytics.instance
          .recordFlutterError(FlutterErrorDetails(exception: e));
      return false;
    }
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

  unawaited(requestNotificationPermissionIfNeeded());

  GetIt.instance.get<BackgroundTaskManager>();
}

Future requestNotificationPermissionIfNeeded() async {
  await Permission.notification.request();
}

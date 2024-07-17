import 'dart:async';

import 'package:aniflow/app/app.dart';
import 'package:aniflow/app/app_bloc.dart';
import 'package:aniflow/app/di/get_it_di.dart';
import 'package:aniflow/core/background_task/task_manager.dart';
import 'package:aniflow/core/firebase/analytics/firebase_analytics_util.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// init firebase
  await Firebase.initializeApp();

  await initDI(GetIt.instance);

  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
  ));

  /// run app after core instance initialized.
  runApp(
    BlocProvider(
      create: (BuildContext context) => GetIt.instance.get<AppBloc>(),
      child: const AniFlowApp(),
    ),
  );

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

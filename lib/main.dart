import 'dart:async';
import 'dart:ui';

import 'package:aniflow/app/app.dart';
import 'package:aniflow/core/data/activity_repository.dart';
import 'package:aniflow/core/data/auth_repository.dart';
import 'package:aniflow/core/data/favorite_repository.dart';
import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/data/notification_repository.dart';
import 'package:aniflow/core/data/search_repository.dart';
import 'package:aniflow/core/data/settings_repository.dart';
import 'package:aniflow/core/data/user_info_repository.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/firebase/firebase_analytics_util.dart';
import 'package:aniflow/core/shared_preference/aniflow_preferences.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// init shared preference used in app.
  await AniFlowPreferences().init();

  /// init date base used in this app.
  await AniflowDatabase()
      .initDatabase(path: join(await getDatabasesPath(), databaseFileName));

  /// init firebase
  await Firebase.initializeApp();

  /// run app after core instance initialized.
  runApp(MultiRepositoryProvider(providers: [
    RepositoryProvider<MediaInformationRepository>(
      create: (context) => MediaInformationRepositoryImpl(),
    ),
    RepositoryProvider<SettingsRepository>(
      create: (context) => SettingsRepositoryImpl(),
    ),
    RepositoryProvider<AuthRepository>(
      create: (context) => AuthRepositoryImpl(),
    ),
    RepositoryProvider<MediaListRepository>(
      create: (context) => MediaListRepositoryImpl(),
    ),
    RepositoryProvider<SearchRepository>(
      create: (context) => SearchRepositoryImpl(),
    ),
    RepositoryProvider<FavoriteRepository>(
      create: (context) => FavoriteRepositoryImpl(),
    ),
    RepositoryProvider<ActivityRepository>(
      create: (context) => ActivityRepositoryImpl(),
    ),
    RepositoryProvider<UserInfoRepository>(
      create: (context) => UserInfoRepositoryImpl(),
    ),
    RepositoryProvider<NotificationRepository>(
      create: (context) => NotificationRepositoryImpl(),
    ),
  ], child: const AniFlowApp()));

  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  unawaited(FirebaseAnalytics.instance.computeAndSetAppDataSizeProperty());
}

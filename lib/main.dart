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
import 'package:aniflow/core/data/user_statistics_repository.dart';
import 'package:aniflow/core/firebase/firebase_analytics_util.dart';
import 'package:aniflow/core/shared_preference/aniflow_preferences.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// init shared preference used in app.
  await AniFlowPreferences().init();

  /// init firebase
  await Firebase.initializeApp();

  /// run app after core instance initialized.
  runApp(MultiRepositoryProvider(providers: [
    RepositoryProvider<MediaInformationRepository>(
      create: (context) => MediaInformationRepository(),
    ),
    RepositoryProvider<SettingsRepository>(
      create: (context) => SettingsRepository(),
    ),
    RepositoryProvider<AuthRepository>(
      create: (context) => AuthRepository(),
    ),
    RepositoryProvider<MediaListRepository>(
      create: (context) => MediaListRepository(),
    ),
    RepositoryProvider<SearchRepository>(
      create: (context) => SearchRepository(),
    ),
    RepositoryProvider<FavoriteRepository>(
      create: (context) => FavoriteRepository(),
    ),
    RepositoryProvider<ActivityRepository>(
      create: (context) => ActivityRepository(),
    ),
    RepositoryProvider<UserInfoRepository>(
      create: (context) => UserInfoRepository(),
    ),
    RepositoryProvider<NotificationRepository>(
      create: (context) => NotificationRepository(),
    ),
    RepositoryProvider<UserStatisticsRepository>(
      create: (context) => UserStatisticsRepository(),
    ),
  ], child: const AniFlowApp()));

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

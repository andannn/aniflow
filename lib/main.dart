import 'package:anime_tracker/core/data/repository/ani_list_repository.dart';
import 'package:anime_tracker/core/data/repository/auth_repository.dart';
import 'package:anime_tracker/core/data/repository/user_data_repository.dart';
import 'package:anime_tracker/core/database/anime_database.dart';
import 'package:anime_tracker/core/shared_preference/user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/app.dart';
import 'core/network/ani_list_data_source.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// init shared preference used in app.
  await AnimeTrackerPreferences().init();

  /// init date base used in this app.
  await AnimeDatabase().initDatabase();

  /// run app after core instance initialized.
  runApp(MultiRepositoryProvider(providers: [
    RepositoryProvider<AniListRepository>(
        create: (context) => AniListRepositoryImpl(AniListDataSource(),
            AnimeDatabase().getAnimeDao(), AnimeTrackerPreferences())),
    RepositoryProvider<UserDataRepository>(
        create: (context) => UserDataRepositoryImpl(AnimeTrackerPreferences())),
    RepositoryProvider<AuthRepository>(
        create: (context) => AuthRepositoryImpl()),
  ], child: const AnimeTrackerApp()));
}

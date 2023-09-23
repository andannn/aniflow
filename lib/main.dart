import 'package:anime_tracker/core/data/repository/ani_list_repository.dart';
import 'package:anime_tracker/core/data/repository/auth_repository.dart';
import 'package:anime_tracker/core/data/repository/user_anime_list_repository.dart';
import 'package:anime_tracker/core/data/repository/user_data_repository.dart';
import 'package:anime_tracker/core/database/anime_database.dart';
import 'package:anime_tracker/core/shared_preference/user_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:anime_tracker/app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// init shared preference used in app.
  await AniFlowPreferences().init();

  /// init date base used in this app.
  await AnimeDatabase().initDatabase();

  /// run app after core instance initialized.
  runApp(MultiRepositoryProvider(providers: [
    RepositoryProvider<AniListRepository>(
      create: (context) => AniListRepositoryImpl(),
    ),
    RepositoryProvider<UserDataRepository>(
      create: (context) => UserDataRepositoryImpl(),
    ),
    RepositoryProvider<AuthRepository>(
      create: (context) => AuthRepositoryImpl(),
    ),
    RepositoryProvider<UserAnimeListRepository>(
      create: (context) => UserAnimeListRepositoryImpl(),
    ),
  ], child: const AnimeTrackerApp()));
}

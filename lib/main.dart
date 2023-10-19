import 'package:anime_tracker/app/app.dart';
import 'package:anime_tracker/core/data/auth_repository.dart';
import 'package:anime_tracker/core/data/media_information_repository.dart';
import 'package:anime_tracker/core/data/media_list_repository.dart';
import 'package:anime_tracker/core/data/search_repository.dart';
import 'package:anime_tracker/core/data/user_data_repository.dart';
import 'package:anime_tracker/core/database/aniflow_database.dart';
import 'package:anime_tracker/core/shared_preference/aniflow_prefrences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// init shared preference used in app.
  await AniFlowPreferences().init();

  /// init date base used in this app.
  await AniflowDatabase().initDatabase();

  /// run app after core instance initialized.
  runApp(MultiRepositoryProvider(providers: [
    RepositoryProvider<MediaInformationRepository>(
      create: (context) => MediaInformationRepositoryImpl(),
    ),
    RepositoryProvider<UserDataRepository>(
      create: (context) => UserDataRepositoryImpl(),
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
  ], child: const AnimeTrackerApp()));
}

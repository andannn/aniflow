import 'package:anime_tracker/core/database/anime_database.dart';
import 'package:anime_tracker/core/shared_preference/user_data.dart';
import 'package:flutter/material.dart';

import 'app/ui/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// init shared preference used in app.
  await AnimeTrackerPreferences().init();

  /// init date base used in this app.
  await AnimeDatabase().initDatabase();

  /// run app after core instance initialized.
  runApp(const AnimeTrackerApp());
}

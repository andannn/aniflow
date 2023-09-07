import 'package:anime_tracker/core/shared_preference/user_data.dart';
import 'package:anime_tracker/util/anime_season_tuil.dart';
import 'package:flutter/cupertino.dart';

final t = AppState();

class AppState extends ChangeNotifier {
  AppState() {
    /// get current anime season.
    var now = DateTime.now();
    final (currentYear, currentSeason) = AnimeSeasonUtil.getAnimeSeasonByDataTime(now);

    final preferences = AnimeTrackerPreferences();
    final (savedAnimeYear, savedAnimeSeason) = (preferences.getCurrentSeasonYear(), preferences.getCurrentSeason());

    /// judge if need to show suggest anime board.
    if (currentYear != savedAnimeYear || currentSeason != savedAnimeSeason) {

    }
  }
}

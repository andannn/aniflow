import 'package:anime_tracker/core/shared_preference/user_data.dart';
import 'ani_list_repository.dart';

abstract class UserDataRepository {
  AnimeSeasonParam getAnimeSeasonParam();

  Future setAnimeSeasonParam(AnimeSeasonParam param);

  DateTime? getLastSuccessSyncTime();

  Future setLastSuccessSync(DateTime time);
}

class UserDataRepositoryImpl implements UserDataRepository {
  final AnimeTrackerPreferences preferences;

  UserDataRepositoryImpl(this.preferences);

  @override
  AnimeSeasonParam getAnimeSeasonParam() {
    final seasonYear = preferences.getCurrentSeasonYear();
    final season = preferences.getCurrentSeason();

    return AnimeSeasonParam(seasonYear: seasonYear, season: season);
  }

  @override
  Future setAnimeSeasonParam(AnimeSeasonParam param) async {
    await preferences.setCurrentSeason(param.season);
    await preferences.setCurrentSeasonYear(param.seasonYear);
  }

  @override
  DateTime? getLastSuccessSyncTime() => preferences.getLastSuccessSync();

  @override
  Future setLastSuccessSync(DateTime time) =>
      preferences.setLastSuccessSync(time);
}

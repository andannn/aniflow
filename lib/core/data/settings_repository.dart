import 'dart:async';

import 'package:aniflow/core/common/definitions/anime_season.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/setting/theme_setting.dart';
import 'package:aniflow/core/firebase/firebase_analytics_util.dart';
import 'package:aniflow/core/shared_preference/user_data_preferences.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SettingsRepository {
  SettingsRepository(this.preferences);

  final UserDataPreferences preferences;

  AnimeSeasonParam getAnimeSeasonParam() {
    final seasonYear = preferences.userData.seasonYear;
    final season = preferences.userData.season;

    return AnimeSeasonParam(seasonYear: seasonYear, season: season);
  }

  Future setAnimeSeasonParam(AnimeSeasonParam param) async {
    await preferences.setAnimeSeason(param.season);
    await preferences.setSeasonYear(param.seasonYear);
  }

  Stream<MediaType> getMediaTypeStream() =>
      preferences.userDataStream.map((event) => event.mediaType);

  Future setMediaType(MediaType type) async {
    await preferences.setMediaType(type);

    unawaited(FirebaseAnalytics.instance.setUserMediaContentProperty(type));
  }

  MediaType getMediaType() => preferences.userData.mediaType;

  Stream<ThemeSetting> getThemeSettingStream() =>
      preferences.userDataStream.map((event) => event.themeSetting);

  Future setThemeSetting(ThemeSetting setting) =>
      preferences.setThemeSetting(setting);
}

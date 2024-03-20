import 'dart:async';

import 'package:aniflow/core/common/definitions/anime_season.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/setting/theme_setting.dart';
import 'package:aniflow/core/firebase/firebase_analytics_util.dart';
import 'package:aniflow/core/shared_preference/aniflow_preferences.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class SettingsRepository {
  final AniFlowPreferences preferences = AniFlowPreferences();

  AnimeSeasonParam getAnimeSeasonParam() {
    final seasonYear = preferences.seasonYear.value;
    final season = preferences.season.value;

    return AnimeSeasonParam(seasonYear: seasonYear, season: season);
  }

  Future setAnimeSeasonParam(AnimeSeasonParam param) async {
    await preferences.season.setValue(param.season);
    await preferences.seasonYear.setValue(param.seasonYear);
  }

  Stream<MediaType> getMediaTypeStream() => preferences.mediaType;

  Future setMediaType(MediaType type) async {
    await preferences.mediaType.setValue(type);

    unawaited(FirebaseAnalytics.instance.setUserMediaContentProperty(type));
  }

  MediaType getMediaType() => preferences.mediaType.value;

  Stream<ThemeSetting> getThemeSettingStream() => preferences.themeSetting;

  Future setThemeSetting(ThemeSetting setting) =>
      preferences.themeSetting.setValue(setting);
}

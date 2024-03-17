import 'dart:async';

import 'package:aniflow/core/common/definitions/anime_season.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/setting/theme_setting.dart';
import 'package:aniflow/core/firebase/firebase_analytics_util.dart';
import 'package:aniflow/core/shared_preference/aniflow_preferences.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

abstract class SettingsRepository {
  AnimeSeasonParam getAnimeSeasonParam();

  Future setAnimeSeasonParam(AnimeSeasonParam param);

  Stream<MediaType> getMediaTypeStream();

  MediaType getMediaType();

  Future setMediaType(MediaType type);

  Stream<ThemeSetting> getThemeSettingStream();

  Future setThemeSetting(ThemeSetting setting);
}

class SettingsRepositoryImpl implements SettingsRepository {
  final AniFlowPreferences preferences = AniFlowPreferences();

  @override
  AnimeSeasonParam getAnimeSeasonParam() {
    final seasonYear = preferences.seasonYear.value;
    final season = preferences.season.value;

    return AnimeSeasonParam(seasonYear: seasonYear, season: season);
  }

  @override
  Future setAnimeSeasonParam(AnimeSeasonParam param) async {
    await preferences.season.setValue(param.season);
    await preferences.seasonYear.setValue(param.seasonYear);
  }

  @override
  Stream<MediaType> getMediaTypeStream() =>
      preferences.mediaType;

  @override
  Future setMediaType(MediaType type) async {
    await preferences.mediaType.setValue(type);

    unawaited(FirebaseAnalytics.instance.setUserMediaContentProperty(type));
  }

  @override
  MediaType getMediaType() => preferences.mediaType.value;

  @override
  Stream<ThemeSetting> getThemeSettingStream() =>
      preferences.themeSetting;

  @override
  Future setThemeSetting(ThemeSetting setting) =>
      preferences.themeSetting.setValue(setting);
}

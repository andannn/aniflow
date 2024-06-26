import 'dart:async';

import 'package:aniflow/core/common/definitions/activity_filter_type.dart';
import 'package:aniflow/core/common/definitions/activity_scope_category.dart';
import 'package:aniflow/core/common/definitions/ani_list_settings.dart';
import 'package:aniflow/core/common/definitions/anime_season.dart';
import 'package:aniflow/core/common/definitions/home_sector_category.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/setting/theme_setting.dart';
import 'package:aniflow/core/data/model/home_sector_model.dart';
import 'package:aniflow/core/data/model/user_data_model.dart';
import 'package:aniflow/core/firebase/analytics/firebase_analytics_util.dart';
import 'package:aniflow/core/firebase/remote_config/remote_config_manager.dart';
import 'package:aniflow/core/shared_preference/user_data_preferences.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@lazySingleton
class UserDataRepository {
  UserDataRepository(this._preferences, this._remoteConfigManager);

  final UserDataPreferences _preferences;
  final RemoteConfigManager _remoteConfigManager;

  Stream<UserDataModel> get userDataStream => _preferences.userDataStream;

  Stream<List<HomeSectorCategory>> get homeSectorsStream =>
      CombineLatestStream.combine2(
        _homeStructModelStream,
        userDataStream.map((e) => e.mediaType).distinct(),
        (sector, currentMediaType) => switch (currentMediaType) {
          MediaType.anime => sector.animeSectors,
          MediaType.manga => sector.mangaSectors,
        },
      );

  Stream<HomeSectorModel> get _homeStructModelStream =>
      _remoteConfigManager.getHomeStructStream().map((e) => e.toModel());

  UserDataModel get userData => _preferences.userData;

  Future setActivityFilterType(ActivityFilterType category) =>
      _preferences.setActivityFilterType(category);

  Future setActivityScopeCategory(ActivityScopeCategory scopeCategory) =>
      _preferences.setActivityScopeCategory(scopeCategory);

  Future setAniListSettings(AniListSettings setting) =>
      _preferences.setAniListSettings(setting);

  Future setAnimeSeason(AnimeSeason season) =>
      _preferences.setAnimeSeason(season);

  Future setAuthExpiredTime(DateTime? dateTime) =>
      _preferences.setAuthExpiredTime(dateTime);

  Future setAuthToken(String? authToken) =>
      _preferences.setAuthToken(authToken);

  Future setAuthedUserId(String? userId) =>
      _preferences.setAuthedUserId(userId);

  Future setIsShowReleaseOnly(bool showReleasedOnly) =>
      _preferences.setIsShowReleaseOnly(showReleasedOnly);

  Future setMediaType(MediaType mediaType) async {
    await _preferences.setMediaType(mediaType);
    unawaited(
        FirebaseAnalytics.instance.setUserMediaContentProperty(mediaType));
  }

  Future setSeasonYear(int seasonYear) =>
      _preferences.setSeasonYear(seasonYear);

  Future setThemeSetting(ThemeSetting setting) =>
      _preferences.setThemeSetting(setting);

  AnimeSeasonParam getAnimeSeasonParam() {
    final seasonYear = _preferences.userData.seasonYear;
    final season = _preferences.userData.season;

    return AnimeSeasonParam(seasonYear: seasonYear, season: season);
  }

  Future setAnimeSeasonParam(AnimeSeasonParam param) async {
    await _preferences.setAnimeSeason(param.season);
    await _preferences.setSeasonYear(param.seasonYear);
  }

  Future addNotificationId(String id) async {
    await _preferences.addNotificationId(id);
  }

  Future clearNotificationId() async {
    await _preferences.clearNotificationId();
  }
}

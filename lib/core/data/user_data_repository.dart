import 'dart:async';

import 'package:aniflow/core/common/definitions/activity_filter_type.dart';
import 'package:aniflow/core/common/definitions/activity_scope_category.dart';
import 'package:aniflow/core/common/definitions/anime_season.dart';
import 'package:aniflow/core/common/definitions/home_sector_category.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/definitions/track_list_filter.dart';
import 'package:aniflow/core/common/setting/score_format.dart';
import 'package:aniflow/core/common/setting/theme_setting.dart';
import 'package:aniflow/core/common/setting/user_staff_name_language.dart';
import 'package:aniflow/core/common/setting/user_title_language.dart';
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

  UserTitleLanguage get userTitleLanguage =>
      _preferences.userData.userTitleLanguage;

  String? get authedUserId => _preferences.userData.authedUserId;

  List<String> get sentNotificationIds =>
      _preferences.userData.sentNotificationIds;

  UserStaffNameLanguage get userStaffNameLanguage =>
      _preferences.userData.userStaffNameLanguage;

  AnimeSeason get season => _preferences.userData.season;

  MediaType get mediaType => _preferences.userData.mediaType;

  ScoreFormat get scoreFormat => _preferences.userData.scoreFormat;

  Stream<ScoreFormat> get scoreFormatStream =>
      _preferences.userDataStream.map((data) => data.scoreFormat).distinct();

  Stream<MediaType> get mediaTypeStream =>
      _preferences.userDataStream.map((data) => data.mediaType).distinct();

  Stream<ThemeSetting> get themeSettingStream =>
      _preferences.userDataStream.map((data) => data.themeSetting).distinct();

  Stream<UserTitleLanguage> get titleLanguageStream =>
      _preferences.userDataStream
          .map((data) => data.userTitleLanguage)
          .distinct();

  Stream<UserStaffNameLanguage> get staffLanguageStream =>
      _preferences.userDataStream
          .map((data) => data.userStaffNameLanguage)
          .distinct();

  int get seasonYear => _preferences.userData.seasonYear;

  bool get isAdultContentsFeatureEnabled =>
      _remoteConfigManager.isAdultContentsFeatureEnabled();

  bool get displayAdultContent =>
      isAdultContentsFeatureEnabled &&
      _preferences.userData.displayAdultContent;

  Stream<bool> get displayAdultContentStream => isAdultContentsFeatureEnabled
      ? _preferences.userDataStream
          .map((data) => data.aniListSettings.displayAdultContent)
          .distinct()
      : Stream.value(false);

  Stream<HomeSectorModel> get _homeStructModelStream =>
      _remoteConfigManager.getHomeStructStream().map((e) => e.toModel());

  Stream<bool> get isHiAnimationFeatureEnabledStream =>
      _remoteConfigManager.isHiAnimationFeatureEnabledStream();

  Stream<bool> get isSocialFeatureEnabledStream =>
      _remoteConfigManager.isSocialFeatureEnabledStream();

  Future setActivityFilterType(ActivityFilterType category) =>
      _preferences.setActivityFilterType(category);

  Future setActivityScopeCategory(ActivityScopeCategory scopeCategory) =>
      _preferences.setActivityScopeCategory(scopeCategory);

  Future setAnimeSeason(AnimeSeason season) =>
      _preferences.setAnimeSeason(season);

  Future setAuthExpiredTime(DateTime? dateTime) =>
      _preferences.setAuthExpiredTime(dateTime);

  Future setAuthToken(String? authToken) =>
      _preferences.setAuthToken(authToken);

  Future setAuthedUserId(String? userId) =>
      _preferences.setAuthedUserId(userId);

  Future setTrackListFilter(TrackListFilter trackListFilter) =>
      _preferences.setTrackListFilter(trackListFilter);

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

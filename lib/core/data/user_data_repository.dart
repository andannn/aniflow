import 'dart:async';
import 'dart:io';

import 'package:aniflow/app/di/env.dart';
import 'package:aniflow/core/common/definitions/activity_filter_type.dart';
import 'package:aniflow/core/common/definitions/activity_scope_category.dart';
import 'package:aniflow/core/common/definitions/anime_season.dart';
import 'package:aniflow/core/common/definitions/home_sector_category.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/definitions/refresh_time_key.dart';
import 'package:aniflow/core/common/definitions/track_list_filter.dart';
import 'package:aniflow/core/common/dialog/dialog_type.dart';
import 'package:aniflow/core/common/environment/build_environment.dart';
import 'package:aniflow/core/common/setting/score_format.dart';
import 'package:aniflow/core/common/setting/theme_setting.dart';
import 'package:aniflow/core/common/setting/user_staff_name_language.dart';
import 'package:aniflow/core/common/setting/user_title_language.dart';
import 'package:aniflow/core/common/util/app_version_util.dart';
import 'package:aniflow/core/data/model/home_sector_model.dart';
import 'package:aniflow/core/data/model/user_data_model.dart';
import 'package:aniflow/core/database/dao/github_release_dao.dart';
import 'package:aniflow/core/firebase/analytics/firebase_analytics_util.dart';
import 'package:aniflow/core/firebase/remote_config/remote_config_manager.dart';
import 'package:aniflow/core/shared_preference/user_data_preferences.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@LazySingleton(env: [AfEnvironment.mobile, AfEnvironment.desktop])
class UserDataRepository {
  UserDataRepository(
      this._preferences, this._remoteConfigManager, this._githubReleaseDao);

  final UserDataPreferences _preferences;
  final RemoteConfigManager _remoteConfigManager;
  final GithubReleaseDao _githubReleaseDao;

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

  bool get isGithubLinkFeatureEnabled =>
      _remoteConfigManager.isGithubLinkFeatureEnabled();

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

  Stream<bool> get useInAppPlayerStream =>
      _preferences.userDataStream.map((data) => data.useInAppPlayer).distinct();

  bool get useInAppPlayer => _preferences.userData.useInAppPlayer;

  bool get isAppUpdateDialogFeatureEnabled =>
      Platform.isAndroid && !BuildEnvironment.isFeatureLimited;

  Stream<AppVersion?> get latestAppVersion =>
      _githubReleaseDao.getLatestReleasePackages().map((e) {
        if (e == null) {
          return null;
        }
        return AppVersion.parse(e.tagName);
      });

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

  Future<AppVersion?> updateAndGetLatestAppVersion() {
    return _remoteConfigManager.refreshAndGetLatestAppVersion();
  }

  bool canRefresh(RefreshTimeKey key) {
    final lastRefreshTime = _preferences.getLastSuccessRefreshTime(key);
    if (lastRefreshTime == null) {
      // If there is no last refresh time, it is possible to refresh.
      return true;
    }

    final now = DateTime.now();
    if (now.day != lastRefreshTime.day) {
      // If the last refresh time is not today, it is possible to refresh.
      return true;
    }

    final diff = now.difference(lastRefreshTime);
    // If the last refresh time is larger than the refresh interval,
    // it is possible to refresh.
    return diff.inMinutes >= key.refreshIntervalInMinutes;
  }

  Future setLastSuccessRefreshTime(RefreshTimeKey key, DateTime time) =>
      _preferences.setLastSuccessRefreshTime(key, time);

  Future setDialogClosedTime(DialogType key, DateTime time) =>
      _preferences.setDialogClosedTime(key, time);

  Future setUseInAppPlayer(bool isOn) => _preferences.setIsUseInAppPlayer(isOn);

  bool canShowDialog(DialogType key) {
    final lastShowTime = _preferences.getDialogClosedTime(key);
    if (lastShowTime == null) {
      // If there is no last show time, it is possible to show dialog.
      return true;
    }

    return false;
  }
}

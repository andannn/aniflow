import 'dart:convert';

import 'package:aniflow/core/common/definitions/activity_filter_type.dart';
import 'package:aniflow/core/common/definitions/activity_scope_category.dart';
import 'package:aniflow/core/common/definitions/ani_list_settings.dart';
import 'package:aniflow/core/common/definitions/anime_season.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/setting/theme_setting.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin _UserDataKey {
  static const currentSeasonYear = "current_season_year";
  static const currentSeason = "current_season";
  static const authToken = "auth_token";
  static const authExpiredTime = "auth_expired_time";
  static const authedUserId = "authed_userId";

  /// [MediaType]
  static const currentMediaType = "currentMediaType";

  /// [ActivityScopeCategory]
  static const activityScope = "activity_scope";

  /// [ActivityFilterType]
  static const activityFilter = "activity_filter";

  /// ani-list settings. [AniListSettings]
  static const aniListSettingsKey = 'ani_list_settings_key';

  static const showReleasedOnlyKey = 'show_released_only_key';

  static const themeSettingKey = 'theme_setting_key';
}

@injectable
class AfPreferences {
  AfPreferences(this._preferences);

  final SharedPreferences _preferences;

  MediaType get mediaType => MediaType.fromJson(
        _preferences.getString(_UserDataKey.currentMediaType) ??
            MediaType.anime.toJson(),
      );

  Future setMediaType(MediaType mediaType) =>
      _preferences.setString(_UserDataKey.currentMediaType, mediaType.toJson());

  AnimeSeason get season {
    final seasonString =
        _preferences.getString(_UserDataKey.currentSeason) ?? '';
    return AnimeSeason.values.firstWhere((e) => e.toString() == seasonString,
        orElse: () => AnimeSeason.spring);
  }

  Future setAnimeSeason(AnimeSeason season) =>
      _preferences.setString(_UserDataKey.currentSeason, season.toString());

  int get seasonYear =>
      _preferences.getInt(_UserDataKey.currentSeasonYear) ?? -1;

  Future setSeasonYear(int seasonYear) =>
      _preferences.setInt(_UserDataKey.currentSeasonYear, seasonYear);

  ThemeSetting get themeSetting {
    return ThemeSetting.fromJson(
            _preferences.getString(_UserDataKey.themeSettingKey)) ??
        ThemeSetting.system;
  }

  Future setThemeSetting(ThemeSetting setting) =>
      _preferences.setString(_UserDataKey.themeSettingKey, setting.toJson());

  bool get isShowReleaseOnly =>
      _preferences.getBool(_UserDataKey.showReleasedOnlyKey) ?? false;

  Future setIsShowReleaseOnly(bool showReleasedOnly) =>
      _preferences.setBool(_UserDataKey.showReleasedOnlyKey, showReleasedOnly);

  ActivityScopeCategory get activityScopeCategory {
    return ActivityScopeCategory.fromJson(
        _preferences.getString(_UserDataKey.activityScope) ??
            ActivityScopeCategory.global.toJson());
  }

  Future setActivityScopeCategory(ActivityScopeCategory scopeCategory) =>
      _preferences.setString(
          _UserDataKey.activityScope, scopeCategory.toJson());

  ActivityFilterType get activityFilterType {
    return ActivityFilterType.fromJson(
        _preferences.getString(_UserDataKey.activityFilter) ??
            ActivityFilterType.all.toJson());
  }

  Future setActivityFilterType(ActivityFilterType category) =>
      _preferences.setString(_UserDataKey.activityFilter, category.toJson());

  String? get authedUserId {
    return _preferences.getString(_UserDataKey.authedUserId);
  }

  Future setAuthedUserId(String? userId) async {
    if (userId == null) {
      await _preferences.remove(_UserDataKey.authedUserId);
    } else {
      await _preferences.setString(_UserDataKey.authedUserId, userId);
    }
  }

  String? get authToken {
    return _preferences.getString(_UserDataKey.authToken);
  }

  Future setAuthToken(String? authToken) async {
    if (authToken != null) {
      return _preferences.setString(_UserDataKey.authToken, authToken);
    } else {
      return _preferences.remove(_UserDataKey.authToken);
    }
  }

  AniListSettings get aniListSettings {
    final jsonString =
        _preferences.getString(_UserDataKey.aniListSettingsKey) ?? '{}';
    return AniListSettings.fromJson(jsonDecode(jsonString));
  }

  Future setAniListSettings(AniListSettings setting) async {
    return _preferences.setString(
        _UserDataKey.aniListSettingsKey, jsonEncode(setting.toJson()));
  }

  DateTime? get authExpiredTime {
    final result = _preferences.getString(_UserDataKey.authExpiredTime) ?? '';
    return DateTime.tryParse(result);
  }

  Future setAuthExpiredTime(DateTime? dateTime) async {
    if (dateTime != null) {
      return _preferences.setString(
          _UserDataKey.authExpiredTime, dateTime.toIso8601String());
    } else {
      return _preferences.remove(_UserDataKey.authExpiredTime);
    }
  }
}

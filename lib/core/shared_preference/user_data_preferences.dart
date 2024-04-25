import 'dart:async';
import 'dart:convert';

import 'package:aniflow/core/common/definitions/activity_filter_type.dart';
import 'package:aniflow/core/common/definitions/activity_scope_category.dart';
import 'package:aniflow/core/common/definitions/ani_list_settings.dart';
import 'package:aniflow/core/common/definitions/anime_season.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/setting/theme_setting.dart';
import 'package:aniflow/core/common/util/change_notifier_util.dart';
import 'package:aniflow/core/common/util/stream_util.dart';
import 'package:aniflow/core/data/model/user_data_model.dart';
import 'package:flutter/cupertino.dart';
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
class UserDataPreferences {
  UserDataPreferences(this._preferences);

  final SharedPreferences _preferences;

  final _changeNotifier = ValueNotifier(0);

  UserDataModel get userData {
    final settings = _aniListSettings;
    return UserDataModel(
      mediaType: _mediaType,
      season: _season,
      seasonYear: _seasonYear,
      themeSetting: _themeSetting,
      isShowReleaseOnly: _isShowReleaseOnly,
      activityScopeCategory: _activityScopeCategory,
      activityFilterType: _activityFilterType,
      authedUserId: _authedUserId,
      authToken: _authToken,
      authExpiredTime: _authExpiredTime,
      displayAdultContent: settings.displayAdultContent,
      userTitleLanguage: settings.userTitleLanguage,
      userStaffNameLanguage: settings.userStaffNameLanguage,
      scoreFormat: settings.scoreFormat,
    );
  }

  Stream<UserDataModel> get userDataStream => StreamUtil.createStream(
        _changeNotifier,
        () => Future.value(userData),
      );

  MediaType get _mediaType => MediaType.fromJson(
        _preferences.getString(_UserDataKey.currentMediaType) ??
            MediaType.anime.toJson(),
      );

  Future setMediaType(MediaType mediaType) async {
    await _preferences.setString(
        _UserDataKey.currentMediaType, mediaType.toJson());
    _changeNotifier.notifyChanged();
  }

  AnimeSeason get _season {
    final seasonString =
        _preferences.getString(_UserDataKey.currentSeason) ?? '';
    return AnimeSeason.values.firstWhere((e) => e.toString() == seasonString,
        orElse: () => AnimeSeason.spring);
  }

  Future setAnimeSeason(AnimeSeason season) async {
    await _preferences.setString(_UserDataKey.currentSeason, season.toString());
    _changeNotifier.notifyChanged();
  }

  int get _seasonYear =>
      _preferences.getInt(_UserDataKey.currentSeasonYear) ?? -1;

  Future setSeasonYear(int seasonYear) async {
    await _preferences.setInt(_UserDataKey.currentSeasonYear, seasonYear);
    _changeNotifier.notifyChanged();
  }

  ThemeSetting get _themeSetting {
    return ThemeSetting.fromJson(
            _preferences.getString(_UserDataKey.themeSettingKey)) ??
        ThemeSetting.system;
  }

  Future setThemeSetting(ThemeSetting setting) async {
    await _preferences.setString(
        _UserDataKey.themeSettingKey, setting.toJson());
    _changeNotifier.notifyChanged();
  }

  bool get _isShowReleaseOnly =>
      _preferences.getBool(_UserDataKey.showReleasedOnlyKey) ?? false;

  Future setIsShowReleaseOnly(bool showReleasedOnly) async {
    await _preferences.setBool(
        _UserDataKey.showReleasedOnlyKey, showReleasedOnly);
    _changeNotifier.notifyChanged();
  }

  ActivityScopeCategory get _activityScopeCategory {
    return ActivityScopeCategory.fromJson(
        _preferences.getString(_UserDataKey.activityScope) ??
            ActivityScopeCategory.global.toJson());
  }

  Future setActivityScopeCategory(ActivityScopeCategory scopeCategory) async {
    await _preferences.setString(
        _UserDataKey.activityScope, scopeCategory.toJson());
    _changeNotifier.notifyChanged();
  }

  ActivityFilterType get _activityFilterType {
    return ActivityFilterType.fromJson(
        _preferences.getString(_UserDataKey.activityFilter) ??
            ActivityFilterType.all.toJson());
  }

  Future setActivityFilterType(ActivityFilterType category) async {
    await _preferences.setString(
        _UserDataKey.activityFilter, category.toJson());
    _changeNotifier.notifyChanged();
  }

  String? get _authedUserId {
    return _preferences.getString(_UserDataKey.authedUserId);
  }

  Future setAuthedUserId(String? userId) async {
    if (userId == null) {
      await _preferences.remove(_UserDataKey.authedUserId);
    } else {
      await _preferences.setString(_UserDataKey.authedUserId, userId);
    }
    _changeNotifier.notifyChanged();
  }

  String? get _authToken {
    return _preferences.getString(_UserDataKey.authToken);
  }

  Future setAuthToken(String? authToken) async {
    if (authToken != null) {
      await _preferences.setString(_UserDataKey.authToken, authToken);
    } else {
      await _preferences.remove(_UserDataKey.authToken);
    }
    _changeNotifier.notifyChanged();
  }

  AniListSettings get _aniListSettings {
    final jsonString =
        _preferences.getString(_UserDataKey.aniListSettingsKey) ?? '{}';
    return AniListSettings.fromJson(jsonDecode(jsonString));
  }

  Future setAniListSettings(AniListSettings setting) async {
    await _preferences.setString(
        _UserDataKey.aniListSettingsKey, jsonEncode(setting.toJson()));
    _changeNotifier.notifyChanged();
  }

  DateTime? get _authExpiredTime {
    final result = _preferences.getString(_UserDataKey.authExpiredTime) ?? '';
    return DateTime.tryParse(result);
  }

  Future setAuthExpiredTime(DateTime? dateTime) async {
    if (dateTime != null) {
      await _preferences.setString(
          _UserDataKey.authExpiredTime, dateTime.toIso8601String());
    } else {
      await _preferences.remove(_UserDataKey.authExpiredTime);
    }
    _changeNotifier.notifyChanged();
  }
}

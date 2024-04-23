import 'dart:async';
import 'dart:convert';

import 'package:aniflow/core/common/definitions/activity_filter_type.dart';
import 'package:aniflow/core/common/definitions/activity_scope_category.dart';
import 'package:aniflow/core/common/definitions/ani_list_settings.dart';
import 'package:aniflow/core/common/definitions/anime_season.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/setting/theme_setting.dart';
import 'package:aniflow/core/shared_preference/state_stream.dart';
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

@lazySingleton
class AniFlowPreferences {
  AniFlowPreferences();

  late SharedPreferences _preference;
  late MutableStateStream<MediaType> mediaType;
  late MutableStateStream<AnimeSeason> season;
  late MutableStateStream<int> seasonYear;
  late MutableStateStream<ThemeSetting> themeSetting;
  late MutableStateStream<bool> isShowReleaseOnly;
  late MutableStateStream<ActivityScopeCategory> activityScopeCategory;
  late MutableStateStream<ActivityFilterType> activityFilterType;
  late MutableStateStream<String?> authedUserId;
  late MutableStateStream<String?> authToken;
  late MutableStateStream<AniListSettings> aniListSettings;
  late MutableStateStream<DateTime?> authExpiredTime;

  Future init() async {
    _preference = await SharedPreferences.getInstance();

    mediaType = MutableStateStream.create(
      onGetValue: () => MediaType.fromJson(
        _preference.getString(_UserDataKey.currentMediaType) ??
            MediaType.anime.toJson(),
      ),
      onSetValue: (mediaType) => _preference.setString(
          _UserDataKey.currentMediaType, mediaType.toJson()),
    );

    season = MutableStateStream.create(
      onGetValue: () {
        final seasonString =
            _preference.getString(_UserDataKey.currentSeason) ?? '';
        return AnimeSeason.values.firstWhere(
            (e) => e.toString() == seasonString,
            orElse: () => AnimeSeason.spring);
      },
      onSetValue: (season) =>
          _preference.setString(_UserDataKey.currentSeason, season.toString()),
    );

    seasonYear = MutableStateStream.create(
      onGetValue: () {
        return _preference.getInt(_UserDataKey.currentSeasonYear) ?? -1;
      },
      onSetValue: (seasonYear) =>
          _preference.setInt(_UserDataKey.currentSeasonYear, seasonYear),
    );

    themeSetting = MutableStateStream.create(
      onGetValue: () {
        return ThemeSetting.fromJson(
                _preference.getString(_UserDataKey.themeSettingKey)) ??
            ThemeSetting.system;
      },
      onSetValue: (setting) =>
          _preference.setString(_UserDataKey.themeSettingKey, setting.toJson()),
    );

    isShowReleaseOnly = MutableStateStream.create(
      onGetValue: () {
        return _preference.getBool(_UserDataKey.showReleasedOnlyKey) ?? false;
      },
      onSetValue: (showReleasedOnly) => _preference.setBool(
          _UserDataKey.showReleasedOnlyKey, showReleasedOnly),
    );

    activityScopeCategory = MutableStateStream.create(
      onGetValue: () {
        return ActivityScopeCategory.fromJson(
            _preference.getString(_UserDataKey.activityScope) ??
                ActivityScopeCategory.global.toJson());
      },
      onSetValue: (category) =>
          _preference.setString(_UserDataKey.activityScope, category.toJson()),
    );

    activityFilterType = MutableStateStream.create(
      onGetValue: () {
        return ActivityFilterType.fromJson(
            _preference.getString(_UserDataKey.activityFilter) ??
                ActivityFilterType.all.toJson());
      },
      onSetValue: (category) =>
          _preference.setString(_UserDataKey.activityFilter, category.toJson()),
    );

    authedUserId = MutableStateStream.create(onGetValue: () {
      return _preference.getString(_UserDataKey.authedUserId);
    }, onSetValue: (userId) async {
      if (userId == null) {
        await _preference.remove(_UserDataKey.authedUserId);
      } else {
        await _preference.setString(_UserDataKey.authedUserId, userId);
      }
    });

    authToken = MutableStateStream.create(
      onGetValue: () {
        return _preference.getString(_UserDataKey.authToken);
      },
      onSetValue: (authToken) async {
        if (authToken != null) {
          return _preference.setString(_UserDataKey.authToken, authToken);
        } else {
          return _preference.remove(_UserDataKey.authToken);
        }
      },
    );

    aniListSettings = MutableStateStream.create(
      onGetValue: () {
        final jsonString =
            _preference.getString(_UserDataKey.aniListSettingsKey) ?? '{}';
        return AniListSettings.fromJson(jsonDecode(jsonString));
      },
      onSetValue: (setting) async {
        return _preference.setString(
            _UserDataKey.aniListSettingsKey, jsonEncode(setting.toJson()));
      },
    );

    authExpiredTime = MutableStateStream.create(
      onGetValue: () {
        final result =
            _preference.getString(_UserDataKey.authExpiredTime) ?? '';
        return DateTime.tryParse(result);
      },
      onSetValue: (dateTime) async {
        if (dateTime != null) {
          return _preference.setString(
              _UserDataKey.authExpiredTime, dateTime.toIso8601String());
        } else {
          return _preference.remove(_UserDataKey.authExpiredTime);
        }
      },
    );
  }
}

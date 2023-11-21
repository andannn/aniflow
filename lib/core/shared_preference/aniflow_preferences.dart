import 'dart:async';
import 'dart:convert';

import 'package:aniflow/core/common/model/activity_filter_type.dart';
import 'package:aniflow/core/common/model/activity_scope_category.dart';
import 'package:aniflow/core/common/model/ani_list_settings.dart';
import 'package:aniflow/core/common/model/anime_season.dart';
import 'package:aniflow/core/common/model/media_type.dart';
import 'package:aniflow/core/common/util/change_notifier_util.dart';
import 'package:aniflow/core/common/util/stream_util.dart';
import 'package:flutter/foundation.dart';
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
}

class AniFlowPreferences {
  static AniFlowPreferences? _instance;

  factory AniFlowPreferences() => _instance ??= AniFlowPreferences._();

  AniFlowPreferences._();

  late SharedPreferences _preference;

  final _mediaTypeChangeNotifier = ValueNotifier(0);
  final _activityScopeChangeNotifier = ValueNotifier(0);
  final _activityFilterChangeNotifier = ValueNotifier(0);
  final _userIdChangeNotifier = ValueNotifier(0);
  final _aniListSettingChangeNotifier = ValueNotifier(0);
  final _showReleasedOnlyChangeNotifier = ValueNotifier(0);

  Future init() async {
    _preference = await SharedPreferences.getInstance();
  }

  Future setCurrentSeason(AnimeSeason season) {
    return _preference.setString(_UserDataKey.currentSeason, season.toString());
  }

  AnimeSeason getCurrentSeason() {
    final seasonString =
        _preference.getString(_UserDataKey.currentSeason) ?? '';
    return AnimeSeason.values.firstWhere((e) => e.toString() == seasonString,
        orElse: () => AnimeSeason.spring);
  }

  Future setCurrentSeasonYear(int seasonYear) {
    return _preference.setInt(_UserDataKey.currentSeasonYear, seasonYear);
  }

  int getCurrentSeasonYear() {
    return _preference.getInt(_UserDataKey.currentSeasonYear) ?? -1;
  }

  Future setAuthToken(String? authToken) {
    if (authToken != null) {
      return _preference.setString(_UserDataKey.authToken, authToken);
    } else {
      return _preference.remove(_UserDataKey.authToken);
    }
  }

  String getAuthToken() {
    return _preference.getString(_UserDataKey.authToken) ?? '';
  }

  Future setAuthExpiredTime(DateTime? dateTime) {
    if (dateTime != null) {
      return _preference.setString(
          _UserDataKey.authExpiredTime, dateTime.toIso8601String());
    } else {
      return _preference.remove(_UserDataKey.authExpiredTime);
    }
  }

  DateTime? getAuthExpiredTime() {
    final result = _preference.getString(_UserDataKey.authExpiredTime) ?? '';
    return DateTime.tryParse(result);
  }

  MediaType getCurrentMediaType() => MediaType.fromString(
        _preference.getString(_UserDataKey.currentMediaType) ??
            MediaType.anime.jsonString,
      );

  Stream<MediaType> getCurrentMediaTypeStream() => StreamUtil.createStream(
        _mediaTypeChangeNotifier,
        () => Future(() => getCurrentMediaType()),
      );

  Future setCurrentMediaType(MediaType mediaType) async {
    final isChanged = await _preference.setString(
        _UserDataKey.currentMediaType, mediaType.jsonString);

    if (isChanged) {
      _mediaTypeChangeNotifier.notifyChanged();
    }
  }

  Future setActivityScopeCategory(ActivityScopeCategory category) async {
    final isChanged = await _preference.setString(
        _UserDataKey.activityScope, category.toJson());

    if (isChanged) {
      _activityScopeChangeNotifier.notifyChanged();
    }
  }

  ActivityScopeCategory getActivityScopeCategory() {
    return ActivityScopeCategory.fromJson(
        _preference.getString(_UserDataKey.activityScope) ??
            ActivityScopeCategory.global.toJson());
  }

  Stream<ActivityScopeCategory> getActivityScopeCategoryStream() =>
      StreamUtil.createStream(
        _activityScopeChangeNotifier,
        () => Future(() => getActivityScopeCategory()),
      );

  Future setActivityFilterType(ActivityFilterType category) async {
    final isChanged = await _preference.setString(
        _UserDataKey.activityFilter, category.toJson());

    if (isChanged) {
      _activityFilterChangeNotifier.notifyChanged();
    }
  }

  ActivityFilterType getActivityFilterType() {
    return ActivityFilterType.fromJson(
        _preference.getString(_UserDataKey.activityFilter) ??
            ActivityFilterType.all.toJson());
  }

  Stream<ActivityFilterType> getActivityFilterTypeStream() =>
      StreamUtil.createStream(
        _activityFilterChangeNotifier,
        () => Future(() => getActivityFilterType()),
      );

  Future setAuthedUserId(String userId) async {
    bool isChanged =
        await _preference.setString(_UserDataKey.authedUserId, userId);

    if (isChanged) {
      _userIdChangeNotifier.notifyChanged();
    }
  }

  Future clearAuthedUserId() async {
    await _preference.remove(_UserDataKey.authedUserId);
    _userIdChangeNotifier.notifyChanged();
  }

  String? getAuthedUserId() => _preference.getString(_UserDataKey.authedUserId);

  Stream<String?> getAuthedUserStream() => StreamUtil.createStream(
      _userIdChangeNotifier, () => Future.value(getAuthedUserId()));

  Future setAniListSettings(AniListSettings setting) async {
    bool isChanged = await _preference.setString(
        _UserDataKey.aniListSettingsKey, jsonEncode(setting.toJson()));
    if (isChanged) {
      _aniListSettingChangeNotifier.notifyChanged();
    }
  }

  AniListSettings getAniListSettings() {
    final jsonString =
        _preference.getString(_UserDataKey.aniListSettingsKey) ?? '{}';
    return AniListSettings.fromJson(jsonDecode(jsonString));
  }

  Stream<AniListSettings> getAniListSettingsStream() {
    return StreamUtil.createStream(_aniListSettingChangeNotifier,
        () => Future.value(getAniListSettings()));
  }

  Future setIsShowReleaseOnly(bool showReleasedOnly) async {
    bool isChanged = await _preference.setBool(
        _UserDataKey.showReleasedOnlyKey, showReleasedOnly);
    if (isChanged) {
      _showReleasedOnlyChangeNotifier.notifyChanged();
    }
  }

  bool getIsShowReleaseOnly() {
    return _preference.getBool(_UserDataKey.showReleasedOnlyKey) ?? false;
  }

  Stream<bool> getIsShowReleaseOnlyStream() {
    return StreamUtil.createStream(_showReleasedOnlyChangeNotifier,
        () => Future.value(getIsShowReleaseOnly()));
  }
}

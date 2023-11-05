import 'dart:async';
import 'package:aniflow/core/common/model/activity_filter_type.dart';
import 'package:aniflow/core/common/model/activity_scope_category.dart';
import 'package:aniflow/core/common/model/anime_season.dart';
import 'package:aniflow/core/common/model/media_type.dart';
import 'package:aniflow/core/common/util/change_notifier_util.dart';
import 'package:aniflow/core/common/util/stream_util.dart';
import 'package:aniflow/core/shared_preference/model/user_setting_model.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin UserDataKey {
  static const currentSeasonYear = "current_season_year";
  static const currentSeason = "current_season";
  static const showSuggestBoard = "show_suggest_board";
  static const lastSuccessSync = "last_success_sync";
  static const authToken = "auth_token";
  static const authExpiredTime = "auth_expired_time";

  /// user settings.
  static const authedUserId = "authed_userId";
  static const displayAdultContent = "display_adult_content";
  static const currentMediaType = "currentMediaType";
  static const activityScope = "activity_scope";
  static const activityFilter = "activity_filter";
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

  Future init() async {
    _preference = await SharedPreferences.getInstance();
  }

  Future setCurrentSeason(AnimeSeason season) {
    return _preference.setString(UserDataKey.currentSeason, season.toString());
  }

  AnimeSeason getCurrentSeason() {
    final seasonString = _preference.getString(UserDataKey.currentSeason) ?? '';
    return AnimeSeason.values.firstWhere((e) => e.toString() == seasonString,
        orElse: () => AnimeSeason.spring);
  }

  Future setCurrentSeasonYear(int seasonYear) {
    return _preference.setInt(UserDataKey.currentSeasonYear, seasonYear);
  }

  int getCurrentSeasonYear() {
    return _preference.getInt(UserDataKey.currentSeasonYear) ?? -1;
  }

  Future setIsNeedShowSuggestBoard(bool showSuggestBoard) {
    return _preference.setBool(UserDataKey.showSuggestBoard, showSuggestBoard);
  }

  bool isNeedShowSuggestBoard() {
    return _preference.getBool(UserDataKey.showSuggestBoard) ?? false;
  }

  Future setLastSuccessSync(DateTime dateTime) {
    return _preference.setString(
        UserDataKey.lastSuccessSync, dateTime.toIso8601String());
  }

  DateTime? getLastSuccessSync() {
    final result = _preference.getString(UserDataKey.lastSuccessSync) ?? '';
    return DateTime.tryParse(result);
  }

  Future setAuthToken(String? authToken) {
    if (authToken != null) {
      return _preference.setString(UserDataKey.authToken, authToken);
    } else {
      return _preference.remove(UserDataKey.authToken);
    }
  }

  String getAuthToken() {
    return _preference.getString(UserDataKey.authToken) ?? '';
  }

  Future setAuthExpiredTime(DateTime? dateTime) {
    if (dateTime != null) {
      return _preference.setString(
          UserDataKey.authExpiredTime, dateTime.toIso8601String());
    } else {
      return _preference.remove(UserDataKey.authExpiredTime);
    }
  }

  DateTime? getAuthExpiredTime() {
    final result = _preference.getString(UserDataKey.authExpiredTime) ?? '';
    return DateTime.tryParse(result);
  }

  UserSettingModel getUserSettingModel() {
    return UserSettingModel(
      displayAdultContent:
          _preference.getBool(UserDataKey.displayAdultContent) ?? false,
    );
  }

  Future setIsDisplayAdultContent(bool isDisplayAdultContent) {
    return _preference.setBool(
        UserDataKey.displayAdultContent, isDisplayAdultContent);
  }

  MediaType getCurrentMediaType() => MediaType.fromString(
        _preference.getString(UserDataKey.currentMediaType) ??
            MediaType.anime.jsonString,
      );

  Stream<MediaType> getCurrentMediaTypeStream() => StreamUtil.createStream(
        _mediaTypeChangeNotifier,
        () => Future(() => getCurrentMediaType()),
      );

  Future setCurrentMediaType(MediaType mediaType) async {
    final isChanged = await _preference.setString(
        UserDataKey.currentMediaType, mediaType.jsonString);

    if (isChanged) {
      _mediaTypeChangeNotifier.notifyChanged();
    }
  }

  Future setActivityScopeCategory(ActivityScopeCategory category) async {
    final isChanged = await _preference.setString(
        UserDataKey.activityScope, category.toJson());

    if (isChanged) {
      _activityScopeChangeNotifier.notifyChanged();
    }
  }

  ActivityScopeCategory getActivityScopeCategory() {
    return ActivityScopeCategory.fromJson(
        _preference.getString(UserDataKey.activityScope) ??
            ActivityScopeCategory.global.toJson());
  }

  Stream<ActivityScopeCategory> getActivityScopeCategoryStream() =>
      StreamUtil.createStream(
        _activityScopeChangeNotifier,
        () => Future(() => getActivityScopeCategory()),
      );

  Future setActivityFilterType(ActivityFilterType category) async {
    final isChanged = await _preference.setString(
        UserDataKey.activityFilter, category.toJson());

    if (isChanged) {
      _activityFilterChangeNotifier.notifyChanged();
    }
  }

  ActivityFilterType getActivityFilterType() {
    return ActivityFilterType.fromJson(
        _preference.getString(UserDataKey.activityFilter) ??
            ActivityFilterType.all.toJson());
  }

  Stream<ActivityFilterType> getActivityFilterTypeStream() =>
      StreamUtil.createStream(
        _activityFilterChangeNotifier,
        () => Future(() => getActivityFilterType()),
      );

  Future setAuthedUserId(String userId) async {
    bool isChanged =
        await _preference.setString(UserDataKey.authedUserId, userId);

    if (isChanged) {
      _userIdChangeNotifier.notifyChanged();
    }
  }

  Future clearAuthedUserId() async {
    await _preference.remove(UserDataKey.authedUserId);
    _userIdChangeNotifier.notifyChanged();
  }

  String? getAuthedUserId() => _preference.getString(UserDataKey.authedUserId);

  Stream<String?> getAuthedUserStream() => StreamUtil.createStream(
      _userIdChangeNotifier, () => Future.value(getAuthedUserId()));
}

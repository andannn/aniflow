import 'dart:async';
import 'package:anime_tracker/core/common/model/anime_season.dart';
import 'package:anime_tracker/core/shared_preference/model/user_setting_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin UserDataKey {
  static const currentSeasonYear = "current_season_year";
  static const currentSeason = "current_season";
  static const showSuggestBoard = "show_suggest_board";
  static const lastSuccessSync = "last_success_sync";
  static const authToken = "auth_token";
  static const authExpiredTime = "auth_expired_time";

  /// user settings.
  static const displayAdultContent = "display_adult_content";
}

class AniFlowPreferences {
  static AniFlowPreferences? _instance;

  factory AniFlowPreferences() => _instance ??= AniFlowPreferences._();

  AniFlowPreferences._();

  late SharedPreferences _preference;

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

  String? getAuthToken() {
    return _preference.getString(UserDataKey.authToken);
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
}

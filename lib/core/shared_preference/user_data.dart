import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/repository/ani_list_repository.dart';

mixin UserDataKey {
  static const currentSeasonYear = "current_season_year";
  static const currentSeason = "current_season";
  static const showSuggestBoard = "show_suggest_board";
  static const lastSuccessSync = "last_success_sync";
  static const authToken = "auth_token";
  static const authExpiredTime = "auth_expired_time";
}

class AnimeTrackerPreferences {
  static AnimeTrackerPreferences? _instance;

  factory AnimeTrackerPreferences() =>
      _instance ??= AnimeTrackerPreferences._();

  AnimeTrackerPreferences._();

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
    return _preference.setString(UserDataKey.lastSuccessSync, dateTime.toIso8601String());
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
      return _preference.setString(UserDataKey.authExpiredTime, dateTime.toIso8601String());
    } else {
      return _preference.remove(UserDataKey.authExpiredTime);
    }
  }

  DateTime? getAuthExpiredTime() {
    final result = _preference.getString(UserDataKey.authExpiredTime) ?? '';
    return DateTime.tryParse(result);
  }
}

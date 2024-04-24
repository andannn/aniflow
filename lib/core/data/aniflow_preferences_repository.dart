import 'package:aniflow/core/common/definitions/activity_filter_type.dart';
import 'package:aniflow/core/common/definitions/activity_scope_category.dart';
import 'package:aniflow/core/common/definitions/ani_list_settings.dart';
import 'package:aniflow/core/common/definitions/anime_season.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/setting/theme_setting.dart';
import 'package:aniflow/core/data/model/user_data_model.dart';
import 'package:aniflow/core/shared_preference/AfPreferences.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AfPreferencesRepository implements AfPreferences {
  AfPreferencesRepository(this._preferences);

  final AfPreferences _preferences;

  @override
  Stream<UserDataModel> get userDataStream => _preferences.userDataStream;

  @override
  UserDataModel get userData => _preferences.userData;

  @override
  Future setActivityFilterType(ActivityFilterType category) =>
      _preferences.setActivityFilterType(category);

  @override
  Future setActivityScopeCategory(ActivityScopeCategory scopeCategory) =>
      _preferences.setActivityScopeCategory(scopeCategory);

  @override
  Future setAniListSettings(AniListSettings setting) =>
      _preferences.setAniListSettings(setting);

  @override
  Future setAnimeSeason(AnimeSeason season) =>
      _preferences.setAnimeSeason(season);

  @override
  Future setAuthExpiredTime(DateTime? dateTime) =>
      _preferences.setAuthExpiredTime(dateTime);

  @override
  Future setAuthToken(String? authToken) =>
      _preferences.setAuthToken(authToken);

  @override
  Future setAuthedUserId(String? userId) =>
      _preferences.setAuthedUserId(userId);

  @override
  Future setIsShowReleaseOnly(bool showReleasedOnly) =>
      _preferences.setIsShowReleaseOnly(showReleasedOnly);

  @override
  Future setMediaType(MediaType mediaType) =>
      _preferences.setMediaType(mediaType);

  @override
  Future setSeasonYear(int seasonYear) =>
      _preferences.setSeasonYear(seasonYear);

  @override
  Future setThemeSetting(ThemeSetting setting) =>
      _preferences.setThemeSetting(setting);
}

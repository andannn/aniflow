import 'package:aniflow/core/common/definitions/activity_filter_type.dart';
import 'package:aniflow/core/common/definitions/activity_scope_category.dart';
import 'package:aniflow/core/common/definitions/ani_list_settings.dart';
import 'package:aniflow/core/common/definitions/anime_season.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/setting/score_format.dart';
import 'package:aniflow/core/common/setting/theme_setting.dart';
import 'package:aniflow/core/common/setting/user_staff_name_language.dart';
import 'package:aniflow/core/common/setting/user_title_language.dart';
import 'package:aniflow/core/common/state_stream.dart';
import 'package:aniflow/core/shared_preference/AfPreferences.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AfPreferencesRepository {
  AfPreferencesRepository(this._preferences) {
    _init();
  }

  final AfPreferences _preferences;
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

  UserStaffNameLanguage get userStaffNameLanguage =>
      aniListSettings.value.userStaffNameLanguage;

  UserTitleLanguage get userTitleLanguage =>
      aniListSettings.value.userTitleLanguage;

  ScoreFormat get scoreFormat => aniListSettings.value.scoreFormat;

  void _init() async {
    mediaType = MutableStateStream.create(
      onGetValue: () => _preferences.mediaType,
      onSetValue: _preferences.setMediaType,
    );

    season = MutableStateStream.create(
      onGetValue: () => _preferences.season,
      onSetValue: _preferences.setAnimeSeason,
    );

    seasonYear = MutableStateStream.create(
      onGetValue: () => _preferences.seasonYear,
      onSetValue: _preferences.setSeasonYear,
    );

    themeSetting = MutableStateStream.create(
        onGetValue: () => _preferences.themeSetting,
        onSetValue: _preferences.setThemeSetting);

    isShowReleaseOnly = MutableStateStream.create(
        onGetValue: () => _preferences.isShowReleaseOnly,
        onSetValue: _preferences.setIsShowReleaseOnly);

    activityScopeCategory = MutableStateStream.create(
      onGetValue: () => _preferences.activityScopeCategory,
      onSetValue: _preferences.setActivityScopeCategory,
    );

    activityFilterType = MutableStateStream.create(
      onGetValue: () => _preferences.activityFilterType,
      onSetValue: _preferences.setActivityFilterType,
    );

    authedUserId = MutableStateStream.create(
      onGetValue: () => _preferences.authedUserId,
      onSetValue: _preferences.setAuthedUserId,
    );

    authToken = MutableStateStream.create(
      onGetValue: () => _preferences.authToken,
      onSetValue: _preferences.setAuthToken,
    );

    aniListSettings = MutableStateStream.create(
      onGetValue: () => _preferences.aniListSettings,
      onSetValue: _preferences.setAniListSettings,
    );

    authExpiredTime = MutableStateStream.create(
      onGetValue: () => _preferences.authExpiredTime,
      onSetValue: _preferences.setAuthExpiredTime,
    );
  }
}

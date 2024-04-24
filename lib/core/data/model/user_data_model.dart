import 'package:aniflow/core/common/definitions/activity_filter_type.dart';
import 'package:aniflow/core/common/definitions/activity_scope_category.dart';
import 'package:aniflow/core/common/definitions/ani_list_settings.dart';
import 'package:aniflow/core/common/definitions/anime_season.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/setting/score_format.dart';
import 'package:aniflow/core/common/setting/theme_setting.dart';
import 'package:aniflow/core/common/setting/user_staff_name_language.dart';
import 'package:aniflow/core/common/setting/user_title_language.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data_model.freezed.dart';

@freezed
class UserDataModel with _$UserDataModel {
  const factory UserDataModel({
    /// local data.
    @Default(MediaType.anime) MediaType mediaType,
    @Default(AnimeSeason.summer) AnimeSeason season,
    @Default(-1) int seasonYear,
    @Default(ThemeSetting.system) ThemeSetting themeSetting,
    @Default(false) bool isShowReleaseOnly,
    @Default(ActivityScopeCategory.global)
    ActivityScopeCategory activityScopeCategory,
    @Default(ActivityFilterType.all) ActivityFilterType activityFilterType,
    String? authedUserId,
    String? authToken,
    DateTime? authExpiredTime,

    /// ani-list remote data.
    @Default(false) bool displayAdultContent,
    @Default(UserTitleLanguage.native) UserTitleLanguage userTitleLanguage,
    @Default(UserStaffNameLanguage.native)
    UserStaffNameLanguage userStaffNameLanguage,
    @Default(ScoreFormat.point100) ScoreFormat scoreFormat,
  }) = _UserDataModel;
}

extension UserDataModelEx on UserDataModel {
  AniListSettings get aniListSettings => AniListSettings(
        displayAdultContent: displayAdultContent,
        userTitleLanguage: userTitleLanguage,
        userStaffNameLanguage: userStaffNameLanguage,
        scoreFormat: scoreFormat,
      );
}

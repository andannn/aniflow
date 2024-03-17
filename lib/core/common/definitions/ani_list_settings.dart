import 'package:aniflow/core/common/setting/score_format.dart';
import 'package:aniflow/core/common/setting/user_staff_name_language.dart';
import 'package:aniflow/core/common/setting/user_title_language.dart';
import 'package:aniflow/core/network/model/media_list_option_dto.dart';
import 'package:aniflow/core/network/model/user_options.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ani_list_settings.freezed.dart';

part 'ani_list_settings.g.dart';

@freezed
class AniListSettings with _$AniListSettings {
  factory AniListSettings({
    @JsonKey(name: AniListSettingsKeys.displayAdultContentKey)
    @Default(false)
    bool displayAdultContent,
    @JsonKey(name: AniListSettingsKeys.userTitleLanguageKey)
    @Default(UserTitleLanguage.native)
    UserTitleLanguage userTitleLanguage,
    @JsonKey(name: AniListSettingsKeys.userStaffNameLanguage)
    @Default(UserStaffNameLanguage.native)
    UserStaffNameLanguage userStaffNameLanguage,
    @JsonKey(name: AniListSettingsKeys.scoreFormat)
    @Default(ScoreFormat.point100)
    ScoreFormat scoreFormat,
  }) = _AniListSettings;

  factory AniListSettings.fromJson(Map<String, dynamic> json) =>
      _$$AniListSettingsImplFromJson(json);

  static AniListSettings fromDto(
      UserOptions optionDto, MediaListOptionDto listOptionDto) {
    return AniListSettings(
      displayAdultContent: optionDto.displayAdultContent,
      userTitleLanguage: optionDto.titleLanguage ?? UserTitleLanguage.native,
      userStaffNameLanguage:
          optionDto.staffNameLanguage ?? UserStaffNameLanguage.native,
      scoreFormat: listOptionDto.scoreFormat ?? ScoreFormat.point100,
    );
  }
}

mixin AniListSettingsKeys {
  static const displayAdultContentKey = 'display_adult_content_key';
  static const userTitleLanguageKey = 'user_title_language_key';
  static const userStaffNameLanguage = 'user_staff_name_language_key';
  static const scoreFormat = 'score_format_key';
}

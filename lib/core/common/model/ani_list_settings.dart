import 'package:aniflow/core/common/model/setting/user_staff_name_language.dart';
import 'package:aniflow/core/common/model/setting/user_title_language.dart';
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
    @Default(UserStaffNameLanguage.native)
    UserStaffNameLanguage userStaffNameLanguage,
  }) = _AniListSettings;

  factory AniListSettings.fromJson(Map<String, dynamic> json) =>
      _$$AniListSettingsImplFromJson(json);

  static AniListSettings fromDto(UserOptions dto) {
    return AniListSettings(
      displayAdultContent: dto.displayAdultContent,
      userTitleLanguage: dto.titleLanguage ?? UserTitleLanguage.native,
      userStaffNameLanguage:
          dto.staffNameLanguage ?? UserStaffNameLanguage.native,
    );
  }
}

mixin AniListSettingsKeys {
  static const displayAdultContentKey = 'display_adult_content_key';
  static const userTitleLanguageKey = 'user_title_language_key';
}

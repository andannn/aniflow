import 'package:aniflow/core/common/model/user_title_language.dart';
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
  }) = _AniListSettings;

  factory AniListSettings.fromJson(Map<String, dynamic> json) =>
      _$$_AniListSettingsFromJson(json);

  static AniListSettings fromDto(UserOptions dto) {
    return AniListSettings(
      displayAdultContent: dto.displayAdultContent,
      userTitleLanguage: dto.titleLanguage ?? UserTitleLanguage.native,
    );
  }
}

mixin AniListSettingsKeys {
  static const displayAdultContentKey = 'display_adult_content_key';
  static const userTitleLanguageKey = 'user_title_language_key';
}

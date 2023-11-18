import 'package:aniflow/core/common/model/setting/user_title_language.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_title_modle.freezed.dart';

part 'media_title_modle.g.dart';

@freezed
class MediaTitle with _$MediaTitle {
  factory MediaTitle({
    @Default('') @JsonKey(name: 'romaji') String romaji,
    @Default('') @JsonKey(name: 'english') String english,
    @Default('') @JsonKey(name: 'native') String native,
  }) = _MediaTitle;

  factory MediaTitle.fromJson(Map<String, dynamic> json) =>
      _$$MediaTitleImplFromJson(json);
}

extension MediaTitleEx on MediaTitle {
  String getTitle(UserTitleLanguage? language) {
    String title = '';
    switch (language) {
      case UserTitleLanguage.romaji:
        title = romaji;
      case UserTitleLanguage.english:
        title = english;
      case UserTitleLanguage.native:
        title = native;
      default:
    }
    if (title.isEmpty) {
      title = native;
    }
    if (title.isEmpty) {
      title = romaji;
    }
    if (title.isEmpty) {
      title = english;
    }
    return title;
  }
}

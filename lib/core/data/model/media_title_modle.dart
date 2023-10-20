import 'package:flutter/cupertino.dart';
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
      _$$_MediaTitleFromJson(json);
}

extension MediaTitleEx on MediaTitle {
  String getLocalTitle(BuildContext context) {
    final appLocale = Localizations.localeOf(context);
    switch (appLocale.languageCode) {
      case 'Jpan':
      case 'ja':
      case 'zh':
        return native;
      default:
        return english.isNotEmpty ? english : romaji;
    }
  }
}

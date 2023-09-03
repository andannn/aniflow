import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_title_modle.freezed.dart';

part 'anime_title_modle.g.dart';

@freezed
class AnimeTitle with _$AnimeTitle {
  factory AnimeTitle({
    @Default('') @JsonKey(name: 'romaji') String romaji,
    @Default('') @JsonKey(name: 'english') String english,
    @Default('') @JsonKey(name: 'native') String native,
  }) = _AnimeTitle;

  factory AnimeTitle.fromJson(Map<String, dynamic> json) =>
      _$$_AnimeTitleFromJson(json);
}
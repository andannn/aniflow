import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/anime_title_modle.dart';

part 'short_anime_dto.freezed.dart';

part 'short_anime_dto.g.dart';

@freezed
class ShortcutAnimeDto with _$ShortcutAnimeDto {
  factory ShortcutAnimeDto({
    @Default(-1) @JsonKey(name: 'id') int id,
    @JsonKey(name: 'title') AnimeTitle? title,
    @Default({}) @JsonKey(name: 'coverImage') Map<String, String?> coverImage,
  }) = _ShortcutAnimeDto;

  factory ShortcutAnimeDto.fromJson(Map<String, dynamic> json) =>
      _$$_ShortcutAnimeDtoFromJson(json);
}

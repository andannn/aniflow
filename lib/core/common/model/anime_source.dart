import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_source.g.dart';

@JsonEnum(alwaysCreate: true)
enum AnimeSource {
  @JsonValue('ORIGINAL')
  original,
  @JsonValue('MANGA')
  manga,
  @JsonValue('LIGHT_NOVEL')
  lightNovel,
  @JsonValue('VISUAL_NOVEL')
  visualNovel,
  @JsonValue('VIDEO_GAME')
  videoGame,
  @JsonValue('OTHER')
  other;

  String toJson() => _$AnimeSourceEnumMap[this]!;

  static AnimeSource? fromJson(String? json) =>
      _$AnimeSourceEnumMap.map((key, value) => MapEntry(value, key))[json];
}

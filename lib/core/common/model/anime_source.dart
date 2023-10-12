import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum()
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
  other,
}

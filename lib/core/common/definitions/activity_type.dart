import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_type.g.dart';

/// Bangumi releasing season.
@JsonEnum(alwaysCreate: true)
enum ActivityType {
  /// A text activity
  @JsonValue('TEXT')
  text,

  /// A anime list update activity
  @JsonValue('ANIME_LIST')
  animeList,

  /// A manga list update activity
  @JsonValue('MANGA_LIST')
  mangaList,

  /// A text message activity sent to another user
  @JsonValue('MESSAGE')
  message,

  /// Anime & Manga list update, only used in query arguments
  @JsonValue('MEDIA_LIST')
  mediaList;

  String toJson() => _$ActivityTypeEnumMap[this]!;

  factory ActivityType.fromJson(String json) =>
      _$ActivityTypeEnumMap.map((key, value) => MapEntry(value, key))[json]!;
}

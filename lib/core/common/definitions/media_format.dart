import 'package:json_annotation/json_annotation.dart';

part 'media_format.g.dart';

@JsonEnum(alwaysCreate: true)
enum MediaFormat {
  /// Anime broadcast on television
  @JsonValue('TV')
  tv,

  /// Anime which are under 15 minutes in length and broadcast on television
  @JsonValue('TV_SHORT')
  tvShort,

  /// Anime movies with a theatrical release
  @JsonValue('MOVIE')
  movie,

  /// Special episodes that have been included in DVD/Blu-ray releases, picture dramas, pilots, etc
  @JsonValue('SPECIAL')
  special,

  /// (Original Video Animation) Anime that have been released directly on DVD/Blu-ray without originally going through a theatrical release or television broadcast
  @JsonValue('OVA')
  ova,

  /// (Original Net Animation) Anime that have been originally released online or are only available through streaming services.
  @JsonValue('ONA')
  ona,

  /// Short anime released as a music video
  @JsonValue('MUSIC')
  music,

  /// Professionally published manga with more than one chapter
  @JsonValue('MANGA')
  manga,

  /// Written books released as a series of light novels
  @JsonValue('NOVEL')
  novel,

  /// Manga with just one chapter
  @JsonValue('ONE_SHOT')
  oneShot;

  String toJson() => _$MediaFormatEnumMap[this]!;

  static MediaFormat? fromJson(String? json) =>
      _$MediaFormatEnumMap.map((key, value) => MapEntry(value, key))[json];
}

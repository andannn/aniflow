import 'package:aniflow/core/common/definitions/media_category.dart';
import 'package:aniflow/core/common/setting/setting.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_type.g.dart';

@JsonEnum(alwaysCreate: true)
enum MediaType implements Setting {
  @JsonValue('ANIME')
  anime,
  @JsonValue('MANGA')
  manga;

  const MediaType();

  String toJson() => _$MediaTypeEnumMap[this]!;

  static MediaType fromJson(String json) =>
      _$MediaTypeEnumMap.map((key, value) => MapEntry(value, key))[json]!;
}

MediaType getMediaTypeByCategory(MediaCategory category) {
  switch (category) {
    case MediaCategory.currentSeasonAnime:
    case MediaCategory.nextSeasonAnime:
    case MediaCategory.trendingAnime:
    case MediaCategory.movieAnime:
    case MediaCategory.newAddedAnime:
      return MediaType.anime;
    case MediaCategory.trendingManga:
    case MediaCategory.allTimePopularManga:
    case MediaCategory.topManhwa:
    case MediaCategory.newAddedManga:
      return MediaType.manga;
  }
}

import 'package:aniflow/core/common/model/anime_category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum()
enum MediaType {
  @JsonValue('ANIME')
  anime('ANIME'),
  @JsonValue('MANGA')
  manga('MANGA');

  final String jsonString;

  const MediaType(this.jsonString);

  static MediaType fromString(String value) =>
      MediaType.values.firstWhere((e) => e.jsonString == value);
}

MediaType getMediaTypeByCategory(MediaCategory category) {
  switch (category) {
    case MediaCategory.currentSeasonAnime:
    case MediaCategory.nextSeasonAnime:
    case MediaCategory.trendingAnime:
    case MediaCategory.movieAnime:
      return MediaType.anime;
    case MediaCategory.trendingManga:
    case MediaCategory.allTimePopularManga:
    case MediaCategory.topManhwa:
      return MediaType.manga;
  }
}

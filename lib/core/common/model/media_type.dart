import 'package:aniflow/core/common/model/anime_category.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum()
enum MediaType {
  @JsonValue('ANIME')
  anime('ANIME'),
  @JsonValue('MANGA')
  manga('MANGA');

  final String sqlTypeString;

  const MediaType(this.sqlTypeString);

  static MediaType fromString(String enumString) =>
      MediaType.values.firstWhere((e) => describeEnum(e) == enumString);
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
      return MediaType.manga;
  }
}

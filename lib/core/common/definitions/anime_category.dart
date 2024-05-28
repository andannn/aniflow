import 'package:aniflow/core/common/definitions/media_type.dart';

enum MediaCategory {
  /// current season releasing anime.
  currentSeasonAnime,

  /// next season not yet released anime.
  nextSeasonAnime,

  /// now trending anime.
  trendingAnime,

  /// popular movie.
  movieAnime,

  /// trending Manga.
  trendingManga,

  /// all time popular manga.
  allTimePopularManga,

  /// South korea top.
  topManhwa;

  static List<MediaCategory> getALlCategoryByType(MediaType type) {
    if (type == MediaType.anime) {
      return [
        currentSeasonAnime,
        nextSeasonAnime,
        trendingAnime,
        movieAnime,
      ];
    } else {
      return [
        trendingManga,
        allTimePopularManga,
        topManhwa,
      ];
    }
  }
}

mixin CategoryColumnsValues {
  static const String trending = 'trending';
  static const String currentSeason = 'current_season';
  static const String nextSeason = 'next_season';
  static const String movie = 'movie';
  static const String trendingManga = 'trending_manga';
  static const String allTimePopularManga = 'all_time_popular_manga';
  static const String topManhwa = 'top_manhwa';
}

extension MediaCategoryEx on MediaCategory {
  String getContentValue() {
    switch (this) {
      case MediaCategory.trendingAnime:
        return CategoryColumnsValues.trending;
      case MediaCategory.currentSeasonAnime:
        return CategoryColumnsValues.currentSeason;
      case MediaCategory.nextSeasonAnime:
        return CategoryColumnsValues.nextSeason;
      case MediaCategory.movieAnime:
        return CategoryColumnsValues.movie;
      case MediaCategory.trendingManga:
        return CategoryColumnsValues.trendingManga;
      case MediaCategory.allTimePopularManga:
        return CategoryColumnsValues.allTimePopularManga;
      case MediaCategory.topManhwa:
        return CategoryColumnsValues.topManhwa;
    }
  }
}

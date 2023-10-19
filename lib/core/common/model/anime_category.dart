import 'package:anime_tracker/core/common/model/media_type.dart';

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
  allTimePopularManga;

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
      ];
    }
  }
}

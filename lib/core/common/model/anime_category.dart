import 'package:aniflow/app/local/ani_flow_localizations.dart';
import 'package:aniflow/core/common/model/media_type.dart';
import 'package:aniflow/core/database/dao/media_dao.dart';
import 'package:flutter/cupertino.dart';

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

  String getMediaCategoryTitle(BuildContext context) {
    String title;
    switch (this) {
      case MediaCategory.currentSeasonAnime:
        title = AFLocalizations.of(context).popularThisSeasonLabel;
      case MediaCategory.nextSeasonAnime:
        title = AFLocalizations.of(context).upComingNextSeasonLabel;
      case MediaCategory.trendingAnime:
        title = AFLocalizations.of(context).trendingNowLabel;
      case MediaCategory.movieAnime:
        title = AFLocalizations.of(context).movieLabel;
      case MediaCategory.trendingManga:
        title = AFLocalizations.of(context).trendingNowLabel;
      case MediaCategory.allTimePopularManga:
        title = AFLocalizations.of(context).allTimePopular;
      case MediaCategory.topManhwa:
        title = AFLocalizations.of(context).topManhwa;
    }
    return title;
  }

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

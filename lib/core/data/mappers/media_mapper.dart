import 'dart:convert';

import 'package:aniflow/core/common/model/anime_season.dart';
import 'package:aniflow/core/common/model/anime_source.dart';
import 'package:aniflow/core/common/model/media_status.dart';
import 'package:aniflow/core/common/model/media_type.dart';
import 'package:aniflow/core/common/util/color_util.dart';
import 'package:aniflow/core/data/model/media_cover_image_model.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/media_title_model.dart';
import 'package:aniflow/core/data/model/trailter_model.dart';
import 'package:aniflow/core/database_drift/aniflow_database.dart';

extension MediaMapper on MediaEntity {
  MediaModel toModel() {
    return MediaModel(
      id: id,
      type: type != null ? MediaType.fromJson(type!) : MediaType.anime,
      title: MediaTitle(
        english: englishTitle ?? '',
        romaji: romajiTitle ?? '',
        native: nativeTitle ?? '',
      ),
      coverImage: MediaCoverImageModel(
        extraLarge: coverImageExtraLarge,
        large: coverImageLarge,
        medium: coverImageMedium,
        color: ColorUtil.parseColor(coverImageColor ?? ''),
      ),
      description: description,
      source: AnimeSource.fromJson(source),
      status: MediaStatus.fromJson(status),
      bannerImage: bannerImage,
      averageScore: averageScore,
      favourites: favourites,
      season: AnimeSeason.fromJson(season),
      seasonYear: seasonYear,
      episodes: episodes,
      ratedRank: ratedRanking,
      popularRank: popularRanking,
      nextAiringEpisode: nextAiringEpisode,
      timeUntilAiring: timeUntilAiring,
      isFavourite: isFavourite ?? false,
      genres: genres != null
          ? (jsonDecode(genres!) as List<dynamic>?)
                  ?.map((e) => e)
                  .whereType<String>()
                  .toList() ??
              const []
          : const [],
      hashtags: hashtag?.split(' ') ?? [],
      trailerModel: trailerId != null
          ? TrailerModel(
              id: trailerId,
              site: trailerSite,
              thumbnail: trailerThumbnail,
            )
          : null,
      startDate: startDate != null
          ? DateTime.fromMillisecondsSinceEpoch(startDate!)
          : null,
      endDate: endDate != null
          ? DateTime.fromMillisecondsSinceEpoch(endDate!)
          : null,
    );
  }
}

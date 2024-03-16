import 'dart:convert';

import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/network/model/fuzzy_date_dto.dart';
import 'package:aniflow/core/network/model/media_dto.dart';

extension MediaMapper on MediaDto {
  MediaEntity toEntity() => MediaEntity(
    id: id.toString(),
    type: type,
    englishTitle: title?.english ?? '',
    romajiTitle: title?.romaji ?? '',
    nativeTitle: title?.native ?? '',
    coverImageExtraLarge: coverImage?.extraLarge ?? '',
    coverImageLarge: coverImage?.large ?? '',
    coverImageMedium: coverImage?.medium ?? '',
    coverImageColor: coverImage?.color ?? '',
    hashtag: hashtag,
    description: description,
    source: source?.toJson(),
    bannerImage: bannerImage,
    averageScore: averageScore,
    trending: trending,
    favourites: favourites,
    trailerId: trailer?.id.toString(),
    trailerSite: trailer?.site.toString(),
    trailerThumbnail: trailer?.thumbnail.toString(),
    episodes: episodes ?? 0,
    season: season?.toJson(),
    seasonYear: seasonYear,
    isFavourite: isFavourite,
    status: status?.toJson(),
    timeUntilAiring: nextAiringEpisode?.timeUntilAiring,
    nextAiringEpisode: nextAiringEpisode?.episode,
    genres: jsonEncode(genres),
    popularRanking: rankings
        .firstWhere(
          (e) => e?.type == 'POPULAR' && e?.allTime == false,
      orElse: () => null,
    )
        ?.rank,
    ratedRanking: rankings
        .firstWhere(
          (e) => e?.type == 'RATED' && e?.allTime == false,
      orElse: () => null,
    )
        ?.rank,
    startDate: startDate.toDateTime()?.millisecondsSinceEpoch,
    endDate: endDate.toDateTime()?.millisecondsSinceEpoch,
  );
}

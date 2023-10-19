import 'dart:convert';

import 'package:anime_tracker/core/common/model/anime_season.dart';
import 'package:anime_tracker/core/common/model/anime_source.dart';
import 'package:anime_tracker/core/common/model/media_status.dart';
import 'package:anime_tracker/core/database/dao/media_dao.dart';
import 'package:anime_tracker/core/network/model/anime_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_entity.freezed.dart';

part 'media_entity.g.dart';

@freezed
class MediaEntity with _$MediaEntity {
  factory MediaEntity({
    @Default('') @JsonKey(name: MediaTableColumns.id) String id,
    @Default('')
    @JsonKey(name: MediaTableColumns.englishTitle)
    String englishTitle,
    @Default('')
    @JsonKey(name: MediaTableColumns.romajiTitle)
    String romajiTitle,
    @Default('')
    @JsonKey(name: MediaTableColumns.nativeTitle)
    String nativeTitle,
    @Default('') @JsonKey(name: MediaTableColumns.coverImage) String coverImage,
    @Default('')
    @JsonKey(name: MediaTableColumns.coverImageColor)
    String coverImageColor,
    @JsonKey(name: MediaTableColumns.hashtag) String? hashtag,
    @JsonKey(name: MediaTableColumns.description) String? description,
    @JsonKey(name: MediaTableColumns.source) AnimeSource? source,
    @JsonKey(name: MediaTableColumns.bannerImage) String? bannerImage,
    @JsonKey(name: MediaTableColumns.averageScore) int? averageScore,
    @JsonKey(name: MediaTableColumns.trending) int? trending,
    @JsonKey(name: MediaTableColumns.favourites) int? favourites,
    @JsonKey(name: MediaTableColumns.trailerId) String? trailerId,
    @JsonKey(name: MediaTableColumns.trailerSite) String? trailerSite,
    @JsonKey(name: MediaTableColumns.episodes) int? episodes,
    @JsonKey(name: MediaTableColumns.seasonYear) int? seasonYear,
    @JsonKey(name: MediaTableColumns.season) AnimeSeason? season,
    @JsonKey(name: MediaTableColumns.status) MediaStatus? status,
    @JsonKey(name: MediaTableColumns.genres) String? genres,
    @JsonKey(name: MediaTableColumns.trailerThumbnail) String? trailerThumbnail,
    @JsonKey(name: MediaTableColumns.popularRanking) int? popularRanking,
    @JsonKey(name: MediaTableColumns.ratedRanking) int? ratedRanking,
    @JsonKey(name: MediaTableColumns.timeUntilAiring) int? timeUntilAiring,
    @JsonKey(name: MediaTableColumns.nextAiringEpisode) int? nextAiringEpisode,
  }) = _MediaEntity;

  factory MediaEntity.fromJson(Map<String, dynamic> json) =>
      _$$_MediaEntityFromJson(json);

  static MediaEntity fromNetworkModel(AnimeDto model) =>
      MediaEntity(
        id: model.id.toString(),
        englishTitle: model.title?.english ?? '',
        romajiTitle: model.title?.romaji ?? '',
        nativeTitle: model.title?.native ?? '',
        coverImage: model.coverImage['extraLarge'] ?? '',
        coverImageColor: model.coverImage['color'] ?? '',
        hashtag: model.hashtag,
        description: model.description,
        source: model.source,
        bannerImage: model.bannerImage,
        averageScore: model.averageScore,
        trending: model.trending,
        favourites: model.favourites,
        trailerId: model.trailer?.id.toString(),
        trailerSite: model.trailer?.site.toString(),
        trailerThumbnail: model.trailer?.thumbnail.toString(),
        episodes: model.episodes,
        season: model.season,
        seasonYear: model.seasonYear,
        status: model.status,
        timeUntilAiring: model.nextAiringEpisode?.timeUntilAiring,
        nextAiringEpisode: model.nextAiringEpisode?.episode,
        genres: jsonEncode(model.genres),
        popularRanking: model.rankings
            .firstWhere(
              (e) => e?.type == 'POPULAR' && e?.allTime == false,
              orElse: () => null,
            )
            ?.rank,
        ratedRanking: model.rankings
            .firstWhere(
              (e) => e?.type == 'RATED' && e?.allTime == false,
              orElse: () => null,
            )
            ?.rank,
      );
}

import 'dart:convert';

import 'package:anime_tracker/core/data/model/anime_source.dart';
import 'package:anime_tracker/core/data/repository/ani_list_repository.dart';
import 'package:anime_tracker/core/database/anime_dao.dart';
import 'package:anime_tracker/core/network/model/detail_anime_dto.dart';
import 'package:anime_tracker/core/network/model/short_anime_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_entity.freezed.dart';

part 'anime_entity.g.dart';

@freezed
class AnimeEntity with _$AnimeEntity {
  factory AnimeEntity({
    @Default('') @JsonKey(name: AnimeTableColumns.id) String id,
    @Default('')
    @JsonKey(name: AnimeTableColumns.englishTitle)
    String englishTitle,
    @Default('')
    @JsonKey(name: AnimeTableColumns.romajiTitle)
    String romajiTitle,
    @Default('')
    @JsonKey(name: AnimeTableColumns.nativeTitle)
    String nativeTitle,
    @Default('') @JsonKey(name: AnimeTableColumns.coverImage) String coverImage,
    @Default('')
    @JsonKey(name: AnimeTableColumns.coverImageColor)
    String coverImageColor,
    @JsonKey(name: AnimeTableColumns.description) String? description,
    @JsonKey(name: AnimeTableColumns.source) AnimeSource? source,
    @JsonKey(name: AnimeTableColumns.bannerImage) String? bannerImage,
    @JsonKey(name: AnimeTableColumns.averageScore) int? averageScore,
    @JsonKey(name: AnimeTableColumns.trending) int? trending,
    @JsonKey(name: AnimeTableColumns.favourites) int? favourites,
    @JsonKey(name: AnimeTableColumns.trailerId) String? trailerId,
    @JsonKey(name: AnimeTableColumns.trailerSite) String? trailerSite,
    @JsonKey(name: AnimeTableColumns.episodes) int? episodes,
    @JsonKey(name: AnimeTableColumns.seasonYear) int? seasonYear,
    @JsonKey(name: AnimeTableColumns.season) AnimeSeason? season,
    @JsonKey(name: AnimeTableColumns.status) AnimeStatus? status,
    @JsonKey(name: AnimeTableColumns.genres) String? genres,
    @JsonKey(name: AnimeTableColumns.trailerThumbnail) String? trailerThumbnail,
    @JsonKey(name: AnimeTableColumns.popularRanking) int? popularRanking,
    @JsonKey(name: AnimeTableColumns.ratedRanking) int? ratedRanking,
    @JsonKey(name: AnimeTableColumns.timeUntilAiring) int? timeUntilAiring,
    @JsonKey(name: AnimeTableColumns.nextAiringEpisode) int? nextAiringEpisode,
  }) = _AnimeEntity;

  factory AnimeEntity.fromJson(Map<String, dynamic> json) =>
      _$$_AnimeEntityFromJson(json);

  static AnimeEntity fromShortNetworkModel(ShortcutAnimeDto model) =>
      AnimeEntity(
        id: model.id.toString(),
        englishTitle: model.title?.english ?? '',
        romajiTitle: model.title?.romaji ?? '',
        nativeTitle: model.title?.native ?? '',
        coverImage: model.coverImage['extraLarge'] ?? '',
        coverImageColor: model.coverImage['color'] ?? '',
      );

  static AnimeEntity fromDetailNetworkModel(DetailAnimeDto model) =>
      AnimeEntity(
        id: model.id.toString(),
        englishTitle: model.title?.english ?? '',
        romajiTitle: model.title?.romaji ?? '',
        nativeTitle: model.title?.native ?? '',
        coverImage: model.coverImage['extraLarge'] ?? '',
        coverImageColor: model.coverImage['color'] ?? '',
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

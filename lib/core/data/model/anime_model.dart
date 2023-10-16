import 'dart:convert';

import 'package:anime_tracker/core/common/model/anime_season.dart';
import 'package:anime_tracker/core/common/model/anime_source.dart';
import 'package:anime_tracker/core/common/model/anime_status.dart';
import 'package:anime_tracker/core/data/model/anime_title_modle.dart';
import 'package:anime_tracker/core/data/model/character_and_voice_actor_model.dart';
import 'package:anime_tracker/core/data/model/media_external_link_model.dart';
import 'package:anime_tracker/core/data/model/staff_and_role_model.dart';
import 'package:anime_tracker/core/data/model/trailter_model.dart';
import 'package:anime_tracker/core/database/model/anime_entity.dart';
import 'package:anime_tracker/core/database/model/relations/anime_and_detail_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_model.freezed.dart';

@freezed
class AnimeModel with _$AnimeModel {
  factory AnimeModel({
    @Default('') String id,
    AnimeTitle? title,
    @Default('') String coverImage,
    @Default('') String coverImageColor,
    String? description,
    AnimeSource? source,
    String? bannerImage,
    int? averageScore,
    int? favourites,
    TrailerModel? trailerModel,
    int? seasonYear,
    AnimeSeason? season,
    AnimeStatus? status,
    int? ratedRank,
    int? popularRank,
    @Default([]) List<String> hashtags,
    @Default([]) List<String> genres,
    int? episodes,
    int? timeUntilAiring,
    int? nextAiringEpisode,
    @Default(false) bool isFollowing,
    @Default([]) List<CharacterAndVoiceActorModel> characterAndVoiceActors,
    @Default([]) List<StaffAndRoleModel> staffs,
    @Default([]) List<MediaExternalLinkModel> externalLinks,
  }) = _DetailAnimeModel;

  static AnimeModel fromDatabaseModel(AnimeEntity model) {
    return AnimeModel(
      id: model.id,
      title: AnimeTitle(
        english: model.englishTitle,
        romaji: model.romajiTitle,
        native: model.nativeTitle,
      ),
      coverImage: model.coverImage,
      coverImageColor: model.coverImageColor,
      description: model.description,
      source: model.source,
      status: model.status,
      bannerImage: model.bannerImage,
      averageScore: model.averageScore,
      favourites: model.favourites,
      season: model.season,
      seasonYear: model.seasonYear,
      episodes: model.episodes,
      ratedRank: model.ratedRanking,
      popularRank: model.popularRanking,
      nextAiringEpisode: model.nextAiringEpisode,
      timeUntilAiring: model.timeUntilAiring,
      genres: model.genres != null
          ? (jsonDecode(model.genres!) as List<dynamic>?)
                  ?.map((e) => e)
                  .whereType<String>()
                  .toList() ??
              const []
          : const [],
      hashtags: model.hashtag?.split(' ') ?? [],
      trailerModel: model.trailerId != null
          ? TrailerModel(
              id: model.trailerId,
              site: model.trailerSite,
              thumbnail: model.trailerThumbnail,
            )
          : null,
    );
  }

  static AnimeModel fromAnimeDetailInfo(
    AnimeWithDetailInfo model,
  ) {
    return AnimeModel.fromDatabaseModel(
      model.animeEntity,
    ).copyWith(
      characterAndVoiceActors: model.characterAndVoiceActors
          .map((e) => CharacterAndVoiceActorModel.fromDatabaseEntity(e))
          .toList(),
      staffs: model.staffs
          .map((e) => StaffAndRoleModel.fromDatabaseEntity(e))
          .toList(),
      externalLinks: model.externalLinks
          .map((e) => MediaExternalLinkModel.fromEntity(e))
          .toList(),
    );
  }
}

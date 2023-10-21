import 'dart:convert';

import 'package:aniflow/core/common/model/anime_season.dart';
import 'package:aniflow/core/common/model/anime_source.dart';
import 'package:aniflow/core/common/model/media_status.dart';
import 'package:aniflow/core/common/model/media_type.dart';
import 'package:aniflow/core/data/model/character_and_voice_actor_model.dart';
import 'package:aniflow/core/data/model/media_external_link_model.dart';
import 'package:aniflow/core/data/model/media_title_modle.dart';
import 'package:aniflow/core/data/model/staff_and_role_model.dart';
import 'package:aniflow/core/data/model/trailter_model.dart';
import 'package:aniflow/core/database/model/media_entity.dart';
import 'package:aniflow/core/database/model/relations/media_with_detail_info.dart';
import 'package:aniflow/core/network/model/media_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_model.freezed.dart';

@freezed
class MediaModel with _$MediaModel {
  factory MediaModel({
    @Default('') String id,
    MediaTitle? title,
    @Default(MediaType.anime) MediaType type,
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
    MediaStatus? status,
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
  }) = _MediaModel;

  static MediaModel fromDatabaseModel(MediaEntity model) {
    return MediaModel(
      id: model.id,
      type: model.type != null
          ? MediaType.fromString(model.type!)
          : MediaType.anime,
      title: MediaTitle(
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

  static MediaModel fromAnimeDetailInfo(
    MediaWithDetailInfo model,
  ) {
    return MediaModel.fromDatabaseModel(
      model.mediaEntity,
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

  static MediaModel fromDto(MediaDto dto) {
    final entity = MediaEntity.fromNetworkModel(dto);
    return MediaModel.fromDatabaseModel(entity);
  }
}

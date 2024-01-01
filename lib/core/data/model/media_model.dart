import 'dart:convert';

import 'package:aniflow/core/common/model/anime_season.dart';
import 'package:aniflow/core/common/model/anime_source.dart';
import 'package:aniflow/core/common/model/media_status.dart';
import 'package:aniflow/core/common/model/media_type.dart';
import 'package:aniflow/core/common/util/color_util.dart';
import 'package:aniflow/core/data/model/character_and_voice_actor_model.dart';
import 'package:aniflow/core/data/model/media_cover_image_model.dart';
import 'package:aniflow/core/data/model/media_external_link_model.dart';
import 'package:aniflow/core/data/model/media_relation_model.dart';
import 'package:aniflow/core/data/model/media_title_model.dart';
import 'package:aniflow/core/data/model/staff_and_role_model.dart';
import 'package:aniflow/core/data/model/studio_model.dart';
import 'package:aniflow/core/data/model/trailter_model.dart';
import 'package:aniflow/core/database/model/media_entity.dart';
import 'package:aniflow/core/database/model/relations/media_with_detail_info.dart';
import 'package:aniflow/core/database/util/content_values_util.dart';
import 'package:aniflow/core/network/model/media_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_model.freezed.dart';

@freezed
class MediaModel with _$MediaModel {
  factory MediaModel({
    @Default('') String id,
    MediaTitle? title,
    @Default(MediaType.anime) MediaType type,
    MediaCoverImageModel? coverImage,
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
    bool? isFavourite,
    int? nextAiringEpisode,
    @Default(false) bool isFollowing,
    DateTime? startDate,
    DateTime? endDate,
    @Default([]) List<CharacterAndVoiceActorModel> characterAndVoiceActors,
    @Default([]) List<StaffAndRoleModel> staffs,
    @Default([]) List<MediaExternalLinkModel> externalLinks,
    @Default([]) List<MediaRelationModel> relations,
    @Default([]) List<StudioModel> studios,
  }) = _MediaModel;

  static MediaModel fromDatabaseModel(MediaEntity entity) {
    return MediaModel(
      id: entity.id,
      type: entity.type != null
          ? MediaType.fromJson(entity.type!)
          : MediaType.anime,
      title: MediaTitle(
        english: entity.englishTitle,
        romaji: entity.romajiTitle,
        native: entity.nativeTitle,
      ),
      coverImage: MediaCoverImageModel(
        extraLarge: entity.coverImageExtraLarge,
        large: entity.coverImageLarge,
        medium: entity.coverImageMedium,
        color: ColorUtil.parseColor(entity.coverImageColor),
      ),
      description: entity.description,
      source: entity.source,
      status: entity.status,
      bannerImage: entity.bannerImage,
      averageScore: entity.averageScore,
      favourites: entity.favourites,
      season: entity.season,
      seasonYear: entity.seasonYear,
      episodes: entity.episodes,
      ratedRank: entity.ratedRanking,
      popularRank: entity.popularRanking,
      nextAiringEpisode: entity.nextAiringEpisode,
      timeUntilAiring: entity.timeUntilAiring,
      isFavourite: entity.isFavourite.toBoolean(),
      genres: entity.genres != null
          ? (jsonDecode(entity.genres!) as List<dynamic>?)
                  ?.map((e) => e)
                  .whereType<String>()
                  .toList() ??
              const []
          : const [],
      hashtags: entity.hashtag?.split(' ') ?? [],
      trailerModel: entity.trailerId != null
          ? TrailerModel(
              id: entity.trailerId,
              site: entity.trailerSite,
              thumbnail: entity.trailerThumbnail,
            )
          : null,
      startDate: entity.startDate != null
          ? DateTime.fromMillisecondsSinceEpoch(entity.startDate!)
          : null,
      endDate: entity.endDate != null
          ? DateTime.fromMillisecondsSinceEpoch(entity.endDate!)
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
      relations: model.mediaRelations
          .map((e) => MediaRelationModel.fromEntity(e))
          .toList(),
      studios: model.studios.map((e) => StudioModel.fromEntity(e)).toList(),
    );
  }

  static MediaModel fromDto(MediaDto dto) {
    final entity = MediaEntity.fromNetworkModel(dto);
    return MediaModel.fromDatabaseModel(entity);
  }
}

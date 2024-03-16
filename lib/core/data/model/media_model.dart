
import 'package:aniflow/core/common/model/anime_season.dart';
import 'package:aniflow/core/common/model/anime_source.dart';
import 'package:aniflow/core/common/model/media_status.dart';
import 'package:aniflow/core/common/model/media_type.dart';
import 'package:aniflow/core/data/mappers/media_mapper.dart';
import 'package:aniflow/core/data/model/character_and_voice_actor_model.dart';
import 'package:aniflow/core/data/model/media_cover_image_model.dart';
import 'package:aniflow/core/data/model/media_external_link_model.dart';
import 'package:aniflow/core/data/model/media_relation_model.dart';
import 'package:aniflow/core/data/model/media_title_model.dart';
import 'package:aniflow/core/data/model/staff_and_role_model.dart';
import 'package:aniflow/core/data/model/studio_model.dart';
import 'package:aniflow/core/data/model/trailter_model.dart';
import 'package:aniflow/core/database/mappers/media_mapper.dart';
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
    int? nextAiringEpisode,
    @Default(false) bool isFavourite,
    @Default(false) bool isFollowing,
    DateTime? startDate,
    DateTime? endDate,
    @Default([]) List<CharacterAndVoiceActorModel> characterAndVoiceActors,
    @Default([]) List<StaffAndRoleModel> staffs,
    @Default([]) List<MediaExternalLinkModel> externalLinks,
    @Default([]) List<MediaRelationModel> relations,
    @Default([]) List<StudioModel> studios,
  }) = _MediaModel;

  static MediaModel fromDto(MediaDto dto) {
    return dto.toEntity().toModel();
  }
}

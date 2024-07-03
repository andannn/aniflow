import 'package:aniflow/core/common/definitions/anime_season.dart';
import 'package:aniflow/core/common/definitions/anime_source.dart';
import 'package:aniflow/core/common/definitions/media_format.dart';
import 'package:aniflow/core/common/definitions/media_status.dart';
import 'package:aniflow/core/data/model/media_title_model.dart';
import 'package:aniflow/core/network/model/airing_schedule_dto.dart';
import 'package:aniflow/core/network/model/anime_rank.dart';
import 'package:aniflow/core/network/model/character_connection.dart';
import 'package:aniflow/core/network/model/fuzzy_date_dto.dart';
import 'package:aniflow/core/network/model/media_connection.dart';
import 'package:aniflow/core/network/model/media_cover_image_dto.dart';
import 'package:aniflow/core/network/model/media_external_links_dto.dart';
import 'package:aniflow/core/network/model/staff_connection.dart';
import 'package:aniflow/core/network/model/studio_connection.dart';
import 'package:aniflow/core/network/model/trailer_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_dto.freezed.dart';

part 'media_dto.g.dart';

@freezed
class MediaDto with _$MediaDto {
  factory MediaDto({
    @Default(-1) @JsonKey(name: 'id') int id,
    @JsonKey(name: 'title') MediaTitle? title,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'coverImage') MediaCoverImageDto? coverImage,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'status') MediaStatus? status,
    @JsonKey(name: 'source') AnimeSource? source,
    @JsonKey(name: 'episodes') int? episodes,
    @JsonKey(name: 'seasonYear') int? seasonYear,
    @JsonKey(name: 'season') AnimeSeason? season,
    @JsonKey(name: 'hashtag') String? hashtag,
    @JsonKey(name: 'siteUrl') String? siteUrl,
    @JsonKey(name: 'bannerImage') String? bannerImage,
    @JsonKey(name: 'averageScore') int? averageScore,
    @JsonKey(name: 'trending') int? trending,
    @JsonKey(name: 'favourites') int? favourites,
    @JsonKey(name: 'startDate') FuzzyDateDto? startDate,
    @JsonKey(name: 'format') MediaFormat? format,
    @JsonKey(name: 'endDate') FuzzyDateDto? endDate,
    @Default([]) @JsonKey(name: 'genres') List genres,
    @JsonKey(name: 'trailer') TrailerDto? trailer,
    @JsonKey(name: 'nextAiringEpisode') AiringScheduleDto? nextAiringEpisode,
    @Default([]) @JsonKey(name: 'rankings') List<AnimeRank?> rankings,
    @JsonKey(name: 'characters') CharacterConnection? characters,
    @JsonKey(name: 'staff') StaffConnection? staff,
    @JsonKey(name: 'studios') StudioConnection? studios,
    @JsonKey(name: 'relations') MediaConnection? relations,
    @JsonKey(name: 'isFavourite') bool? isFavourite,
    @Default([])
    @JsonKey(name: 'externalLinks')
    List<MediaExternalLinkDto> externalLinks,
  }) = _MediaDto;

  factory MediaDto.fromJson(Map<String, dynamic> json) =>
      _$$MediaDtoImplFromJson(json);
}

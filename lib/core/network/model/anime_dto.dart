import 'package:aniflow/core/common/model/anime_season.dart';
import 'package:aniflow/core/common/model/anime_source.dart';
import 'package:aniflow/core/common/model/media_status.dart';
import 'package:aniflow/core/data/model/media_title_modle.dart';
import 'package:aniflow/core/network/model/airing_schedule_dto.dart';
import 'package:aniflow/core/network/model/anime_rank.dart';
import 'package:aniflow/core/network/model/character_connection.dart';
import 'package:aniflow/core/network/model/media_external_links_dto.dart';
import 'package:aniflow/core/network/model/staff_connection.dart';
import 'package:aniflow/core/network/model/trailer_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_dto.freezed.dart';
part 'anime_dto.g.dart';

@freezed
class AnimeDto with _$AnimeDto {
  factory AnimeDto({
    @Default(-1) @JsonKey(name: 'id') int id,
    @JsonKey(name: 'title') MediaTitle? title,
    @Default({}) @JsonKey(name: 'coverImage') Map<String, String?> coverImage,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'status') MediaStatus? status,
    @JsonKey(name: 'source') AnimeSource? source,
    @JsonKey(name: 'episodes') int? episodes,
    @JsonKey(name: 'seasonYear') int? seasonYear,
    @JsonKey(name: 'season') AnimeSeason? season,
    @JsonKey(name: 'hashtag') String? hashtag,
    @JsonKey(name: 'bannerImage') String? bannerImage,
    @JsonKey(name: 'averageScore') int? averageScore,
    @JsonKey(name: 'trending') int? trending,
    @JsonKey(name: 'favourites') int? favourites,
    @Default([]) @JsonKey(name: 'genres') List genres,
    @JsonKey(name: 'trailer') TrailerDto? trailer,
    @JsonKey(name: 'nextAiringEpisode') AiringScheduleDto? nextAiringEpisode,
    @Default([]) @JsonKey(name: 'rankings') List<AnimeRank?> rankings,
    @JsonKey(name: 'characters') CharacterConnection? characters,
    @JsonKey(name: 'staff') StaffConnection? staff,
    @Default([])
    @JsonKey(name: 'externalLinks')
    List<MediaExternalLinkDto> externalLinks,
  }) = _AnimeDto;

  factory AnimeDto.fromJson(Map<String, dynamic> json) =>
      _$$_AnimeDtoFromJson(json);
}

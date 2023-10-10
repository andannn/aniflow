import 'package:anime_tracker/core/common/model/anime_season.dart';
import 'package:anime_tracker/core/common/model/anime_source.dart';
import 'package:anime_tracker/core/common/model/anime_status.dart';
import 'package:anime_tracker/core/network/model/airing_schedule_dto.dart';
import 'package:anime_tracker/core/network/model/anime_rank.dart';
import 'package:anime_tracker/core/network/model/media_external_links_dto.dart';
import 'package:anime_tracker/core/network/model/staff_connection.dart';
import 'package:anime_tracker/core/network/model/trailer_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:anime_tracker/core/data/model/anime_title_modle.dart';
import 'package:anime_tracker/core/network/model/character_connection.dart';

part 'detail_anime_dto.freezed.dart';

part 'detail_anime_dto.g.dart';

@freezed
class DetailAnimeDto with _$DetailAnimeDto {
  factory DetailAnimeDto({
    @Default(-1) @JsonKey(name: 'id') int id,
    @JsonKey(name: 'title') AnimeTitle? title,
    @Default({}) @JsonKey(name: 'coverImage') Map<String, String?> coverImage,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'status') AnimeStatus? status,
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
  }) = _DetailAnimeDto;

  factory DetailAnimeDto.fromJson(Map<String, dynamic> json) =>
      _$$_DetailAnimeDtoFromJson(json);
}

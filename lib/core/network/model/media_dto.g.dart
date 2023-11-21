// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MediaDtoImpl _$$MediaDtoImplFromJson(Map<String, dynamic> json) =>
    _$MediaDtoImpl(
      id: json['id'] as int? ?? -1,
      title: json['title'] == null
          ? null
          : MediaTitle.fromJson(json['title'] as Map<String, dynamic>),
      type: json['type'] as String?,
      coverImage: (json['coverImage'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String?),
          ) ??
          const {},
      description: json['description'] as String?,
      status: $enumDecodeNullable(_$MediaStatusEnumMap, json['status']),
      source: $enumDecodeNullable(_$AnimeSourceEnumMap, json['source']),
      episodes: json['episodes'] as int?,
      seasonYear: json['seasonYear'] as int?,
      season: $enumDecodeNullable(_$AnimeSeasonEnumMap, json['season']),
      hashtag: json['hashtag'] as String?,
      bannerImage: json['bannerImage'] as String?,
      averageScore: json['averageScore'] as int?,
      trending: json['trending'] as int?,
      favourites: json['favourites'] as int?,
      genres: json['genres'] as List<dynamic>? ?? const [],
      trailer: json['trailer'] == null
          ? null
          : TrailerDto.fromJson(json['trailer'] as Map<String, dynamic>),
      nextAiringEpisode: json['nextAiringEpisode'] == null
          ? null
          : AiringScheduleDto.fromJson(
              json['nextAiringEpisode'] as Map<String, dynamic>),
      rankings: (json['rankings'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : AnimeRank.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      characters: json['characters'] == null
          ? null
          : CharacterConnection.fromJson(
              json['characters'] as Map<String, dynamic>),
      staff: json['staff'] == null
          ? null
          : StaffConnection.fromJson(json['staff'] as Map<String, dynamic>),
      relations: json['relations'] == null
          ? null
          : MediaConnection.fromJson(json['relations'] as Map<String, dynamic>),
      isFavourite: json['isFavourite'] as bool?,
      externalLinks: (json['externalLinks'] as List<dynamic>?)
              ?.map((e) =>
                  MediaExternalLinkDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$MediaDtoImplToJson(_$MediaDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': instance.type,
      'coverImage': instance.coverImage,
      'description': instance.description,
      'status': _$MediaStatusEnumMap[instance.status],
      'source': _$AnimeSourceEnumMap[instance.source],
      'episodes': instance.episodes,
      'seasonYear': instance.seasonYear,
      'season': _$AnimeSeasonEnumMap[instance.season],
      'hashtag': instance.hashtag,
      'bannerImage': instance.bannerImage,
      'averageScore': instance.averageScore,
      'trending': instance.trending,
      'favourites': instance.favourites,
      'genres': instance.genres,
      'trailer': instance.trailer,
      'nextAiringEpisode': instance.nextAiringEpisode,
      'rankings': instance.rankings,
      'characters': instance.characters,
      'staff': instance.staff,
      'relations': instance.relations,
      'isFavourite': instance.isFavourite,
      'externalLinks': instance.externalLinks,
    };

const _$MediaStatusEnumMap = {
  MediaStatus.finished: 'FINISHED',
  MediaStatus.releasing: 'RELEASING',
  MediaStatus.notYetReleased: 'NOT_YET_RELEASED',
  MediaStatus.cancelled: 'CANCELLED',
  MediaStatus.hiatus: 'HIATUS',
};

const _$AnimeSourceEnumMap = {
  AnimeSource.original: 'ORIGINAL',
  AnimeSource.manga: 'MANGA',
  AnimeSource.lightNovel: 'LIGHT_NOVEL',
  AnimeSource.visualNovel: 'VISUAL_NOVEL',
  AnimeSource.videoGame: 'VIDEO_GAME',
  AnimeSource.other: 'OTHER',
};

const _$AnimeSeasonEnumMap = {
  AnimeSeason.winter: 'WINTER',
  AnimeSeason.spring: 'SPRING',
  AnimeSeason.summer: 'SUMMER',
  AnimeSeason.fall: 'FALL',
};

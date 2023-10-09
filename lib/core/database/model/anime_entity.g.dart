// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AnimeEntity _$$_AnimeEntityFromJson(Map<String, dynamic> json) =>
    _$_AnimeEntity(
      id: json['id'] as String? ?? '',
      englishTitle: json['english_title'] as String? ?? '',
      romajiTitle: json['romaji_title'] as String? ?? '',
      nativeTitle: json['native_title'] as String? ?? '',
      coverImage: json['cover_image'] as String? ?? '',
      coverImageColor: json['cover_image_color'] as String? ?? '',
      hashtag: json['hashtag'] as String?,
      description: json['description'] as String?,
      source: $enumDecodeNullable(_$AnimeSourceEnumMap, json['source']),
      bannerImage: json['banner_image'] as String?,
      averageScore: json['average_score'] as int?,
      trending: json['trending'] as int?,
      favourites: json['favourites'] as int?,
      trailerId: json['trailer_id'] as String?,
      trailerSite: json['trailer_site'] as String?,
      episodes: json['episodes'] as int?,
      seasonYear: json['season_year'] as int?,
      season: $enumDecodeNullable(_$AnimeSeasonEnumMap, json['season']),
      status: $enumDecodeNullable(_$AnimeStatusEnumMap, json['status']),
      genres: json['genres'] as String?,
      trailerThumbnail: json['trailer_thumbnail'] as String?,
      popularRanking: json['popular_ranking'] as int?,
      ratedRanking: json['rated_ranking'] as int?,
      timeUntilAiring: json['timeUntilAiring'] as int?,
      nextAiringEpisode: json['nextAiringEpisode'] as int?,
    );

Map<String, dynamic> _$$_AnimeEntityToJson(_$_AnimeEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'english_title': instance.englishTitle,
      'romaji_title': instance.romajiTitle,
      'native_title': instance.nativeTitle,
      'cover_image': instance.coverImage,
      'cover_image_color': instance.coverImageColor,
      'hashtag': instance.hashtag,
      'description': instance.description,
      'source': _$AnimeSourceEnumMap[instance.source],
      'banner_image': instance.bannerImage,
      'average_score': instance.averageScore,
      'trending': instance.trending,
      'favourites': instance.favourites,
      'trailer_id': instance.trailerId,
      'trailer_site': instance.trailerSite,
      'episodes': instance.episodes,
      'season_year': instance.seasonYear,
      'season': _$AnimeSeasonEnumMap[instance.season],
      'status': _$AnimeStatusEnumMap[instance.status],
      'genres': instance.genres,
      'trailer_thumbnail': instance.trailerThumbnail,
      'popular_ranking': instance.popularRanking,
      'rated_ranking': instance.ratedRanking,
      'timeUntilAiring': instance.timeUntilAiring,
      'nextAiringEpisode': instance.nextAiringEpisode,
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

const _$AnimeStatusEnumMap = {
  AnimeStatus.releasing: 'RELEASING',
  AnimeStatus.finished: 'FINISHED',
  AnimeStatus.notYetReleased: 'NOT_YET_RELEASED',
};

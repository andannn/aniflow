// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MediaEntityImpl _$$MediaEntityImplFromJson(Map<String, dynamic> json) =>
    _$MediaEntityImpl(
      id: json['id'] as String? ?? '',
      type: json['media_type'] as String?,
      englishTitle: json['english_title'] as String? ?? '',
      romajiTitle: json['romaji_title'] as String? ?? '',
      nativeTitle: json['native_title'] as String? ?? '',
      coverImageExtraLarge: json['cover_image_extra_large'] as String? ?? '',
      coverImageLarge: json['cover_image_large'] as String? ?? '',
      coverImageMedium: json['cover_image_medium'] as String? ?? '',
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
      status: $enumDecodeNullable(_$MediaStatusEnumMap, json['status']),
      genres: json['genres'] as String?,
      trailerThumbnail: json['trailer_thumbnail'] as String?,
      isFavourite: json['isFavourite'] as int?,
      popularRanking: json['popular_ranking'] as int?,
      ratedRanking: json['rated_ranking'] as int?,
      timeUntilAiring: json['time_until_airing'] as int?,
      nextAiringEpisode: json['next_airing_episode'] as int?,
      startDate: json['start_date'] as int?,
      endDate: json['end_date'] as int?,
    );

Map<String, dynamic> _$$MediaEntityImplToJson(_$MediaEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'media_type': instance.type,
      'english_title': instance.englishTitle,
      'romaji_title': instance.romajiTitle,
      'native_title': instance.nativeTitle,
      'cover_image_extra_large': instance.coverImageExtraLarge,
      'cover_image_large': instance.coverImageLarge,
      'cover_image_medium': instance.coverImageMedium,
      'cover_image_color': instance.coverImageColor,
      'hashtag': instance.hashtag,
      'description': instance.description,
      'source': instance.source,
      'banner_image': instance.bannerImage,
      'average_score': instance.averageScore,
      'trending': instance.trending,
      'favourites': instance.favourites,
      'trailer_id': instance.trailerId,
      'trailer_site': instance.trailerSite,
      'episodes': instance.episodes,
      'season_year': instance.seasonYear,
      'season': instance.season,
      'status': instance.status,
      'genres': instance.genres,
      'trailer_thumbnail': instance.trailerThumbnail,
      'isFavourite': instance.isFavourite,
      'popular_ranking': instance.popularRanking,
      'rated_ranking': instance.ratedRanking,
      'time_until_airing': instance.timeUntilAiring,
      'next_airing_episode': instance.nextAiringEpisode,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
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

const _$MediaStatusEnumMap = {
  MediaStatus.finished: 'FINISHED',
  MediaStatus.releasing: 'RELEASING',
  MediaStatus.notYetReleased: 'NOT_YET_RELEASED',
  MediaStatus.cancelled: 'CANCELLED',
  MediaStatus.hiatus: 'HIATUS',
};

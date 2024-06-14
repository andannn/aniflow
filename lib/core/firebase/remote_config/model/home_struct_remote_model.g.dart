// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_struct_remote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeStructRemoteModelImpl _$$HomeStructRemoteModelImplFromJson(
        Map<String, dynamic> json) =>
    _$HomeStructRemoteModelImpl(
      anime: (json['anime'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$HomeSectorCategoryEnumMap, e))
              .toList() ??
          const [],
      manga: (json['manga'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$HomeSectorCategoryEnumMap, e))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$HomeStructRemoteModelImplToJson(
        _$HomeStructRemoteModelImpl instance) =>
    <String, dynamic>{
      'anime':
          instance.anime.map((e) => _$HomeSectorCategoryEnumMap[e]!).toList(),
      'manga':
          instance.manga.map((e) => _$HomeSectorCategoryEnumMap[e]!).toList(),
    };

const _$HomeSectorCategoryEnumMap = {
  HomeSectorCategory.upNext: 'upNext',
  HomeSectorCategory.birthdayCharacters: 'birthdayCharacters',
  HomeSectorCategory.todaySchedule: 'todaySchedule',
  HomeSectorCategory.currentSeasonAnime: 'currentSeasonAnime',
  HomeSectorCategory.nextSeasonAnime: 'nextSeasonAnime',
  HomeSectorCategory.trendingAnime: 'trendingAnime',
  HomeSectorCategory.movieAnime: 'movieAnime',
  HomeSectorCategory.trendingManga: 'trendingManga',
  HomeSectorCategory.allTimePopularManga: 'allTimePopularManga',
  HomeSectorCategory.topManhwa: 'topManhwa',
};

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refresh_time_key.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BirthdayCharactersImpl _$$BirthdayCharactersImplFromJson(
        Map<String, dynamic> json) =>
    _$BirthdayCharactersImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$BirthdayCharactersImplToJson(
        _$BirthdayCharactersImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$AiringScheduleImpl _$$AiringScheduleImplFromJson(Map<String, dynamic> json) =>
    _$AiringScheduleImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AiringScheduleImplToJson(
        _$AiringScheduleImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$RecentMoviesImpl _$$RecentMoviesImplFromJson(Map<String, dynamic> json) =>
    _$RecentMoviesImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$RecentMoviesImplToJson(_$RecentMoviesImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$MediaCategoryKeyImpl _$$MediaCategoryKeyImplFromJson(
        Map<String, dynamic> json) =>
    _$MediaCategoryKeyImpl(
      category: $enumDecode(_$MediaCategoryEnumMap, json['category']),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$MediaCategoryKeyImplToJson(
        _$MediaCategoryKeyImpl instance) =>
    <String, dynamic>{
      'category': _$MediaCategoryEnumMap[instance.category]!,
      'runtimeType': instance.$type,
    };

const _$MediaCategoryEnumMap = {
  MediaCategory.currentSeasonAnime: 'currentSeasonAnime',
  MediaCategory.nextSeasonAnime: 'nextSeasonAnime',
  MediaCategory.trendingAnime: 'trendingAnime',
  MediaCategory.movieAnime: 'movieAnime',
  MediaCategory.trendingManga: 'trendingManga',
  MediaCategory.allTimePopularManga: 'allTimePopularManga',
  MediaCategory.topManhwa: 'topManhwa',
};

_$MediaListImpl _$$MediaListImplFromJson(Map<String, dynamic> json) =>
    _$MediaListImpl(
      userId: json['userId'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$MediaListImplToJson(_$MediaListImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'runtimeType': instance.$type,
    };

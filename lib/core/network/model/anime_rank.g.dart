// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_rank.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnimeRankImpl _$$AnimeRankImplFromJson(Map<String, dynamic> json) =>
    _$AnimeRankImpl(
      rank: json['rank'] as int?,
      type: json['type'] as String?,
      allTime: json['allTime'] as bool?,
    );

Map<String, dynamic> _$$AnimeRankImplToJson(_$AnimeRankImpl instance) =>
    <String, dynamic>{
      'rank': instance.rank,
      'type': instance.type,
      'allTime': instance.allTime,
    };

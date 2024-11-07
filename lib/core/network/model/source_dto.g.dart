// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SourceDtoImpl _$$SourceDtoImplFromJson(Map<String, dynamic> json) =>
    _$SourceDtoImpl(
      sources: json['sources'] as String,
      sourcesBackup: json['sourcesBackup'] as String?,
      tracks: (json['tracks'] as List<dynamic>?)
              ?.map((e) => TrackDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      server: (json['server'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SourceDtoImplToJson(_$SourceDtoImpl instance) =>
    <String, dynamic>{
      'sources': instance.sources,
      'sourcesBackup': instance.sourcesBackup,
      'tracks': instance.tracks,
      'server': instance.server,
    };

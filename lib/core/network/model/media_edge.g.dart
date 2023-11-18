// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_edge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MediaEdgeImpl _$$MediaEdgeImplFromJson(Map<String, dynamic> json) =>
    _$MediaEdgeImpl(
      relationType: json['relationType'] == null
          ? MediaRelation.other
          : MediaRelation.fromJson(json['relationType'] as String),
      media: json['node'] == null
          ? null
          : MediaDto.fromJson(json['node'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MediaEdgeImplToJson(_$MediaEdgeImpl instance) =>
    <String, dynamic>{
      'relationType': instance.relationType,
      'node': instance.media,
    };

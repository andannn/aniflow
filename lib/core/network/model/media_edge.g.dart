// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_edge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MediaEdge _$$_MediaEdgeFromJson(Map<String, dynamic> json) => _$_MediaEdge(
      relationType: json['relationType'] == null
          ? MediaRelation.other
          : MediaRelation.fromJson(json['relationType'] as String),
      media: json['node'] == null
          ? null
          : MediaDto.fromJson(json['node'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MediaEdgeToJson(_$_MediaEdge instance) =>
    <String, dynamic>{
      'relationType': instance.relationType,
      'node': instance.media,
    };

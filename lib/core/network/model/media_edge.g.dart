// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_edge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MediaEdge _$$_MediaEdgeFromJson(Map<String, dynamic> json) => _$_MediaEdge(
      relationType:
          $enumDecodeNullable(_$MediaRelationEnumMap, json['relationType']) ??
              MediaRelation.other,
      media: json['node'] == null
          ? null
          : MediaDto.fromJson(json['node'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MediaEdgeToJson(_$_MediaEdge instance) =>
    <String, dynamic>{
      'relationType': _$MediaRelationEnumMap[instance.relationType]!,
      'node': instance.media,
    };

const _$MediaRelationEnumMap = {
  MediaRelation.adaption: 'ADAPTATION',
  MediaRelation.preQuel: 'PREQUEL',
  MediaRelation.sequel: 'SEQUEL',
  MediaRelation.parent: 'PARENT',
  MediaRelation.sideStory: 'SIDE_STORY',
  MediaRelation.character: 'CHARACTER',
  MediaRelation.summary: 'SUMMARY',
  MediaRelation.alternative: 'ALTERNATIVE',
  MediaRelation.spinOff: 'SPIN_OFF',
  MediaRelation.other: 'OTHER',
  MediaRelation.source: 'SOURCE',
  MediaRelation.compilation: 'COMPILATION',
  MediaRelation.contains: 'CONTAINS',
};

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
      characters: (json['characters'] as List<dynamic>?)
              ?.map((e) => CharacterDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      characterRole:
          $enumDecodeNullable(_$CharacterRoleEnumMap, json['characterRole']) ??
              CharacterRole.supporting,
      media: json['node'] == null
          ? null
          : MediaDto.fromJson(json['node'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MediaEdgeImplToJson(_$MediaEdgeImpl instance) =>
    <String, dynamic>{
      'relationType': instance.relationType,
      'characters': instance.characters,
      'characterRole': instance.characterRole,
      'node': instance.media,
    };

const _$CharacterRoleEnumMap = {
  CharacterRole.main: 'MAIN',
  CharacterRole.supporting: 'SUPPORTING',
  CharacterRole.background: 'BACKGROUND',
};

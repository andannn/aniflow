// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_edge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CharacterEdgeImpl _$$CharacterEdgeImplFromJson(Map<String, dynamic> json) =>
    _$CharacterEdgeImpl(
      role: $enumDecodeNullable(_$CharacterRoleEnumMap, json['role']),
      characterNode: json['node'] == null
          ? null
          : CharacterDto.fromJson(json['node'] as Map<String, dynamic>),
      voiceActors: (json['voiceActors'] as List<dynamic>?)
              ?.map((e) => StaffDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CharacterEdgeImplToJson(_$CharacterEdgeImpl instance) =>
    <String, dynamic>{
      'role': instance.role,
      'node': instance.characterNode,
      'voiceActors': instance.voiceActors,
    };

const _$CharacterRoleEnumMap = {
  CharacterRole.main: 'MAIN',
  CharacterRole.supporting: 'SUPPORTING',
  CharacterRole.background: 'BACKGROUND',
};

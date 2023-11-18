// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_edge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CharacterEdge _$$_CharacterEdgeFromJson(Map<String, dynamic> json) =>
    _$_CharacterEdge(
      role: json['role'] == null
          ? null
          : CharacterRole.fromJson(json['role'] as String),
      characterNode: json['node'] == null
          ? null
          : CharacterDto.fromJson(json['node'] as Map<String, dynamic>),
      voiceActors: (json['voiceActors'] as List<dynamic>?)
              ?.map((e) => StaffDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_CharacterEdgeToJson(_$_CharacterEdge instance) =>
    <String, dynamic>{
      'role': instance.role,
      'node': instance.characterNode,
      'voiceActors': instance.voiceActors,
    };

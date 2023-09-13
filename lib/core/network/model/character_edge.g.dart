// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_edge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CharacterEdge _$$_CharacterEdgeFromJson(Map<String, dynamic> json) =>
    _$_CharacterEdge(
      role: json['role'] as String? ?? '',
      characterEdge: json['node'] == null
          ? null
          : ShortInfoNode.fromJson(json['node'] as Map<String, dynamic>),
      voiceActors: (json['voiceActors'] as List<dynamic>?)
              ?.map((e) => ShortInfoNode.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_CharacterEdgeToJson(_$_CharacterEdge instance) =>
    <String, dynamic>{
      'role': instance.role,
      'node': instance.characterEdge,
      'voiceActors': instance.voiceActors,
    };

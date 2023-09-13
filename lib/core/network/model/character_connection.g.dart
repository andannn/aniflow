// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_connection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CharacterConnection _$$_CharacterConnectionFromJson(
        Map<String, dynamic> json) =>
    _$_CharacterConnection(
      pageInfo: json['pageInfo'] == null
          ? null
          : PageInfo.fromJson(json['pageInfo'] as Map<String, dynamic>),
      edges: (json['edges'] as List<dynamic>?)
              ?.map((e) => CharacterEdge.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_CharacterConnectionToJson(
        _$_CharacterConnection instance) =>
    <String, dynamic>{
      'pageInfo': instance.pageInfo,
      'edges': instance.edges,
    };

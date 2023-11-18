// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_connection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CharacterConnectionImpl _$$CharacterConnectionImplFromJson(
        Map<String, dynamic> json) =>
    _$CharacterConnectionImpl(
      pageInfo: json['pageInfo'] == null
          ? null
          : PageInfo.fromJson(json['pageInfo'] as Map<String, dynamic>),
      edges: (json['edges'] as List<dynamic>?)
              ?.map((e) => CharacterEdge.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CharacterConnectionImplToJson(
        _$CharacterConnectionImpl instance) =>
    <String, dynamic>{
      'pageInfo': instance.pageInfo,
      'edges': instance.edges,
    };

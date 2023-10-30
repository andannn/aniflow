// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_connection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MediaConnection _$$_MediaConnectionFromJson(Map<String, dynamic> json) =>
    _$_MediaConnection(
      pageInfo: json['pageInfo'] == null
          ? null
          : PageInfo.fromJson(json['pageInfo'] as Map<String, dynamic>),
      edges: (json['edges'] as List<dynamic>?)
              ?.map((e) => MediaEdge.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_MediaConnectionToJson(_$_MediaConnection instance) =>
    <String, dynamic>{
      'pageInfo': instance.pageInfo,
      'edges': instance.edges,
    };

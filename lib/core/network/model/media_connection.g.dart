// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_connection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MediaConnectionImpl _$$MediaConnectionImplFromJson(
        Map<String, dynamic> json) =>
    _$MediaConnectionImpl(
      pageInfo: json['pageInfo'] == null
          ? null
          : PageInfo.fromJson(json['pageInfo'] as Map<String, dynamic>),
      edges: (json['edges'] as List<dynamic>?)
              ?.map((e) => MediaEdge.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$MediaConnectionImplToJson(
        _$MediaConnectionImpl instance) =>
    <String, dynamic>{
      'pageInfo': instance.pageInfo,
      'edges': instance.edges,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'studio_connection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StudioConnectionImpl _$$StudioConnectionImplFromJson(
        Map<String, dynamic> json) =>
    _$StudioConnectionImpl(
      pageInfo: json['pageInfo'] == null
          ? null
          : PageInfo.fromJson(json['pageInfo'] as Map<String, dynamic>),
      nodes: (json['nodes'] as List<dynamic>?)
              ?.map((e) => StudioDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$StudioConnectionImplToJson(
        _$StudioConnectionImpl instance) =>
    <String, dynamic>{
      'pageInfo': instance.pageInfo,
      'nodes': instance.nodes,
    };

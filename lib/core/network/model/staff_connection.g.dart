// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_connection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StaffConnectionImpl _$$StaffConnectionImplFromJson(
        Map<String, dynamic> json) =>
    _$StaffConnectionImpl(
      pageInfo: json['pageInfo'] == null
          ? null
          : PageInfo.fromJson(json['pageInfo'] as Map<String, dynamic>),
      edges: (json['edges'] as List<dynamic>?)
              ?.map((e) => StaffEdge.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$StaffConnectionImplToJson(
        _$StaffConnectionImpl instance) =>
    <String, dynamic>{
      'pageInfo': instance.pageInfo,
      'edges': instance.edges,
    };

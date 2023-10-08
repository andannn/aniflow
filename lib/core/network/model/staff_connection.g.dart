// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_connection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StaffConnection _$$_StaffConnectionFromJson(Map<String, dynamic> json) =>
    _$_StaffConnection(
      pageInfo: json['pageInfo'] == null
          ? null
          : PageInfo.fromJson(json['pageInfo'] as Map<String, dynamic>),
      edges: (json['edges'] as List<dynamic>?)
              ?.map((e) => StaffEdge.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_StaffConnectionToJson(_$_StaffConnection instance) =>
    <String, dynamic>{
      'pageInfo': instance.pageInfo,
      'edges': instance.edges,
    };

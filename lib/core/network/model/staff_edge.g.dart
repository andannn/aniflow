// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_edge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StaffEdge _$$_StaffEdgeFromJson(Map<String, dynamic> json) => _$_StaffEdge(
      role: json['role'] as String?,
      staffNode: json['node'] == null
          ? null
          : StaffDto.fromJson(json['node'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_StaffEdgeToJson(_$_StaffEdge instance) =>
    <String, dynamic>{
      'role': instance.role,
      'node': instance.staffNode,
    };

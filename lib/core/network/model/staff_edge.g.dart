// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staff_edge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StaffEdgeImpl _$$StaffEdgeImplFromJson(Map<String, dynamic> json) =>
    _$StaffEdgeImpl(
      role: json['role'] as String?,
      staffNode: json['node'] == null
          ? null
          : StaffDto.fromJson(json['node'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$StaffEdgeImplToJson(_$StaffEdgeImpl instance) =>
    <String, dynamic>{
      'role': instance.role,
      'node': instance.staffNode,
    };

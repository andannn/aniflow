// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nodes_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NodesDtoImpl<T> _$$NodesDtoImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$NodesDtoImpl<T>(
      nodes: (json['nodes'] as List<dynamic>?)?.map(fromJsonT).toList() ??
          const [],
    );

Map<String, dynamic> _$$NodesDtoImplToJson<T>(
  _$NodesDtoImpl<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'nodes': instance.nodes.map(toJsonT).toList(),
    };

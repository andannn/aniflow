// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PageInfoImpl _$$PageInfoImplFromJson(Map<String, dynamic> json) =>
    _$PageInfoImpl(
      total: json['total'] as int? ?? -1,
      perPage: json['perPage'] as int? ?? -1,
      currentPage: json['currentPage'] as int? ?? -1,
      lastPage: json['lastPage'] as int? ?? -1,
      hasNextPage: json['hasNextPage'] as bool? ?? true,
    );

Map<String, dynamic> _$$PageInfoImplToJson(_$PageInfoImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'perPage': instance.perPage,
      'currentPage': instance.currentPage,
      'lastPage': instance.lastPage,
      'hasNextPage': instance.hasNextPage,
    };

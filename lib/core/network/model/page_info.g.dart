// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PageInfo _$$_PageInfoFromJson(Map<String, dynamic> json) => _$_PageInfo(
      total: json['total'] as int? ?? -1,
      perPage: json['perPage'] as int? ?? -1,
      currentPage: json['currentPage'] as int? ?? -1,
      lastPage: json['lastPage'] as int? ?? -1,
      hasNextPage: json['hasNextPage'] as bool? ?? true,
    );

Map<String, dynamic> _$$_PageInfoToJson(_$_PageInfo instance) =>
    <String, dynamic>{
      'total': instance.total,
      'perPage': instance.perPage,
      'currentPage': instance.currentPage,
      'lastPage': instance.lastPage,
      'hasNextPage': instance.hasNextPage,
    };

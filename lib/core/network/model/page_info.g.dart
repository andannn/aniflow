// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PageInfoImpl _$$PageInfoImplFromJson(Map<String, dynamic> json) =>
    _$PageInfoImpl(
      total: (json['total'] as num?)?.toInt() ?? -1,
      perPage: (json['perPage'] as num?)?.toInt() ?? -1,
      currentPage: (json['currentPage'] as num?)?.toInt() ?? -1,
      lastPage: (json['lastPage'] as num?)?.toInt() ?? -1,
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

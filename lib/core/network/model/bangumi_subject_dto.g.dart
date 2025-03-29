// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bangumi_subject_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BangumiSubjectDtoImpl _$$BangumiSubjectDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$BangumiSubjectDtoImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      nameCn: json['name_cn'] as String,
    );

Map<String, dynamic> _$$BangumiSubjectDtoImplToJson(
        _$BangumiSubjectDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'name_cn': instance.nameCn,
    };

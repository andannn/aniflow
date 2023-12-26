// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_tag_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MediaTagDtoImpl _$$MediaTagDtoImplFromJson(Map<String, dynamic> json) =>
    _$MediaTagDtoImpl(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      category: json['category'] as String?,
      rank: json['rank'] as String?,
    );

Map<String, dynamic> _$$MediaTagDtoImplToJson(_$MediaTagDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'category': instance.category,
      'rank': instance.rank,
    };

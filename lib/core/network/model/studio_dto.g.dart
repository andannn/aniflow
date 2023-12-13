// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'studio_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StudioDtoImpl _$$StudioDtoImplFromJson(Map<String, dynamic> json) =>
    _$StudioDtoImpl(
      id: json['id'] as int? ?? -1,
      name: json['name'] as String?,
      siteUrl: json['siteUrl'] as String?,
      isAnimationStudio: json['isAnimationStudio'] as bool? ?? false,
      isFavourite: json['isFavourite'] as bool? ?? false,
    );

Map<String, dynamic> _$$StudioDtoImplToJson(_$StudioDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'siteUrl': instance.siteUrl,
      'isAnimationStudio': instance.isAnimationStudio,
      'isFavourite': instance.isFavourite,
    };

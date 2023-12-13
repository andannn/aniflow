// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'studio_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StudioEntityImpl _$$StudioEntityImplFromJson(Map<String, dynamic> json) =>
    _$StudioEntityImpl(
      id: json['studio_id'] as String? ?? '',
      name: json['studio_name'] as String?,
      siteUrl: json['studio_site_url'] as String?,
      isFavourite: json['studio_is_favourite'] as int?,
      isAnimationStudio: json['studio_is_animation_studio'] as int?,
    );

Map<String, dynamic> _$$StudioEntityImplToJson(_$StudioEntityImpl instance) =>
    <String, dynamic>{
      'studio_id': instance.id,
      'studio_name': instance.name,
      'studio_site_url': instance.siteUrl,
      'studio_is_favourite': instance.isFavourite,
      'studio_is_animation_studio': instance.isAnimationStudio,
    };

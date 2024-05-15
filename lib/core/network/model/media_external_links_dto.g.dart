// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_external_links_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MediaExternalLinkDtoImpl _$$MediaExternalLinkDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$MediaExternalLinkDtoImpl(
      id: (json['id'] as num?)?.toInt(),
      url: json['url'] as String?,
      site: json['site'] as String?,
      type: json['type'] as String?,
      siteId: (json['siteId'] as num?)?.toInt(),
      color: json['color'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$$MediaExternalLinkDtoImplToJson(
        _$MediaExternalLinkDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'site': instance.site,
      'type': instance.type,
      'siteId': instance.siteId,
      'color': instance.color,
      'icon': instance.icon,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_external_links_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MediaExternalLinkDto _$$_MediaExternalLinkDtoFromJson(
        Map<String, dynamic> json) =>
    _$_MediaExternalLinkDto(
      id: json['id'] as int?,
      url: json['url'] as String?,
      site: json['site'] as String?,
      type: json['type'] as String?,
      siteId: json['siteId'] as int?,
      color: json['color'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$$_MediaExternalLinkDtoToJson(
        _$_MediaExternalLinkDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'site': instance.site,
      'type': instance.type,
      'siteId': instance.siteId,
      'color': instance.color,
      'icon': instance.icon,
    };

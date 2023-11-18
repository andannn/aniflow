// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_external_link_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MediaExternalLinkEntityImpl _$$MediaExternalLinkEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$MediaExternalLinkEntityImpl(
      id: json['external_link_id'] as String? ?? '',
      animeId: json['external_link_media_id'] as String? ?? '',
      url: json['external_link_url'] as String?,
      site: json['external_link_site'] as String?,
      type: json['external_link_type'] as String?,
      siteId: json['external_link_siteId'] as int?,
      color: json['external_link_color'] as String?,
      icon: json['external_link_icon'] as String?,
    );

Map<String, dynamic> _$$MediaExternalLinkEntityImplToJson(
        _$MediaExternalLinkEntityImpl instance) =>
    <String, dynamic>{
      'external_link_id': instance.id,
      'external_link_media_id': instance.animeId,
      'external_link_url': instance.url,
      'external_link_site': instance.site,
      'external_link_type': instance.type,
      'external_link_siteId': instance.siteId,
      'external_link_color': instance.color,
      'external_link_icon': instance.icon,
    };

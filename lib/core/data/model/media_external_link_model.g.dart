// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_external_link_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MediaExternalLinkModelImpl _$$MediaExternalLinkModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MediaExternalLinkModelImpl(
      url: json['url'] as String? ?? '',
      site: json['site'] as String? ?? '',
      type: $enumDecodeNullable(_$MediaExternalLinkTypeEnumMap, json['type']) ??
          MediaExternalLinkType.info,
      siteId: (json['siteId'] as num?)?.toInt() ?? -1,
      icon: json['icon'] as String? ?? '',
      color: json['color'] as String? ?? '',
    );

Map<String, dynamic> _$$MediaExternalLinkModelImplToJson(
        _$MediaExternalLinkModelImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'site': instance.site,
      'type': instance.type,
      'siteId': instance.siteId,
      'icon': instance.icon,
      'color': instance.color,
    };

const _$MediaExternalLinkTypeEnumMap = {
  MediaExternalLinkType.info: 'INFO',
  MediaExternalLinkType.streaming: 'STREAMING',
  MediaExternalLinkType.social: 'SOCIAL',
};

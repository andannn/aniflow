// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_external_link_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MediaExternalLinkModel _$$_MediaExternalLinkModelFromJson(
        Map<String, dynamic> json) =>
    _$_MediaExternalLinkModel(
      url: json['url'] as String? ?? '',
      site: json['site'] as String? ?? '',
      type: $enumDecodeNullable(_$MediaExternalLinkTypeEnumMap, json['type']) ??
          MediaExternalLinkType.info,
      siteId: json['siteId'] as int? ?? -1,
      icon: json['icon'] as String? ?? '',
      color: json['color'] as String? ?? '',
    );

Map<String, dynamic> _$$_MediaExternalLinkModelToJson(
        _$_MediaExternalLinkModel instance) =>
    <String, dynamic>{
      'url': instance.url,
      'site': instance.site,
      'type': _$MediaExternalLinkTypeEnumMap[instance.type]!,
      'siteId': instance.siteId,
      'icon': instance.icon,
      'color': instance.color,
    };

const _$MediaExternalLinkTypeEnumMap = {
  MediaExternalLinkType.info: 'INFO',
  MediaExternalLinkType.streaming: 'STREAMING',
  MediaExternalLinkType.social: 'SOCIAL',
};

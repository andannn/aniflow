import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_external_links_dto.freezed.dart';

part 'media_external_links_dto.g.dart';

@freezed
class MediaExternalLinkDto with _$MediaExternalLinkDto {
  factory MediaExternalLinkDto({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'url') String? url,
    @JsonKey(name: 'site') String? site,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'siteId') int? siteId,
    @JsonKey(name: 'color') String? color,
    @JsonKey(name: 'icon') String? icon,
  }) = _MediaExternalLinkDto;

  factory MediaExternalLinkDto.fromJson(Map<String, dynamic> json) =>
      _$$MediaExternalLinkDtoImplFromJson(json);
}

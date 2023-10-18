import 'package:anime_tracker/core/database/dao/anime_dao.dart';
import 'package:anime_tracker/core/network/model/media_external_links_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_external_link_entity.freezed.dart';

part 'media_external_link_entity.g.dart';

@freezed
class MediaExternalLinkEntity with _$MediaExternalLinkEntity {
  factory MediaExternalLinkEntity({
    @Default('') @JsonKey(name: MediaExternalLinkColumnValues.id) String id,
    @Default('')
    @JsonKey(name: MediaExternalLinkColumnValues.animeId)
    String animeId,
    @JsonKey(name: MediaExternalLinkColumnValues.url) String? url,
    @JsonKey(name: MediaExternalLinkColumnValues.site) String? site,
    @JsonKey(name: MediaExternalLinkColumnValues.type) String? type,
    @JsonKey(name: MediaExternalLinkColumnValues.siteId) int? siteId,
    @JsonKey(name: MediaExternalLinkColumnValues.color) String? color,
    @JsonKey(name: MediaExternalLinkColumnValues.icon) String? icon,
  }) = _MediaExternalLinkEntity;

  factory MediaExternalLinkEntity.fromJson(Map<String, dynamic> json) =>
      _$$_MediaExternalLinkEntityFromJson(json);

  static MediaExternalLinkEntity fromDto(
      MediaExternalLinkDto dto, String animeId) {
    return MediaExternalLinkEntity(
      id: dto.id.toString(),
      animeId: animeId,
      url: dto.url,
      site: dto.site,
      type: dto.type,
      siteId: dto.siteId,
      icon: dto.icon,
      color: dto.color
    );
  }
}

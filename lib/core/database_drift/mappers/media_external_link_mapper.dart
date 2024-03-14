import 'package:aniflow/core/database_drift/aniflow_database.dart';
import 'package:aniflow/core/network/model/media_external_links_dto.dart';

extension MediaExternalLinkMapper on MediaExternalLinkDto {
  MediaExternalLinkEntity toEntity(String mediaId) {
    return MediaExternalLinkEntity(
        id: id.toString(),
        mediaId: mediaId,
        url: url,
        site: site,
        type: type,
        siteId: siteId,
        icon: icon,
        color: color
    );
  }
}

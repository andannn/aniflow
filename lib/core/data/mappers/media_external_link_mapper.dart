import 'package:aniflow/core/data/model/media_external_link_model.dart';
import 'package:aniflow/core/data/model/media_external_link_type.dart';
import 'package:aniflow/core/database/aniflow_database.dart';

extension MediaExternalLinkMapper on MediaExternalLinkEntity {
  MediaExternalLinkModel toModel() {
    return MediaExternalLinkModel(
      url: url ?? '',
      site: site ?? '',
      type: MediaExternalLinkType.fromJson(type)!,
      siteId: siteId ?? -1,
      icon: icon ?? '',
      color: color ?? '',
    );
  }
}

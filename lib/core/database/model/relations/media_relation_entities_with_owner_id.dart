import 'package:aniflow/core/common/model/media_relation.dart';
import 'package:aniflow/core/database/model/media_entity.dart';
import 'package:aniflow/core/network/model/media_connection.dart';
import 'package:aniflow/core/network/model/media_edge.dart';

class MediaRelationEntity {
  MediaRelationEntity(this.type, this.media);

  final MediaRelation type;
  final MediaEntity media;

  static MediaRelationEntity fromDto(MediaEdge edge) {
    return MediaRelationEntity(
      edge.relationType,
      MediaEntity.fromNetworkModel(edge.media!),
    );
  }
}

class MediaRelationEntitiesWithOwnerId {
  MediaRelationEntitiesWithOwnerId(
      {required this.ownerId, required this.medias});

  final String ownerId;
  final List<MediaRelationEntity> medias;

  static MediaRelationEntitiesWithOwnerId fromDto(
      String ownerId, MediaConnection connection) {
    return MediaRelationEntitiesWithOwnerId(
      ownerId: ownerId,
      medias:
          connection.edges.map((e) => MediaRelationEntity.fromDto(e)).toList(),
    );
  }
}

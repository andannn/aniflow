import 'package:aniflow/core/common/model/media_relation.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/database/model/relations/media_relation_entities_with_owner_id.dart';

class MediaRelationModel {
  MediaRelationModel(this.type, this.media);

  final MediaRelation type;
  final MediaModel media;

  static MediaRelationModel fromEntity(MediaRelationEntity entity) {
    return MediaRelationModel(
      entity.type,
      MediaModel.fromDatabaseModel(entity.media),
    );
  }
}

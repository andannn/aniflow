import 'package:aniflow/core/common/definitions/media_relation.dart';
import 'package:aniflow/core/data/mappers/media_mapper.dart';
import 'package:aniflow/core/data/model/media_relation_model.dart';
import 'package:aniflow/core/database/relations/media_and_relation_type_entity.dart';

extension MediaAndRelationTypeMapper on MediaAndRelationTypeEntity {
  MediaRelationModel toModel() {
    return MediaRelationModel(
      mediaRelation != null
          ? MediaRelation.fromJson(mediaRelation!)
          : MediaRelation.other,
      media.toModel(),
    );
  }
}

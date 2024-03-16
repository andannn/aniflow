import 'package:aniflow/core/common/model/media_relation.dart';
import 'package:aniflow/core/data/model/media_model.dart';

class MediaRelationModel {
  MediaRelationModel(this.type, this.media);

  final MediaRelation type;
  final MediaModel media;
}

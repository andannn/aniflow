import 'package:aniflow/core/common/definitions/media_list_status.dart';
import 'package:aniflow/core/data/mappers/media_mapper.dart';
import 'package:aniflow/core/data/model/anime_list_item_model.dart';
import 'package:aniflow/core/data/model/media_with_list_model.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/mappers/media_list_mapper.dart';
import 'package:aniflow/core/database/relations/media_list_and_media_relation.dart';
import 'package:aniflow/core/network/model/media_list_dto.dart';

extension MediaListMapper on MediaListEntity {
  MediaListItemModel toModel() {
    return MediaListItemModel(
      id: id,
      status: MediaListStatus.fromJson(status),
      score: score,
      progress: progress,
      updatedAt: updatedAt,
      notes: notes,
      progressVolumes: progressVolumes,
      startedAt: startedAt != null
          ? DateTime.fromMillisecondsSinceEpoch(startedAt!)
          : null,
      completedAt: completedAt != null
          ? DateTime.fromMillisecondsSinceEpoch(completedAt!)
          : null,
      repeat: repeat,
      private: private ?? false,
    );
  }
}

extension MediaListAndMediaRelationMapper1 on MediaListAndMediaRelation {
  MediaWithListModel toModel() {
    return MediaWithListModel(
        mediaModel: mediaEntity.toModel(),
        mediaListModel: mediaListEntity?.toModel());
  }
}

extension MediaListAndMediaRelationMapper3 on MediaListDto {
  MediaWithListModel toModel() {
    return toRelation().toModel();
  }
}

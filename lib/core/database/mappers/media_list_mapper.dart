import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/mappers/media_mapper.dart';
import 'package:aniflow/core/database/relations/media_list_and_media_relation.dart';
import 'package:aniflow/core/network/model/fuzzy_date_dto.dart';
import 'package:aniflow/core/network/model/media_list_dto.dart';

extension MediaListMapper on MediaListDto {
  MediaListEntity toEntity() {
    return MediaListEntity(
      id: id.toString(),
      userId: userId.toString(),
      mediaId: media!.id.toString(),
      status: status?.toJson(),
      score: score,
      updatedAt: updatedAt,
      progress: progress,
      progressVolumes: progressVolumes,
      notes: notes,
      startedAt: startedAt.toDateTime()?.millisecondsSinceEpoch,
      completedAt: completedAt.toDateTime()?.millisecondsSinceEpoch,
      repeat: repeat,
      private: private,
    );
  }
}

extension MediaListMapper2 on MediaListDto {
  MediaListAndMediaRelation toRelation() {
    final dto = this;
    return MediaListAndMediaRelation(
      mediaListEntity: dto.toEntity(),
      mediaEntity: dto.media!.toEntity(),
    );
  }
}

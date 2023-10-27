import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/database/model/relations/media_list_and_media_relation.dart';
import 'package:aniflow/core/network/model/media_list_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_list_item_model.freezed.dart';

@freezed
class MediaListItemModel with _$MediaListItemModel {
  factory MediaListItemModel({
    @Default('') String id,
    MediaListStatus? status,
    int? score,
    int? updatedAt,
    int? progress,
    MediaModel? animeModel,
  }) = _MediaListItemModel;

  static MediaListItemModel fromDataBaseModel(MediaListAndMediaRelation model) {
    return MediaListItemModel(
      id: model.mediaListEntity.id,
      status: model.mediaListEntity.status,
      score: model.mediaListEntity.score,
      progress: model.mediaListEntity.progress,
      updatedAt: model.mediaListEntity.updatedAt,
      animeModel: MediaModel.fromDatabaseModel(model.mediaEntity),
    );
  }

  static MediaListItemModel fromDto(MediaListDto dto) {
    final entity = MediaListAndMediaRelation.fromDto(dto);
    return MediaListItemModel.fromDataBaseModel(entity);
  }
}

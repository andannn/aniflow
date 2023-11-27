import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/database/dao/media_list_dao.dart';
import 'package:aniflow/core/database/util/content_values_util.dart';
import 'package:aniflow/core/network/model/fuzzy_date_dto.dart';
import 'package:aniflow/core/network/model/media_list_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'media_list_entity.freezed.dart';

part 'media_list_entity.g.dart';

@freezed
class MediaListEntity with _$MediaListEntity {
  factory MediaListEntity({
    @Default('') @JsonKey(name: MediaListTableColumns.id) String id,
    @JsonKey(name: MediaListTableColumns.userId) String? userId,
    @JsonKey(name: MediaListTableColumns.mediaId) String? animeId,
    @JsonKey(name: MediaListTableColumns.status) MediaListStatus? status,
    @JsonKey(name: MediaListTableColumns.progress) int? progress,
    @JsonKey(name: MediaListTableColumns.progressVolumes) int? progressVolumes,
    @JsonKey(name: MediaListTableColumns.notes) String? notes,
    @JsonKey(name: MediaListTableColumns.startedAt) int? startedAt,
    @JsonKey(name: MediaListTableColumns.completedAt) int? completedAt,
    @JsonKey(name: MediaListTableColumns.score) double? score,
    @JsonKey(name: MediaListTableColumns.updatedAt) int? updatedAt,
    @JsonKey(name: MediaListTableColumns.repeat) int? repeat,
    @JsonKey(name: MediaListTableColumns.private) int? private,
  }) = _MediaListEntity;

  factory MediaListEntity.fromJson(Map<String, dynamic> json) =>
      _$$MediaListEntityImplFromJson(json);

  static MediaListEntity fromNetworkModel(MediaListDto dto) {
    return MediaListEntity(
      id: dto.id.toString(),
      userId: dto.userId.toString(),
      animeId: dto.media?.id.toString(),
      status: dto.status,
      score: dto.score,
      updatedAt: dto.updatedAt,
      progress: dto.progress,
      progressVolumes: dto.progressVolumes,
      notes: dto.notes,
      startedAt: dto.startedAt.toDateTime()?.millisecondsSinceEpoch,
      completedAt: dto.completedAt.toDateTime()?.millisecondsSinceEpoch,
      repeat: dto.repeat,
      private: dto.private.toInteger(),
    );
  }
}

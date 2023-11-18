import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/database/dao/media_list_dao.dart';
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
    @JsonKey(name: MediaListTableColumns.score) int? score,
    @JsonKey(name: MediaListTableColumns.updatedAt) int? updatedAt,
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
    );
  }
}

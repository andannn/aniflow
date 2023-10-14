import 'package:anime_tracker/core/data/ani_list_repository.dart';
import 'package:anime_tracker/core/database/anime_track_list_dao.dart';
import 'package:anime_tracker/core/network/model/media_list_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_track_item_entity.freezed.dart';

part 'anime_track_item_entity.g.dart';

@freezed
class AnimeTrackItemEntity with _$AnimeTrackItemEntity {
  factory AnimeTrackItemEntity({
    @Default('') @JsonKey(name: AnimeTrackItemTableColumns.id) String id,
    @JsonKey(name: AnimeTrackItemTableColumns.userId) String? userId,
    @JsonKey(name: AnimeTrackItemTableColumns.animeId) String? animeId,
    @JsonKey(name: AnimeTrackItemTableColumns.status) AnimeListStatus? status,
    @JsonKey(name: AnimeTrackItemTableColumns.progress) int? progress,
    @JsonKey(name: AnimeTrackItemTableColumns.score) int? score,
    @JsonKey(name: AnimeTrackItemTableColumns.updatedAt) int? updatedAt,
  }) = _AnimeTrackItemEntity;

  factory AnimeTrackItemEntity.fromJson(Map<String, dynamic> json) =>
      _$$_AnimeTrackItemEntityFromJson(json);

  static AnimeTrackItemEntity fromNetworkModel(MediaListDto dto) {
    return AnimeTrackItemEntity(
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

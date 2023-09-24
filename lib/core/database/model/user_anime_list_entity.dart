import 'package:anime_tracker/core/data/repository/anime_track_list_repository.dart';
import 'package:anime_tracker/core/database/user_anime_list_dao.dart';
import 'package:anime_tracker/core/network/model/media_list_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_anime_list_entity.freezed.dart';

part 'user_anime_list_entity.g.dart';

@freezed
class UserAnimeListEntity with _$UserAnimeListEntity {
  factory UserAnimeListEntity({
    @Default('') @JsonKey(name: UserAnimeListTableColumns.id) String id,
    @JsonKey(name: UserAnimeListTableColumns.userId) String? userId,
    @JsonKey(name: UserAnimeListTableColumns.animeId) String? animeId,
    @JsonKey(name: UserAnimeListTableColumns.status) AnimeListStatus? status,
    @JsonKey(name: UserAnimeListTableColumns.progress) int? progress,
    @JsonKey(name: UserAnimeListTableColumns.score) int? score,
    @JsonKey(name: UserAnimeListTableColumns.updatedAt) int? updatedAt,
  }) = _UserAnimeListEntity;

  factory UserAnimeListEntity.fromJson(Map<String, dynamic> json) =>
      _$$_UserAnimeListEntityFromJson(json);

  static UserAnimeListEntity fromNetworkModel(MediaListDto dto) {
    return UserAnimeListEntity(
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

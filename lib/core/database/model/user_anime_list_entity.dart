import 'package:anime_tracker/core/data/repository/user_anime_list_repository.dart';
import 'package:anime_tracker/core/database/user_anime_list_dao.dart';
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
    @JsonKey(name: UserAnimeListTableColumns.score) int? score,
    @JsonKey(name: UserAnimeListTableColumns.updatedAt) int? updatedAt,
  }) = _UserAnimeListEntity;

  factory UserAnimeListEntity.fromJson(Map<String, dynamic> json) =>
      _$$_UserAnimeListEntityFromJson(json);
}

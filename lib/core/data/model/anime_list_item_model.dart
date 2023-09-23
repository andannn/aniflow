import 'package:anime_tracker/core/data/model/anime_model.dart';
import 'package:anime_tracker/core/data/repository/user_anime_list_repository.dart';
import 'package:anime_tracker/core/database/model/relations/user_anime_list_and_anime.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'anime_list_item_model.freezed.dart';

@freezed
class AnimeListItemModel with _$AnimeListItemModel {
  factory AnimeListItemModel({
    @Default('') String id,
    AnimeListStatus? status,
    int? score,
    int? updatedAt,
    int? progress,
    AnimeModel? animeModel,
  }) = _AnimeListItemModel;

  static AnimeListItemModel fromDataBaseModel(UserAnimeListAndAnime model) {
    return AnimeListItemModel(
      id: model.userAnimeListEntity.id,
      status: model.userAnimeListEntity.status,
      score: model.userAnimeListEntity.score,
      progress: model.userAnimeListEntity.progress,
      updatedAt: model.userAnimeListEntity.updatedAt,
      animeModel: AnimeModel.fromDatabaseModel(model.animeEntity),
    );
  }
}

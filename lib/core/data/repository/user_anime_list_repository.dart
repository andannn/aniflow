import 'package:anime_tracker/core/data/model/short_anime_model.dart';
import 'package:anime_tracker/core/data/repository/ani_list_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../model/anime_list_status.dart';

abstract class UserAnimeListRepository {
  /// refresh the category anime table, which will deleted the table and get
  /// data from network data source.
  Future<LoadResult<ShortAnimeModel>> refreshAnimeByCategory();
}

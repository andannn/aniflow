import 'package:anime_tracker/core/common/global_static_constants.dart';
import 'package:anime_tracker/core/data/model/anime_list_item_model.dart';
import 'package:anime_tracker/core/database/anime_database.dart';
import 'package:anime_tracker/core/database/user_anime_list_dao.dart';
import 'package:anime_tracker/core/network/ani_list_data_source.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../model/anime_list_status.dart';

abstract class UserAnimeListRepository {
  Future<List<AnimeListItemModel>> getUserAnimeList(
      {required AnimeListStatus status,
      required int page,
      int? userId,
      int perPage = Config.defaultPerPageCount});
}

class UserAnimeListRepositoryImpl extends UserAnimeListRepository {
  final UserAnimeListDao userAnimeListDao =
      AnimeDatabase().getUserAnimeListDao();
  final AniListDataSource dataSource = AniListDataSource();

  @override
  Future<List<AnimeListItemModel>> getUserAnimeList(
      {required AnimeListStatus status,
      required int page,
      int? userId,
      int perPage = Config.defaultPerPageCount}) {
    
    throw UnimplementedError();
  }
}

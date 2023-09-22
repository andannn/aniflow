import 'package:anime_tracker/core/common/global_static_constants.dart';
import 'package:anime_tracker/core/data/model/anime_list_item_model.dart';
import 'package:anime_tracker/core/data/repository/ani_list_repository.dart';
import 'package:anime_tracker/core/database/anime_dao.dart';
import 'package:anime_tracker/core/database/anime_database.dart';
import 'package:anime_tracker/core/database/model/anime_entity.dart';
import 'package:anime_tracker/core/database/model/user_anime_list_entity.dart';
import 'package:anime_tracker/core/database/user_anime_list_dao.dart';
import 'package:anime_tracker/core/database/user_data_dao.dart';
import 'package:anime_tracker/core/network/ani_list_data_source.dart';
import 'package:anime_tracker/core/network/api/user_anime_list_query.dart';
import 'package:anime_tracker/core/shared_preference/user_data.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../model/anime_list_status.dart';

abstract class UserAnimeListRepository {
  Future<List<AnimeListItemModel>> getUserAnimeList(
      {required List<AnimeListStatus> status,
      required int page,
      int? userId,
      int perPage = Config.defaultPerPageCount});

  Future<LoadResult<void>> syncUserAnimeList(int? userId);
}

class UserAnimeListRepositoryImpl extends UserAnimeListRepository {
  final UserAnimeListDao userAnimeListDao =
      AnimeDatabase().getUserAnimeListDao();
  final UserDataDao userDataDao = AnimeDatabase().getUserDataDao();
  final AnimeListDao animeListDao = AnimeDatabase().getAnimeDao();
  final AniListDataSource dataSource = AniListDataSource();
  final AnimeTrackerPreferences preferences = AnimeTrackerPreferences();

  @override
  Future<List<AnimeListItemModel>> getUserAnimeList(
      {required List<AnimeListStatus> status,
      required int page,
      int? userId,
      int perPage = Config.defaultPerPageCount}) async {
    final targetUserId = userId ?? (await userDataDao.getUserData())?.id;
    if (targetUserId == null) {
      /// No user.
      return [];
    }

    final animeList = await userAnimeListDao.getUserAnimeListByPage(
        targetUserId.toString(), status,
        page: 1, perPage: null);

    return animeList
        .map((e) => AnimeListItemModel.fromDataBaseModel(e))
        .toList();
  }

  @override
  Future<LoadResult<void>> syncUserAnimeList(int? userId) async {
    try {
      final targetUserId = userId ?? (await userDataDao.getUserData())?.id;
      if (targetUserId == null) {
        /// No user.
        return LoadError(Exception('no user'));
      }

      /// get all anime list items from network.
      final networkAnimeList = await dataSource.getUserMediaListPage(
        param: UserAnimeListPageQueryParam(
          page: 1,
          perPage: null,
          userId: int.parse(targetUserId.toString()),
        ),
      );

      /// insert animeList to database.
      final animeListEntity = networkAnimeList
          .map((e) => UserAnimeListEntity.fromNetworkModel(e))
          .toList();
      await userAnimeListDao.insertUserAnimeListEntities(animeListEntity);

      /// insert anime to database.
      final animeEntity = networkAnimeList
          .map<AnimeEntity?>(
            (e) => e.media != null
                ? AnimeEntity.fromShortNetworkModel(e.media!)
                : null,
          )
          .whereType<AnimeEntity>()
          .toList();
      await animeListDao.upsertDetailAnimeInfo(animeEntity);

      return LoadSuccess(data: []);
    } on DioException catch (e) {
      return LoadError(e);
    }
  }
}

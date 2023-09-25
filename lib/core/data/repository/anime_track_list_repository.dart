import 'package:anime_tracker/core/common/global_static_constants.dart';
import 'package:anime_tracker/core/data/model/anime_list_item_model.dart';
import 'package:anime_tracker/core/data/repository/ani_list_repository.dart';
import 'package:anime_tracker/core/database/anime_dao.dart';
import 'package:anime_tracker/core/database/anime_database.dart';
import 'package:anime_tracker/core/database/model/anime_entity.dart';
import 'package:anime_tracker/core/database/model/user_anime_list_entity.dart';
import 'package:anime_tracker/core/database/anime_track_list_dao.dart';
import 'package:anime_tracker/core/database/user_data_dao.dart';
import 'package:anime_tracker/core/network/ani_list_data_source.dart';
import 'package:anime_tracker/core/network/api/user_anime_list_query_graphql.dart';
import 'package:anime_tracker/core/shared_preference/user_data.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../model/anime_list_status.dart';

abstract class AnimeTrackListRepository {
  Future<List<AnimeListItemModel>> getUserAnimeList(
      {required List<AnimeListStatus> status,
        int page = 1,
        int? userId,
        int perPage = Config.defaultPerPageCount});

  Stream<List<AnimeListItemModel>> getUserAnimeListStream(
      {required List<AnimeListStatus> status, required String userId});

  Future<LoadResult<void>> syncUserAnimeList({String? userId});

  Stream<Set<String>> getAnimeListAnimeIdsByUserStream(String userId,
      List<AnimeListStatus> status);

  Stream<bool> getIsTrackingByUserAndIdStream(
      {required String userId, required String animeId});
}

class AnimeTrackListRepositoryImpl extends AnimeTrackListRepository {
  final AnimeTrackListDao animeTrackListDao =
  AnimeDatabase().getUserAnimeListDao();
  final UserDataDao userDataDao = AnimeDatabase().getUserDataDao();
  final AnimeListDao animeListDao = AnimeDatabase().getAnimeDao();
  final AniListDataSource dataSource = AniListDataSource();
  final AniFlowPreferences preferences = AniFlowPreferences();

  @override
  Future<List<AnimeListItemModel>> getUserAnimeList(
      {required List<AnimeListStatus> status,
        int page = 1,
        int? userId,
        int perPage = Config.defaultPerPageCount}) async {
    final targetUserId = userId ?? (await userDataDao.getUserData())?.id;
    if (targetUserId == null) {
      /// No user.
      return [];
    }

    final animeList = await animeTrackListDao.getUserAnimeListByPage(
        targetUserId.toString(), status,
        page: 1, perPage: null);

    return animeList
        .map((e) => AnimeListItemModel.fromDataBaseModel(e))
        .toList();
  }

  @override
  Future<LoadResult<void>> syncUserAnimeList({String? userId}) async {
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
      await animeTrackListDao.insertUserAnimeListEntities(animeListEntity);

      /// insert anime to database.
      final animeEntity = networkAnimeList
          .map<AnimeEntity?>(
            (e) =>
        e.media != null
            ? AnimeEntity.fromDetailNetworkModel(e.media!)
            : null,
      )
          .whereType<AnimeEntity>()
          .toList();
      await animeListDao.upsertDetailAnimeInfo(animeEntity);

      animeTrackListDao.notifyUserAnimeContentChanged(targetUserId);
      return LoadSuccess(data: []);
    } on DioException catch (e) {
      return LoadError(e);
    }
  }

  @override
  Stream<List<AnimeListItemModel>> getUserAnimeListStream(
      {required List<AnimeListStatus> status, required String userId}) {
    return animeTrackListDao.getUserAnimeListStream(userId, status).map(
          (models) =>
          models
              .map((e) => AnimeListItemModel.fromDataBaseModel(e))
              .toList(),
    );
  }

  @override
  Stream<Set<String>> getAnimeListAnimeIdsByUserStream(String userId,
      List<AnimeListStatus> status) {
    return animeTrackListDao.getAnimeListAnimeIdsByUserStream(userId, status);
  }

  @override
  Stream<bool> getIsTrackingByUserAndIdStream(
      {required String userId, required String animeId}) {
    return animeTrackListDao.getIsTrackingByUserAndIdStream(
        userId: userId, animeId: animeId);
  }
}

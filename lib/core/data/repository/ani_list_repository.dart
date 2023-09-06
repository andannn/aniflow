import 'package:anime_tracker/core/data/model/shortcut_anime_model.dart';
import 'package:anime_tracker/core/database/anime_dao.dart';
import 'package:anime_tracker/core/database/model/short_cut_anime_entity.dart';
import 'package:anime_tracker/core/network/ani_list_data_source.dart';
import 'package:anime_tracker/core/network/api/ani_list_graphql.dart';
import 'package:dio/dio.dart';

import '../../database/anime_database.dart';
import 'load_type.dart';

/// defalut page count of anime.
const int defaultPerPageCount = 1;

final AniListRepository aniListRepo = _AniListRepositoryImpl(aniListDataSource, AnimeDatabase().getAnimeDao());

enum AnimeCategory {
  /// current season releasing anime.
  currentSeason,

  /// next season not yet released anime.
  nextSeason,

  /// now trending anime.
  trending,
}

abstract class AniListRepository {
  Future<LoadResult<ShortcutAnimeModel>> refreshAnimeByCategory({required AnimeCategory category});

  Future<LoadResult<ShortcutAnimeModel>> getAnimePageByCategory(
      {required AnimeCategory category, required int page, int perPage = defaultPerPageCount});
}

class _AniListRepositoryImpl extends AniListRepository {
  _AniListRepositoryImpl(this.aniListDataSource, this.animeDao);

  final AniListDataSource aniListDataSource;
  final AnimeDao animeDao;

  @override
  Future<LoadResult<ShortcutAnimeModel>> getAnimePageByCategory(
      {required AnimeCategory category, required int page, int perPage = defaultPerPageCount}) {
    throw UnimplementedError();
  }

  @override
  Future<LoadResult<ShortcutAnimeModel>> refreshAnimeByCategory({required AnimeCategory category}) {
    throw UnimplementedError();
  }

  Future<LoadResult<ShortcutAnimeModel>> _loadAnimePage(
      {required LoadType type, required AnimePageQueryParam animeListParam}) async {
    try {
      switch (type) {
        case LoadType.refresh:

          /// clear the dao when refresh.
          await animeDao.clearAll();

          /// get data from network datasource.
          final networkRes = await aniListDataSource.getNetworkAnimePage(animeListParam: animeListParam);

          /// insert the anime to db.
          final dbAnimeList = networkRes.map((e) => ShortcutAnimeEntity.fromNetworkModel(e)).toList();
          await animeDao.upsertAll(dbAnimeList);

          /// load success, return result.
          return LoadSuccess(dbAnimeList.map((e) => ShortcutAnimeModel.fromDatabaseModel(e)).toList());
        case LoadType.append:
          final dbResult =
              await animeDao.getCurrentSeasonAnimeByPage(page: animeListParam.page, perPage: animeListParam.perPage);
          if (dbResult.length < animeListParam.perPage) {
            /// the data in database is not enough for one page. try to get data from network.
            final networkRes = await aniListDataSource.getNetworkAnimePage(animeListParam: animeListParam);

            /// insert the network data to db.
            final dbAnimeList = networkRes.map((e) => ShortcutAnimeEntity.fromNetworkModel(e)).toList();
            await animeDao.upsertAll(dbAnimeList);

            /// load success, return result.
            return LoadSuccess(dbAnimeList.map((e) => ShortcutAnimeModel.fromDatabaseModel(e)).toList());
          } else {
            /// we have catch in db, return the result.
            return LoadSuccess(dbResult.map((e) => ShortcutAnimeModel.fromDatabaseModel(e)).toList());
          }
      }
    } on DioException catch (e) {
      return LoadError(e);
    }
  }
}

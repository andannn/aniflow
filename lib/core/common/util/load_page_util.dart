import 'package:anime_tracker/core/common/util/global_static_constants.dart';
import 'package:anime_tracker/core/data/load_result.dart';
import 'package:dio/dio.dart';

mixin LoadPageUtil {
  static Future<LoadResult<List<Model>>> loadPage<Dto, Entity, Model>({
    required LoadType type,
    required Future<List<Dto>> Function(int page, int perPage) onGetNetworkRes,
    required Future<void> Function() onClearDbCache,
    required Future<void> Function(List<Entity> entities) onInsertEntityToDB,
    required Future<List<Entity>> Function(int page, int perPage)
        onGetEntityFromDB,
    required Entity Function(Dto dto) mapDtoToEntity,
    required Model Function(Entity dto) mapEntityToModel,
  }) async {
    try {
      switch (type) {
        case Refresh():

          /// get data from network datasource.
          final networkRes =
              await onGetNetworkRes(1, Config.defaultPerPageCount);

          /// insert the anime to db.
          final dbAnimeList = networkRes.map((e) => mapDtoToEntity(e)).toList();

          /// clear and re-insert data when refresh.
          await onClearDbCache();
          await onInsertEntityToDB(dbAnimeList);

          /// load success, return result.
          return LoadSuccess(
              data: dbAnimeList.map((e) => mapEntityToModel(e)).toList());
        case Append(page: int page, perPage: int perPage):
          final dbResult = await onGetEntityFromDB(page, perPage);
          if (dbResult.length < perPage) {
            /// the data in database is not enough for one page.
            /// try to get data from network.
            final networkRes = await onGetNetworkRes(page, perPage);

            /// insert the network data to db.
            final dbAnimeList =
                networkRes.map((e) => mapDtoToEntity(e)).toList();
            await onInsertEntityToDB(dbAnimeList);

            /// load success, return result.
            final newResult = await onGetEntityFromDB(page, perPage);
            return LoadSuccess(
                data: newResult.map((e) => mapEntityToModel(e)).toList());
          } else {
            /// we have catch in db, return the result.
            return LoadSuccess(
                data: dbResult.map((e) => mapEntityToModel(e)).toList());
          }
      }
    } on DioException catch (e) {
      return LoadError(e);
    }
  }

  static Future<LoadResult<List<Model>>> loadPageWithoutCacheDB<Dto, Model>({
    required page,
    required perPage,
    required Future<List<Dto>> Function(int page, int perPage) onGetNetworkRes,
    required Model Function(Dto dto) mapDtoToModel,
  }) async {
    try {
      /// get data from network datasource.
      final networkRes = await onGetNetworkRes(1, Config.defaultPerPageCount);

      /// load success, return result.
      return LoadSuccess(
          data: networkRes.map((e) => mapDtoToModel(e)).toList());
    } on DioException catch (e) {
      return LoadError(e);
    }
  }
}

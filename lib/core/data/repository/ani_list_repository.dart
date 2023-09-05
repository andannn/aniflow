import 'package:anime_tracker/core/data/model/shortcut_anime_model.dart';
import 'package:anime_tracker/core/database/anime_dao.dart';
import 'package:anime_tracker/core/database/model/anime_model.dart';
import 'package:anime_tracker/core/network/ani_list_data_source.dart';
import 'package:dio/dio.dart';

import '../../database/anime_database.dart';
import 'load_type.dart';

const int defaultPerPage = 10;

final AniListRepository aniListRepo =
    _AniListRepositoryImpl(aniListDataSource, AnimeDatabase().getAnimeDao());

abstract class AniListRepository {
  Future<LoadResult<ShortcutAnimeModel>> loadCurrentSeasonAime(
      {required LoadType type,
      required int page,
      int perPage = defaultPerPage});
}

class _AniListRepositoryImpl extends AniListRepository {
  _AniListRepositoryImpl(this.aniListDataSource, this.animeDao);

  final AniListDataSource aniListDataSource;
  final AnimeDao animeDao;

  @override
  Future<LoadResult<ShortcutAnimeModel>> loadCurrentSeasonAime(
      {required LoadType type,
      required int page,
      int perPage = defaultPerPage}) async {
    try {
      final dbResult = await animeDao.getCurrentSeasonAnimeByPage(
          page: page, perPage: perPage);
      if (dbResult.length < defaultPerPage) {
        final networkRes = await aniListDataSource.getNetworkAnimePage(
            page: page,
            perPage: perPage,
            seasonYear: 2023,
            season: AnimeSeason.fall,
            status: AnimeStatus.releasing);

        final dbAnimeList =
            networkRes.map((e) => AnimeModel.fromNetworkModel(e)).toList();
        await animeDao.upsertAll(dbAnimeList);

        return LoadSuccess(dbAnimeList
            .map((e) => ShortcutAnimeModel.fromDatabaseModel(e))
            .toList());
      } else {
        return LoadSuccess(dbResult
            .map((e) => ShortcutAnimeModel.fromDatabaseModel(e))
            .toList());
      }
    } on DioException catch (e) {
      return LoadError(e);
    }
  }
}

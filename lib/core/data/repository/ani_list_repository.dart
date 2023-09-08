import 'package:anime_tracker/core/data/model/shortcut_anime_model.dart';
import 'package:anime_tracker/core/database/anime_dao.dart';
import 'package:anime_tracker/core/database/model/short_cut_anime_entity.dart';
import 'package:anime_tracker/core/network/ani_list_data_source.dart';
import 'package:anime_tracker/core/network/api/ani_list_graphql.dart';
import 'package:anime_tracker/core/shared_preference/user_data.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import 'load_type.dart';

/// default page count of anime.
const int defaultPerPageCount = 9;

enum AnimeCategory {
  /// current season releasing anime.
  currentSeason,

  /// next season not yet released anime.
  nextSeason,

  /// now trending anime.
  trending,
}

/// Bangumi releasing season.
enum AnimeSeason {
  winter('WINTER'),
  spring('SPRING'),
  summer('SUMMER'),
  fall('FALL');

  final String sqlTypeString;

  const AnimeSeason(this.sqlTypeString);
}

/// Bangumi status.
enum AnimeStatus {
  releasing('RELEASING'),
  finished('FINISHED'),
  notYetReleased('NOT_YET_RELEASED');

  final String sqlTypeString;

  const AnimeStatus(this.sqlTypeString);
}

/// parameter present to anime season.
class AnimeSeasonParam extends Equatable {
  final int seasonYear;
  final AnimeSeason season;

  const AnimeSeasonParam({required this.seasonYear, required this.season});

  @override
  List<Object?> get props => [seasonYear, season];
}

/// get next bangumi season.
AnimeSeasonParam getNextSeasonParam(AnimeSeasonParam current) {
  int nextSeasonYear;
  AnimeSeason nextSeason;
  switch (current.season) {
    case AnimeSeason.winter:
      nextSeasonYear = current.seasonYear;
      nextSeason = AnimeSeason.spring;
    case AnimeSeason.spring:
      nextSeasonYear = current.seasonYear;
      nextSeason = AnimeSeason.summer;
    case AnimeSeason.summer:
      nextSeasonYear = current.seasonYear;
      nextSeason = AnimeSeason.fall;
    case AnimeSeason.fall:
      nextSeasonYear = current.seasonYear + 1;
      nextSeason = AnimeSeason.winter;
  }
  return AnimeSeasonParam(
    seasonYear: nextSeasonYear,
    season: nextSeason,
  );
}

/// repository for get anime list.
abstract class AniListRepository {
  /// refresh the category anime table, which will deleted the table and get
  /// data from network data source.
  Future<LoadResult<ShortcutAnimeModel>> refreshAnimeByCategory(
      {required AnimeCategory category});

  /// get data from database or network if database have no data.
  Future<LoadResult<ShortcutAnimeModel>> getAnimePageByCategory(
      {required AnimeCategory category,
      required int page,
      int perPage = defaultPerPageCount});
}

class AniListRepositoryImpl extends AniListRepository {
  AniListRepositoryImpl(
      this.aniListDataSource, this.animeDao, this.preferences);

  final AniListDataSource aniListDataSource;
  final AnimeDao animeDao;
  final AnimeTrackerPreferences preferences;

  @override
  Future<LoadResult<ShortcutAnimeModel>> getAnimePageByCategory(
      {required AnimeCategory category,
      required int page,
      int perPage = defaultPerPageCount}) {
    AnimeStatus? status;
    AnimeSeasonParam? seasonParam;

    AnimeSeasonParam currentSeasonParam = AnimeSeasonParam(
      seasonYear: preferences.getCurrentSeasonYear(),
      season: preferences.getCurrentSeason(),
    );
    switch (category) {
      case AnimeCategory.currentSeason:
        status = AnimeStatus.releasing;
        seasonParam = currentSeasonParam;
      case AnimeCategory.nextSeason:
        status = AnimeStatus.notYetReleased;
        seasonParam = getNextSeasonParam(currentSeasonParam);
      case AnimeCategory.trending:
        status = null;
        seasonParam = null;
    }
    return _loadAnimePage(type: LoadType.append, animeListParam: (
      page: page,
      perPage: perPage,
      seasonYear: seasonParam?.seasonYear,
      season: seasonParam?.season,
      status: status
    ));
  }

  @override
  Future<LoadResult<ShortcutAnimeModel>> refreshAnimeByCategory(
      {required AnimeCategory category}) {
    AnimeStatus? status;
    AnimeSeasonParam? seasonParam;

    AnimeSeasonParam currentSeasonParam = AnimeSeasonParam(
      seasonYear: preferences.getCurrentSeasonYear(),
      season: preferences.getCurrentSeason(),
    );
    switch (category) {
      case AnimeCategory.currentSeason:
        status = AnimeStatus.releasing;
        seasonParam = currentSeasonParam;
      case AnimeCategory.nextSeason:
        status = AnimeStatus.notYetReleased;
        seasonParam = getNextSeasonParam(currentSeasonParam);
      case AnimeCategory.trending:
        status = null;
        seasonParam = null;
    }
    return _loadAnimePage(type: LoadType.append, animeListParam: (
      page: 1,
      perPage: defaultPerPageCount,
      seasonYear: seasonParam?.seasonYear,
      season: seasonParam?.season,
      status: status
    ));
  }

  Future<LoadResult<ShortcutAnimeModel>> _loadAnimePage(
      {required LoadType type,
      required AnimePageQueryParam animeListParam}) async {
    try {
      switch (type) {
        case LoadType.refresh:

          /// clear the dao when refresh.
          await animeDao.clearAll();

          /// get data from network datasource.
          final networkRes = await aniListDataSource.getNetworkAnimePage(
              animeListParam: animeListParam);

          /// insert the anime to db.
          final dbAnimeList = networkRes
              .map((e) => ShortcutAnimeEntity.fromNetworkModel(e))
              .toList();
          await animeDao.upsertAll(dbAnimeList);

          /// load success, return result.
          return LoadSuccess(dbAnimeList
              .map((e) => ShortcutAnimeModel.fromDatabaseModel(e))
              .toList());
        case LoadType.append:
          final dbResult = await animeDao.getCurrentSeasonAnimeByPage(
              page: animeListParam.page, perPage: animeListParam.perPage);
          if (dbResult.length < animeListParam.perPage) {
            /// the data in database is not enough for one page. try to get data from network.
            final networkRes = await aniListDataSource.getNetworkAnimePage(
                animeListParam: animeListParam);

            /// insert the network data to db.
            final dbAnimeList = networkRes
                .map((e) => ShortcutAnimeEntity.fromNetworkModel(e))
                .toList();
            await animeDao.upsertAll(dbAnimeList);

            /// load success, return result.
            return LoadSuccess(dbAnimeList
                .map((e) => ShortcutAnimeModel.fromDatabaseModel(e))
                .toList());
          } else {
            /// we have catch in db, return the result.
            return LoadSuccess(dbResult
                .map((e) => ShortcutAnimeModel.fromDatabaseModel(e))
                .toList());
          }
      }
    } on DioException catch (e) {
      return LoadError(e);
    }
  }
}

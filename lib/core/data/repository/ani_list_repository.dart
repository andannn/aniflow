import 'package:anime_tracker/core/data/model/short_anime_model.dart';
import 'package:anime_tracker/core/database/anime_dao.dart';
import 'package:anime_tracker/core/database/model/anime_entity.dart';
import 'package:anime_tracker/core/network/ani_list_data_source.dart';
import 'package:anime_tracker/core/network/api/ani_list_query_graphql.dart';
import 'package:anime_tracker/core/shared_preference/user_data.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'load_type.dart';

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

/// Bangumi sort.
enum AnimeSort {
  trending('TRENDING_DESC'),
  latestUpdate('UPDATED_AT_DESC');

  final String sqlTypeString;

  const AnimeSort(this.sqlTypeString);
}

/// Anime format
enum AnimeFormat {
  tv(['TV', 'TV_SHORT']),
  movie(['MOVIE']),
  ova(['OVA', 'SPECIAL', 'ONA']);

  final List<String> sqlTypeString;

  const AnimeFormat(this.sqlTypeString);
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
  Future<LoadResult<ShortAnimeModel>> refreshAnimeByCategory(
      {required AnimeCategory category});

  /// get data from database or network if database have no data.
  Future<LoadResult<ShortAnimeModel>> getAnimePageByCategory(
      {required AnimeCategory category,
      required int page,
      int perPage = defaultPerPageCount});
}

class AniListRepositoryImpl extends AniListRepository {
  AniListRepositoryImpl(
      this.aniListDataSource, this.animeDao, this.preferences);

  final AniListDataSource aniListDataSource;
  final AnimeListDao animeDao;
  final AnimeTrackerPreferences preferences;

  @override
  Future<LoadResult<ShortAnimeModel>> getAnimePageByCategory(
      {required AnimeCategory category,
      required int page,
      int perPage = defaultPerPageCount}) {
    return _loadAnimePage(
        category: category,
        type: LoadType.append,
        animeListParam: _createAnimePageQueryParam(
          category,
          page,
          perPage,
          preferences.getCurrentSeason(),
          preferences.getCurrentSeasonYear(),
        ));
  }

  @override
  Future<LoadResult<ShortAnimeModel>> refreshAnimeByCategory(
      {required AnimeCategory category}) {
    return _loadAnimePage(
        category: category,
        type: LoadType.refresh,
        animeListParam: _createAnimePageQueryParam(
          category,
          1,
          defaultPerPageCount,
          preferences.getCurrentSeason(),
          preferences.getCurrentSeasonYear(),
        ));
  }

  AnimePageQueryParam _createAnimePageQueryParam(AnimeCategory category,
      int page, int perPage, AnimeSeason currentSeason, int currentSeasonYear) {
    AnimeStatus? status;
    AnimeSeasonParam? seasonParam;
    List<AnimeSort> sorts = [];
    AnimeFormat? format;

    AnimeSeasonParam currentSeasonParam = AnimeSeasonParam(
      seasonYear: preferences.getCurrentSeasonYear(),
      season: preferences.getCurrentSeason(),
    );
    switch (category) {
      case AnimeCategory.currentSeason:
        status = AnimeStatus.releasing;
        seasonParam = currentSeasonParam;
        // sorts = [AnimeSort.latestUpdate];
        format = AnimeFormat.tv;
      case AnimeCategory.nextSeason:
        status = AnimeStatus.notYetReleased;
        seasonParam = getNextSeasonParam(currentSeasonParam);
        format = AnimeFormat.tv;
      case AnimeCategory.trending:
        status = null;
        seasonParam = null;
        sorts = [AnimeSort.trending];
    }

    return AnimePageQueryParam(
      page: page,
      perPage: perPage,
      seasonYear: seasonParam?.seasonYear,
      season: seasonParam?.season,
      status: status,
      animeSort: sorts,
      animeFormat: format,
    );
  }

  Future<LoadResult<ShortAnimeModel>> _loadAnimePage(
      {required AnimeCategory category,
      required LoadType type,
      required AnimePageQueryParam animeListParam}) async {
    try {
      switch (type) {
        case LoadType.refresh:

          /// get data from network datasource.
          final networkRes = await aniListDataSource.getNetworkAnimePage(
              animeListParam: animeListParam);

          /// insert the anime to db.
          final dbAnimeList = networkRes
              .map((e) => AnimeEntity.fromShortNetworkModel(e))
              .toList();

          /// clear and re-insert data when refresh.
          await animeDao.clearAll();
          await animeDao.upsertByAnimeCategory(category, animeList: dbAnimeList);

          /// load success, return result.
          return LoadSuccess(
              data: dbAnimeList
                  .map((e) => ShortAnimeModel.fromDatabaseModel(e))
                  .toList(),
              page: 1);
        case LoadType.append:
          final dbResult = await animeDao.getAnimeByPage(category,
              page: animeListParam.page, perPage: animeListParam.perPage);
          if (dbResult.length < animeListParam.perPage) {
            /// the data in database is not enough for one page. try to get data from network.
            final networkRes = await aniListDataSource.getNetworkAnimePage(
                animeListParam: animeListParam);

            /// insert the network data to db.
            final dbAnimeList = networkRes
                .map((e) => AnimeEntity.fromShortNetworkModel(e))
                .toList();
            await animeDao.upsertByAnimeCategory(category, animeList: dbAnimeList);

            /// load success, return result.
            final newResult = await animeDao.getAnimeByPage(category,
                page: animeListParam.page, perPage: animeListParam.perPage);
            return LoadSuccess(
                data: newResult
                    .map((e) => ShortAnimeModel.fromDatabaseModel(e))
                    .toList(),
                page: animeListParam.page);
          } else {
            /// we have catch in db, return the result.
            return LoadSuccess(
                data: dbResult
                    .map((e) => ShortAnimeModel.fromDatabaseModel(e))
                    .toList(),
                page: animeListParam.page);
          }
      }
    } on DioException catch (e) {
      return LoadError(e);
    }
  }
}

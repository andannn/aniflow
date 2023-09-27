import 'package:anime_tracker/core/database/anime_database.dart';
import 'package:anime_tracker/core/database/model/character_entity.dart';
import 'package:anime_tracker/core/database/model/voice_actor_entity.dart';
import 'package:anime_tracker/core/network/model/character_edge.dart';
import 'package:anime_tracker/core/network/model/detail_anime_dto.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import 'package:anime_tracker/core/data/model/anime_model.dart';
import 'package:anime_tracker/core/database/anime_dao.dart';
import 'package:anime_tracker/core/database/model/anime_entity.dart';
import 'package:anime_tracker/core/network/ani_list_data_source.dart';
import 'package:anime_tracker/core/network/api/ani_list_query_graphql.dart';
import 'package:anime_tracker/core/shared_preference/user_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:anime_tracker/core/common/global_static_constants.dart';
import 'package:sqflite/sqflite.dart';

part 'load_result.dart';

part '../model/anime_season.dart';

part '../model/character_role.dart';

part '../model/anime_status.dart';

enum AnimeCategory {
  /// current season releasing anime.
  currentSeason,

  /// next season not yet released anime.
  nextSeason,

  /// now trending anime.
  trending,

  /// popular movie.
  movie,
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
  Future<LoadResult<AnimeModel>> refreshAnimeByCategory(
      {required AnimeCategory category});

  /// get data from database or network if database have no data.
  Future<LoadResult<AnimeModel>> getAnimePageByCategory({
    required AnimeCategory category,
    required int page,
    int perPage = Config.defaultPerPageCount,
  });

  Stream<AnimeModel> getDetailAnimeInfoStream(String id);

  Future<LoadResult<void>> startFetchDetailAnimeInfo(String id);
}

class AniListRepositoryImpl extends AniListRepository {
  final AniListDataSource aniListDataSource = AniListDataSource();
  final AnimeListDao animeDao = AnimeDatabase().getAnimeDao();
  final AniFlowPreferences preferences = AniFlowPreferences();

  @override
  Future<LoadResult<AnimeModel>> getAnimePageByCategory(
      {required AnimeCategory category,
      required int page,
      int perPage = Config.defaultPerPageCount}) {
    return _loadAnimePage(
      category: category,
      type: LoadType.append,
      animeListParam: _createAnimePageQueryParam(
        category,
        page,
        perPage,
        preferences.getCurrentSeason(),
        preferences.getCurrentSeasonYear(),
      ),
    );
  }

  @override
  Future<LoadResult<AnimeModel>> refreshAnimeByCategory(
      {required AnimeCategory category}) {
    return _loadAnimePage(
        category: category,
        type: LoadType.refresh,
        animeListParam: _createAnimePageQueryParam(
          category,
          1,
          Config.defaultPerPageCount,
          preferences.getCurrentSeason(),
          preferences.getCurrentSeasonYear(),
        ));
  }

  AnimePageQueryParam _createAnimePageQueryParam(AnimeCategory category,
      int page, int perPage, AnimeSeason currentSeason, int currentSeasonYear) {
    AnimeStatus? status;
    AnimeSeasonParam? seasonParam;
    List<AnimeSort> sorts = [];
    List<AnimeFormat> format = [];

    AnimeSeasonParam currentSeasonParam = AnimeSeasonParam(
      seasonYear: preferences.getCurrentSeasonYear(),
      season: preferences.getCurrentSeason(),
    );
    switch (category) {
      case AnimeCategory.currentSeason:
        status = null;
        seasonParam = currentSeasonParam;
        // sorts = [AnimeSort.latestUpdate];
        format = [AnimeFormat.tv, AnimeFormat.ova];
      case AnimeCategory.nextSeason:
        status = null;
        seasonParam = getNextSeasonParam(currentSeasonParam);
        format = [AnimeFormat.tv, AnimeFormat.ova];
      case AnimeCategory.trending:
        status = null;
        seasonParam = null;
        sorts = [AnimeSort.trending];
      case AnimeCategory.movie:
        status = null;
        seasonParam = null;
        format = [AnimeFormat.movie];
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

  Future<LoadResult<AnimeModel>> _loadAnimePage(
      {required AnimeCategory category,
      required LoadType type,
      required AnimePageQueryParam animeListParam}) async {
    try {
      switch (type) {
        case LoadType.refresh:

          /// get data from network datasource.
          final networkRes = await aniListDataSource.getNetworkAnimePage(
              param: animeListParam);

          /// insert the anime to db.
          final dbAnimeList = networkRes
              .map((e) => AnimeEntity.fromShortNetworkModel(e))
              .toList();

          /// clear and re-insert data when refresh.
          await animeDao.clearAll();
          await animeDao.insertOrIgnoreAnimeByAnimeCategory(category,
              animeList: dbAnimeList);

          /// load success, return result.
          return LoadSuccess(
              data: dbAnimeList
                  .map((e) => AnimeModel.fromDatabaseModel(e))
                  .toList());
        case LoadType.append:
          final dbResult = await animeDao.getAnimeByPage(category,
              page: animeListParam.page, perPage: animeListParam.perPage);
          if (dbResult.length < animeListParam.perPage) {
            /// the data in database is not enough for one page. try to get data from network.
            final networkRes = await aniListDataSource.getNetworkAnimePage(
                param: animeListParam);

            /// insert the network data to db.
            final dbAnimeList = networkRes
                .map((e) => AnimeEntity.fromShortNetworkModel(e))
                .toList();
            await animeDao.insertOrIgnoreAnimeByAnimeCategory(category,
                animeList: dbAnimeList);

            /// load success, return result.
            final newResult = await animeDao.getAnimeByPage(category,
                page: animeListParam.page, perPage: animeListParam.perPage);
            return LoadSuccess(
                data: newResult
                    .map((e) => AnimeModel.fromDatabaseModel(e))
                    .toList());
          } else {
            /// we have catch in db, return the result.
            return LoadSuccess(
                data: dbResult
                    .map((e) => AnimeModel.fromDatabaseModel(e))
                    .toList());
          }
      }
    } on DioException catch (e) {
      return LoadError(e);
    }
  }

  @override
  Stream<AnimeModel> getDetailAnimeInfoStream(String id) {
    return animeDao.getDetailAnimeInfoStream(id).map(
          (entity) => AnimeModel.fromAnimeCharactersAndVoiceActors(entity),
        );
  }

  @override
  Future<LoadResult<void>> startFetchDetailAnimeInfo(String id) async {
    try {
      /// fetch anime info from network.
      DetailAnimeDto networkResult = await aniListDataSource.getNetworkAnime(
        id: int.parse(id),
      );

      /// insert anime info to db.
      await animeDao.upsertAnimeInformation(
          [AnimeEntity.fromDetailNetworkModel(networkResult)],
          conflictAlgorithm: ConflictAlgorithm.replace);

      final List<CharacterEdge> characters =
          networkResult.characters?.edges ?? [];
      if (characters.isEmpty) {
        /// no character, return success immediately.
        return LoadSuccess(data: []);
      }

      /// inset character entities to db.
      final List<CharacterEntity> characterEntities = characters
          .map(
            (e) => CharacterEntity.fromNetworkModel(e),
          )
          .toList();
      await animeDao.upsertCharacterInfo(characterEntities);

      /// inset voice actor entities to db.
      final List<VoiceActorEntity> voiceActorEntities = characters
          .map(
            (e) => VoiceActorEntity.fromNetworkModel(e),
          )
          .whereType<VoiceActorEntity>()
          .toList();
      await animeDao.upsertVoiceActorInfo(voiceActorEntities);

      /// Set crossRefs to anime and characters.
      await animeDao.upsertAnimeCharacterCrossRef(
        crossRefs: characters
            .map(
              (e) => AnimeCharacterCrossRef(
                animeId: id.toString(),
                characterId: e.characterEdge!.id.toString(),
              ),
            )
            .toList(),
      );

      /// notify data base has been changed an trigger the streams.
      animeDao.notifyAnimeDetailInfoChanged();
      return LoadSuccess(data: []);
    } on DioException catch (e) {
      return LoadError(e);
    }
  }
}

import 'package:anime_tracker/core/common/model/anime_category.dart';
import 'package:anime_tracker/core/data/load_result.dart';
import 'package:anime_tracker/core/data/model/airing_schedule_and_anime_model.dart';
import 'package:anime_tracker/core/data/model/airing_schedule_model.dart';
import 'package:anime_tracker/core/database/anime_database.dart';
import 'package:anime_tracker/core/database/model/airing_schedules_entity.dart';
import 'package:anime_tracker/core/database/model/character_entity.dart';
import 'package:anime_tracker/core/database/model/media_external_link_entity.dart';
import 'package:anime_tracker/core/database/model/staff_entity.dart';
import 'package:anime_tracker/core/network/api/airing_schedules_query_graphql.dart.dart';
import 'package:anime_tracker/core/network/model/character_edge.dart';
import 'package:anime_tracker/core/network/model/detail_anime_dto.dart';
import 'package:anime_tracker/core/network/model/media_external_links_dto.dart';
import 'package:anime_tracker/core/network/model/staff_edge.dart';
import 'package:anime_tracker/core/common/util/time_util.dart';
import 'package:dio/dio.dart';

import 'package:anime_tracker/core/data/model/anime_model.dart';
import 'package:anime_tracker/core/database/anime_dao.dart';
import 'package:anime_tracker/core/database/model/anime_entity.dart';
import 'package:anime_tracker/core/network/ani_list_data_source.dart';
import 'package:anime_tracker/core/network/api/ani_list_query_graphql.dart';
import 'package:anime_tracker/core/shared_preference/user_data.dart';

import 'package:anime_tracker/core/common/util/global_static_constants.dart';
import 'package:anime_tracker/core/network/util/http_status_util.dart';
import 'package:sqflite/sqflite.dart';

/// repository for get anime list.
abstract class MediaInformationRepository {
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

  /// Get all the airing schedule of the day of [dateTime].
  Future<List<AiringScheduleAndAnimeModel>> getAiringScheduleAndAnimeByDateTime(
      DateTime dateTime);

  /// Refresh airing schedule data in range of [now - dayAgo, not + dayAfter].
  /// The ani list api restrict the count to 50. so maybe we can only get
  /// one or two days airing schedule when using this method.
  Future<LoadResult<void>> refreshAiringSchedule(DateTime now,
      {int dayAgo = 0, int dayAfter = 0});
}

class MediaInformationRepositoryImpl extends MediaInformationRepository {
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
      animeListParam: createAnimePageQueryParam(
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
        animeListParam: createAnimePageQueryParam(
          category,
          1,
          Config.defaultPerPageCount,
          preferences.getCurrentSeason(),
          preferences.getCurrentSeasonYear(),
        ));
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
          (entity) => AnimeModel.fromAnimeDetailInfo(entity),
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
      if (characters.isNotEmpty) {
        /// inset character entities to db.
        final List<CharacterEntity> characterEntities = characters
            .map(
              (e) => CharacterEntity.fromNetworkModel(e),
            )
            .toList();
        await animeDao.upsertCharacterInfo(characterEntities);

        /// inset voice actor entities to db.
        final List<StaffEntity> voiceActorEntities = characters
            .map(
              (e) => StaffEntity.fromVoiceActorDto(e),
            )
            .whereType<StaffEntity>()
            .toList();
        await animeDao.upsertStaffInfo(voiceActorEntities);

        /// Set crossRefs to anime and characters.
        await animeDao.upsertAnimeCharacterCrossRef(
          crossRefs: characters
              .map(
                (e) => AnimeCharacterCrossRef(
                  animeId: id.toString(),
                  characterId: e.characterNode!.id.toString(),
                ),
              )
              .toList(),
        );
      }

      final List<StaffEdge> staffs = networkResult.staff?.edges ?? [];
      if (staffs.isNotEmpty) {
        /// inset staff entities to db.
        final List<StaffEntity> staffEntities = staffs
            .map(
              (e) => StaffEntity.fromStaffDto(e),
            )
            .toList();
        await animeDao.upsertStaffInfo(staffEntities);

        /// Set crossRefs to anime and staff.
        await animeDao.upsertAnimeStaffCrossRef(
          crossRefs: staffs
              .map(
                (e) => AnimeStaffCrossRef(
                  animeId: id.toString(),
                  staffId: e.staffNode!.id.toString(),
                  staffRole: e.role.toString(),
                ),
              )
              .toList(),
        );
      }

      final List<MediaExternalLinkDto> externalLinks =
          networkResult.externalLinks;
      /// insert external links to database.
      if (externalLinks.isNotEmpty) {
        final linkEntities = externalLinks
            .map(
              (e) => MediaExternalLinkEntity.fromDto(e, id),
            )
            .toList();
        await animeDao.upsertMediaExternalLinks(externalLinks: linkEntities);
      }

      /// notify data base has been changed an trigger the streams.
      animeDao.notifyAnimeDetailInfoChanged();
      return LoadSuccess(data: []);
    } on DioException catch (e) {
      return LoadError(e);
    }
  }

  @override
  Future<List<AiringScheduleAndAnimeModel>> getAiringScheduleAndAnimeByDateTime(
      DateTime dateTime) async {
    final (startMs, endMs) = TimeUtil.getTimeRangeOfTheTargetDay(dateTime);
    final entities = await animeDao
        .getAiringSchedulesByTimeRange(timeRange: (startMs, endMs));

    return entities
        .map(
          (e) => AiringScheduleAndAnimeModel(
            airingSchedule: AiringScheduleModel.fromEntity(e.airingSchedule),
            animeModel: AnimeModel.fromDatabaseModel(e.anime),
          ),
        )
        .toList();
  }

  @override
  Future<LoadResult<void>> refreshAiringSchedule(DateTime now,
      {int dayAgo = 0, int dayAfter = 0}) async {
    try {
      final (startMs, endMs) =
          TimeUtil.getTimeRange(now, daysAgo: dayAgo, daysAfter: dayAfter);

      /// Get all airing schedule from network source.
      final networkResults = await aniListDataSource.getAiringSchedules(
        AiringSchedulesQueryParam(
            airingAtGreater: startMs ~/ 1000, airingAtLesser: endMs ~/ 1000),
      );

      /// insert airing schedule data to db.
      final scheduleEntities =
          networkResults.map((e) => AiringSchedulesEntity.fromDto(e)).toList();
      await animeDao.upsertAiringSchedules(schedules: scheduleEntities);

      /// insert anime data to db if not exist.
      final animeEntities = networkResults
          .map((e) => AnimeEntity.fromShortNetworkModel(e.media!))
          .toList();
      await animeDao.upsertAnimeInformation(animeEntities,
          conflictAlgorithm: ConflictAlgorithm.ignore);

      return LoadSuccess(data: []);
    } on NetworkException catch (exception) {
      return LoadError(exception);
    }
  }
}

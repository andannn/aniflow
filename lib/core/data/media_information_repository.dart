import 'package:aniflow/core/common/model/anime_category.dart';
import 'package:aniflow/core/common/util/load_page_util.dart';
import 'package:aniflow/core/common/util/time_util.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/model/airing_schedule_and_anime_model.dart';
import 'package:aniflow/core/data/model/airing_schedule_model.dart';
import 'package:aniflow/core/data/model/character_and_voice_actor_model.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/staff_and_role_model.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/dao/media_dao.dart';
import 'package:aniflow/core/database/model/airing_schedules_entity.dart';
import 'package:aniflow/core/database/model/character_entity.dart';
import 'package:aniflow/core/database/model/media_entity.dart';
import 'package:aniflow/core/database/model/media_external_link_entity.dart';
import 'package:aniflow/core/database/model/relations/character_and_voice_actor_relation.dart';
import 'package:aniflow/core/database/model/relations/staff_and_role_relation.dart';
import 'package:aniflow/core/database/model/staff_entity.dart';
import 'package:aniflow/core/network/ani_list_data_source.dart';
import 'package:aniflow/core/network/api/airing_schedules_query_graphql.dart.dart';
import 'package:aniflow/core/network/api/media_page_query_graphql.dart';
import 'package:aniflow/core/network/model/anime_dto.dart';
import 'package:aniflow/core/network/model/character_edge.dart';
import 'package:aniflow/core/network/model/media_external_links_dto.dart';
import 'package:aniflow/core/network/model/staff_edge.dart';
import 'package:aniflow/core/network/util/http_status_util.dart';
import 'package:aniflow/core/shared_preference/aniflow_prefrences.dart';
import 'package:dio/dio.dart';
import 'package:sqflite/sqflite.dart';

/// repository for get anime list.
abstract class MediaInformationRepository {
  Future<LoadResult<List<MediaModel>>> loadAnimePageByCategory({
    required MediaCategory category,
    required LoadType loadType,
  });

  Future<LoadResult<List<CharacterAndVoiceActorModel>>>
      loadCharacterPageByAnimeId({
    required String animeId,
    required LoadType loadType,
  });

  Future<LoadResult<List<StaffAndRoleModel>>> loadStaffPageByAnimeId({
    required String animeId,
    required LoadType loadType,
  });

  Stream<MediaModel> getDetailAnimeInfoStream(String id);

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
  final MediaInformationDao animeDao =
      AniflowDatabase().getMediaInformationDaoDao();
  final AniFlowPreferences preferences = AniFlowPreferences();

  @override
  Future<LoadResult<List<MediaModel>>> loadAnimePageByCategory(
      {required MediaCategory category, required LoadType loadType}) {
    return LoadPageUtil.loadPage(
      type: loadType,
      onGetNetworkRes: (page, perPage) => aniListDataSource.getNetworkAnimePage(
        page: page,
        perPage: perPage,
        param: createAnimePageQueryParam(
          category,
          preferences.getCurrentSeason(),
          preferences.getCurrentSeasonYear(),
        ),
      ),
      onGetEntityFromDB: (page, perPage) =>
          animeDao.getMediaByPage(category, page: page, perPage: perPage),
      onInsertEntityToDB: (entities) => animeDao
          .insertOrIgnoreMediaByAnimeCategory(category, animeList: entities),
      onClearDbCache: () => animeDao.clearAnimeCategoryCrossRef(category),
      mapDtoToEntity: (dto) => MediaEntity.fromNetworkModel(dto),
      mapEntityToModel: (entity) => MediaModel.fromDatabaseModel(entity),
    );
  }

  @override
  Future<LoadResult<List<CharacterAndVoiceActorModel>>>
      loadCharacterPageByAnimeId(
          {required String animeId, required LoadType loadType}) async {
    return LoadPageUtil.loadPage(
      type: loadType,
      onGetNetworkRes: (page, perPage) => aniListDataSource.getCharacterPage(
          animeId: int.parse(animeId), page: page, perPage: perPage),
      onClearDbCache: () => animeDao.clearMediaCharacterCrossRef(animeId),
      onInsertEntityToDB: (entities) => animeDao.insertCharacterVoiceActors(
          mediaId: int.parse(animeId), entities: entities),
      onGetEntityFromDB: (page, perPage) => animeDao.getCharacterOfMediaByPage(
        animeId.toString(),
        page: page,
        perPage: perPage,
      ),
      mapDtoToEntity: (dto) => CharacterAndVoiceActorRelation(
        characterEntity: CharacterEntity.fromNetworkModel(dto),
        voiceActorEntity: StaffEntity.fromVoiceActorDto(dto),
      ),
      mapEntityToModel: (entity) =>
          CharacterAndVoiceActorModel.fromDatabaseEntity(entity),
    );
  }

  @override
  Future<LoadResult<List<StaffAndRoleModel>>> loadStaffPageByAnimeId(
      {required String animeId, required LoadType loadType}) {
    return LoadPageUtil.loadPage(
      type: loadType,
      onGetNetworkRes: (page, perPage) => aniListDataSource.getStaffPage(
          animeId: int.parse(animeId), page: page, perPage: perPage),
      onClearDbCache: () async {},
      onInsertEntityToDB: (entities) => animeDao.insertStaffEntities(
          mediaId: int.parse(animeId), entities: entities),
      onGetEntityFromDB: (page, perPage) => animeDao.getStaffOfMediaByPage(
        animeId.toString(),
        page: page,
        perPage: perPage,
      ),
      mapDtoToEntity: (dto) => StaffAndRoleRelation(
        staff: StaffEntity.fromStaffDto(dto),
        role: dto.role ?? '',
      ),
      mapEntityToModel: (entity) =>
          StaffAndRoleModel.fromDatabaseEntity(entity),
    );
  }

  @override
  Stream<MediaModel> getDetailAnimeInfoStream(String id) {
    return animeDao.getDetailMediaInfoStream(id).map(
          (entity) => MediaModel.fromAnimeDetailInfo(entity),
        );
  }

  @override
  Future<LoadResult<void>> startFetchDetailAnimeInfo(String id) async {
    try {
      /// fetch anime info from network.
      AnimeDto networkResult = await aniListDataSource.getNetworkAnime(
        id: int.parse(id),
      );

      /// insert anime info to db.
      await animeDao.upsertMediaInformation(
          [MediaEntity.fromNetworkModel(networkResult)],
          conflictAlgorithm: ConflictAlgorithm.replace);

      final List<CharacterEdge> characters =
          networkResult.characters?.edges ?? [];
      if (characters.isNotEmpty) {
        await animeDao.clearMediaCharacterCrossRef(id);

        /// inset character entities to db.
        final List<CharacterAndVoiceActorRelation> characterAndVoiceActors =
            characters
                .map(
                  (e) => CharacterAndVoiceActorRelation(
                    characterEntity: CharacterEntity.fromNetworkModel(e),
                    voiceActorEntity: StaffEntity.fromVoiceActorDto(e),
                  ),
                )
                .toList();

        await animeDao.insertCharacterVoiceActors(
            mediaId: int.parse(id), entities: characterAndVoiceActors);
      }

      final List<StaffEdge> staffs = networkResult.staff?.edges ?? [];
      if (staffs.isNotEmpty) {
        /// inset staff entities to db.
        final List<StaffAndRoleRelation> entities = staffs
            .map(
              (e) => StaffAndRoleRelation(
                staff: StaffEntity.fromStaffDto(e),
                role: e.role ?? '',
              ),
            )
            .toList();
        await animeDao.insertStaffEntities(
            mediaId: int.parse(id), entities: entities);
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
      animeDao.notifyMediaDetailInfoChanged();
      return LoadSuccess(data: null);
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
            animeModel: MediaModel.fromDatabaseModel(e.mediaEntity),
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
          .map((e) => MediaEntity.fromNetworkModel(e.media!))
          .toList();
      await animeDao.upsertMediaInformation(animeEntities,
          conflictAlgorithm: ConflictAlgorithm.ignore);

      return LoadSuccess(data: null);
    } on NetworkException catch (exception) {
      return LoadError(exception);
    }
  }
}

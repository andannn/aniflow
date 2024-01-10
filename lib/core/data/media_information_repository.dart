import 'package:aniflow/core/common/model/anime_category.dart';
import 'package:aniflow/core/common/model/media_sort.dart';
import 'package:aniflow/core/common/model/staff_language.dart';
import 'package:aniflow/core/common/util/load_page_util.dart';
import 'package:aniflow/core/common/util/time_util.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/model/airing_schedule_and_anime_model.dart';
import 'package:aniflow/core/data/model/airing_schedule_model.dart';
import 'package:aniflow/core/data/model/character_and_voice_actor_model.dart';
import 'package:aniflow/core/data/model/character_model.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/staff_and_role_model.dart';
import 'package:aniflow/core/data/model/staff_character_and_media_connection.dart';
import 'package:aniflow/core/data/model/staff_model.dart';
import 'package:aniflow/core/data/model/studio_model.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/model/airing_schedules_entity.dart';
import 'package:aniflow/core/database/model/character_entity.dart';
import 'package:aniflow/core/database/model/media_entity.dart';
import 'package:aniflow/core/database/model/media_external_link_entity.dart';
import 'package:aniflow/core/database/model/relations/character_and_related_media.dart';
import 'package:aniflow/core/database/model/relations/character_and_voice_actor_relation.dart';
import 'package:aniflow/core/database/model/relations/media_relation_entities_with_owner_id.dart';
import 'package:aniflow/core/database/model/relations/staff_and_role_relation.dart';
import 'package:aniflow/core/database/model/staff_entity.dart';
import 'package:aniflow/core/database/model/studio_entity.dart';
import 'package:aniflow/core/network/ani_list_data_source.dart';
import 'package:aniflow/core/network/api/airing_schedules_query_graphql.dart.dart';
import 'package:aniflow/core/network/api/media_page_query_graphql.dart';
import 'package:aniflow/core/network/model/character_edge.dart';
import 'package:aniflow/core/network/model/media_connection.dart';
import 'package:aniflow/core/network/model/media_dto.dart';
import 'package:aniflow/core/network/model/media_edge.dart';
import 'package:aniflow/core/network/model/media_external_links_dto.dart';
import 'package:aniflow/core/network/model/staff_edge.dart';
import 'package:aniflow/core/network/model/studio_dto.dart';
import 'package:aniflow/core/network/util/http_status_util.dart';
import 'package:aniflow/core/shared_preference/aniflow_preferences.dart';
import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:sqflite/sqflite.dart';

/// repository for get anime list.
abstract class MediaInformationRepository {
  Future<LoadResult<List<MediaModel>>> loadMediaPageByCategory({
    required MediaCategory category,
    required LoadType loadType,
    CancelToken? token,
  });

  Future<LoadResult<List<CharacterAndVoiceActorModel>>>
      loadCharacterPageByAnimeId({
    required String animeId,
    required StaffLanguage language,
    required LoadType loadType,
    CancelToken? token,
  });

  Future<LoadResult<List<StaffAndRoleModel>>> loadStaffPageByAnimeId({
    required String animeId,
    required LoadType loadType,
    CancelToken? token,
  });

  Stream<MediaModel> getDetailAnimeInfoStream(String id);

  Future<LoadResult<void>> startFetchDetailAnimeInfo(
      {required String id, CancelToken? token});

  /// Get all the airing schedule of the day of [dateTime].
  Future<List<AiringScheduleAndAnimeModel>> getAiringScheduleAndAnimeByDateTime(
      DateTime dateTime);

  /// Refresh airing schedule data in range of [now - dayAgo, not + dayAfter].
  /// The ani list api restrict the count to 50. so maybe we can only get
  /// one or two days airing schedule when using this method.
  Future<LoadResult<void>> refreshAiringSchedule(
    DateTime now, {
    int dayAgo = 0,
    int dayAfter = 0,
    CancelToken? token,
  });

  Future<LoadResult<void>> startFetchDetailCharacterInfo(
      {required String id, CancelToken? token});

  Stream<CharacterModel> getDetailCharacterStream(String id);

  Future<LoadResult<void>> startFetchDetailStaffInfo(
      {required String id, CancelToken? token});

  Stream<StaffModel?> getDetailStaffStream(String id);

  Future<LoadResult<List<CharacterAndMediaConnection>>>
      loadVoiceActorContentsPage({
    required int page,
    required int perPage,
    required String staffId,
    required MediaSort mediaSort,
    CancelToken? token,
  });

  Stream<StudioModel?> getStudioStream(String id);

  Future<LoadResult<void>> startFetchDetailStudioInfo(
      {required String id, required CancelToken token});

  Future<LoadResult<List<MediaModel>>> loadStudioContentsPage({
    required int page,
    required int perPage,
    required String studioId,
    CancelToken? token,
  });
}

class MediaInformationRepositoryImpl extends MediaInformationRepository {
  final AniListDataSource dataSource = AniListDataSource();

  final mediaDao = AniflowDatabase().getMediaDao();
  final characterDao = AniflowDatabase().getCharacterDao();
  final staffDao = AniflowDatabase().getStaffDao();
  final studioDao = AniflowDatabase().getStudioDao();
  final airingScheduleDao = AniflowDatabase().getAiringScheduleDao();

  final AniFlowPreferences preferences = AniFlowPreferences();

  @override
  Future<LoadResult<List<MediaModel>>> loadMediaPageByCategory({
    required MediaCategory category,
    required LoadType loadType,
    CancelToken? token,
  }) {
    return LoadPageUtil.loadPage(
      type: loadType,
      onGetNetworkRes: (page, perPage) => dataSource.getNetworkAnimePage(
        page: page,
        perPage: perPage,
        token: token,
        param: createAnimePageQueryParam(
            category,
            preferences.getCurrentSeason(),
            preferences.getCurrentSeasonYear(),
            preferences.getAniListSettings().displayAdultContent),
      ),
      onGetEntityFromDB: (page, perPage) =>
          mediaDao.getMediaByPage(category, page: page, perPage: perPage),
      onInsertEntityToDB: (entities) => mediaDao
          .insertOrIgnoreMediaByAnimeCategory(category, animeList: entities),
      onClearDbCache: () => mediaDao.clearAnimeCategoryCrossRef(category),
      mapDtoToEntity: (dto) => MediaEntity.fromNetworkModel(dto),
      mapEntityToModel: (entity) => MediaModel.fromDatabaseModel(entity),
    );
  }

  @override
  Future<LoadResult<List<CharacterAndVoiceActorModel>>>
      loadCharacterPageByAnimeId({
    required String animeId,
    required LoadType loadType,
    required StaffLanguage language,
    CancelToken? token,
  }) async {
    return LoadPageUtil.loadPage(
      type: loadType,
      onGetNetworkRes: (page, perPage) => dataSource.getCharacterPage(
        animeId: int.parse(animeId),
        language: language,
        page: page,
        perPage: perPage,
        token: token,
      ),
      onClearDbCache: () => mediaDao.clearMediaCharacterCrossRef(animeId),
      onInsertEntityToDB: (entities) =>
          mediaDao.insertCharacterVoiceActorsOfMedia(
              mediaId: int.parse(animeId), entities: entities),
      onGetEntityFromDB: (page, perPage) => mediaDao.getCharacterOfMediaByPage(
        animeId.toString(),
        staffLanguage: language,
        page: page,
        perPage: perPage,
      ),
      mapDtoToEntity: (dto) => CharacterAndVoiceActorRelationEntity(
        characterEntity: CharacterEntity.fromNetworkModel(dto),
        voiceActorEntity: StaffEntity.fromVoiceActorDto(dto),
        role: dto.role,
        language: language,
      ),
      mapEntityToModel: (entity) =>
          CharacterAndVoiceActorModel.fromDatabaseEntity(entity),
    );
  }

  @override
  Future<LoadResult<List<StaffAndRoleModel>>> loadStaffPageByAnimeId({
    required String animeId,
    required LoadType loadType,
    CancelToken? token,
  }) {
    return LoadPageUtil.loadPage(
      type: loadType,
      onGetNetworkRes: (page, perPage) => dataSource.getStaffPage(
        animeId: int.parse(animeId),
        page: page,
        perPage: perPage,
        token: token,
      ),
      onClearDbCache: () async {},
      onInsertEntityToDB: (entities) =>
          mediaDao.insertStaffRelationEntitiesOfMedia(
              mediaId: int.parse(animeId), entities: entities),
      onGetEntityFromDB: (page, perPage) => mediaDao.getStaffOfMediaByPage(
        animeId.toString(),
        page: page,
        perPage: perPage,
      ),
      mapDtoToEntity: (dto) => StaffAndRoleRelation(
        staff: StaffEntity.fromStaffEdge(dto),
        role: dto.role ?? '',
      ),
      mapEntityToModel: (entity) =>
          StaffAndRoleModel.fromDatabaseEntity(entity),
    );
  }

  @override
  Stream<MediaModel> getDetailAnimeInfoStream(String id) {
    return mediaDao.getDetailMediaInfoStream(id).map(
          (entity) => MediaModel.fromAnimeDetailInfo(entity),
        );
  }

  @override
  Future<LoadResult<void>> startFetchDetailAnimeInfo(
      {required String id, CancelToken? token}) async {
    try {
      /// fetch anime info from network.
      MediaDto networkResult =
          await dataSource.getNetworkAnime(id: int.parse(id), token: token);

      /// insert anime info to db.
      await mediaDao.insertMedia([MediaEntity.fromNetworkModel(networkResult)],
          conflictAlgorithm: ConflictAlgorithm.replace);

      final List<CharacterEdge> characters =
          networkResult.characters?.edges ?? [];
      if (characters.isNotEmpty) {
        await mediaDao.clearMediaCharacterCrossRef(id);

        /// inset character entities to db.
        final List<CharacterAndVoiceActorRelationEntity>
            characterAndVoiceActors = characters
                .map(
                  (e) => CharacterAndVoiceActorRelationEntity(
                      characterEntity: CharacterEntity.fromNetworkModel(e),
                      voiceActorEntity: StaffEntity.fromVoiceActorDto(e),
                      role: e.role,
                      // only fetch japanese voice actor in detail page.
                      language: StaffLanguage.japanese),
                )
                .toList();

        await mediaDao.insertCharacterVoiceActorsOfMedia(
            mediaId: int.parse(id), entities: characterAndVoiceActors);
      }

      final List<StaffEdge> staffs = networkResult.staff?.edges ?? [];
      if (staffs.isNotEmpty) {
        /// inset staff entities to db.
        final List<StaffAndRoleRelation> entities = staffs
            .map(
              (e) => StaffAndRoleRelation(
                staff: StaffEntity.fromStaffEdge(e),
                role: e.role ?? '',
              ),
            )
            .toList();
        await mediaDao.insertStaffRelationEntitiesOfMedia(
            mediaId: int.parse(id), entities: entities);
      }

      final List<StudioDto> studios = networkResult.studios?.nodes ?? [];

      /// insert studio info to database.
      if (studios.isNotEmpty) {
        final studioEntities =
            studios.map((e) => StudioEntity.fromDto(e)).toList();
        await studioDao.insertStudioEntitiesOfMedia(
            mediaId: id, entities: studioEntities);
      }

      final List<MediaExternalLinkDto> externalLinks =
          networkResult.externalLinks;

      /// insert external links to database.
      if (externalLinks.isNotEmpty) {
        final linkEntities = externalLinks
            .map((e) => MediaExternalLinkEntity.fromDto(e, id))
            .toList();
        await mediaDao.upsertMediaExternalLinks(externalLinks: linkEntities);
      }

      final MediaConnection? relations = networkResult.relations;

      /// insert media relations to database.
      if (relations != null) {
        final relationEntity =
            MediaRelationEntitiesWithOwnerId.fromDto(id, relations);
        await mediaDao.upsertMediaRelations(relationEntity: relationEntity);
      }

      /// notify data base has been changed an trigger the streams.
      mediaDao.notifyMediaDetailInfoChanged();
      return LoadSuccess(data: null);
    } on DioException catch (e) {
      return LoadError(e);
    }
  }

  @override
  Future<List<AiringScheduleAndAnimeModel>> getAiringScheduleAndAnimeByDateTime(
      DateTime dateTime) async {
    final (startMs, endMs) = TimeUtil.getTimeRangeOfTheTargetDay(dateTime);
    final entities = await airingScheduleDao
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
  Future<LoadResult<void>> refreshAiringSchedule(
    DateTime now, {
    int dayAgo = 0,
    int dayAfter = 0,
    CancelToken? token,
  }) async {
    try {
      final (startMs, endMs) =
          TimeUtil.getTimeRange(now, daysAgo: dayAgo, daysAfter: dayAfter);

      /// Get all airing schedule from network source.
      final networkResults = await dataSource.getAiringSchedules(
        param: AiringSchedulesQueryParam(
            airingAtGreater: startMs ~/ 1000, airingAtLesser: endMs ~/ 1000),
        token: token,
      );

      /// insert airing schedule data to db.
      final scheduleEntities =
          networkResults.map((e) => AiringSchedulesEntity.fromDto(e)).toList();
      await airingScheduleDao.upsertAiringSchedules(
          schedules: scheduleEntities);

      /// insert anime data to db if not exist.
      final animeEntities = networkResults
          .map((e) => MediaEntity.fromNetworkModel(e.media!))
          .toList();
      await mediaDao.insertMedia(animeEntities,
          conflictAlgorithm: ConflictAlgorithm.ignore);

      return LoadSuccess(data: null);
    } on NetworkException catch (exception) {
      return LoadError(exception);
    }
  }

  @override
  Future<LoadResult<void>> startFetchDetailCharacterInfo(
      {required String id, CancelToken? token}) async {
    try {
      /// fetch detail character information.
      final characterDto =
          await dataSource.getCharacterById(characterId: id, token: token);

      /// insert data to database.
      final characterEntity = CharacterEntity.fromDto(characterDto);
      final mediaEntityList = characterDto.media?.edges
              .map((e) => MediaEntity.fromNetworkModel(e.media!))
              .toList() ??
          [];
      await characterDao.insertCharacterAndRelatedMedia(
        CharacterAndRelatedMedia(
          character: characterEntity,
          medias: mediaEntityList,
        ),
      );

      return LoadSuccess(data: null);
    } on Exception catch (exception) {
      return LoadError(exception);
    }
  }

  @override
  Stream<CharacterModel> getDetailCharacterStream(String id) {
    return characterDao.getCharacterStream(id).map(
          (entity) => CharacterModel.fromDetail(entity),
        );
  }

  @override
  Stream<StaffModel?> getDetailStaffStream(String id) {
    return staffDao.getStaffByIdStream(id).map(
          (entity) =>
              entity != null ? StaffModel.fromEntity(entity) : null,
        );
  }

  @override
  Future<LoadResult<void>> startFetchDetailStaffInfo(
      {required String id, CancelToken? token}) async {
    try {
      /// fetch detail character information.
      final staffDto = await dataSource.getStaffById(staffId: id, token: token);

      /// insert data to database.
      final staffEntity = StaffEntity.fromStaffDto(staffDto);

      await staffDao.insertStaffEntities([staffEntity]);

      return LoadSuccess(data: null);
    } on Exception catch (exception) {
      return LoadError(exception);
    }
  }

  @override
  Future<LoadResult<List<CharacterAndMediaConnection>>>
      loadVoiceActorContentsPage({
    required int page,
    required int perPage,
    required String staffId,
    required MediaSort mediaSort,
    CancelToken? token,
  }) {
    return LoadPageUtil.loadPageWithoutDBCache(
      page: page,
      perPage: perPage,
      onGetNetworkRes: (page, prePage) async {
        final mediaConnection = await dataSource.getMediaConnectionByStaffId(
            staffId, page, perPage, mediaSort, token);
        return mediaConnection.edges;
      },
      onInsertToDB: (dtoList) async {
        final characters = dtoList
            .map((e) => e.characters.firstOrNull)
            .whereNotNull()
            .map((e) => CharacterEntity.fromDto(e))
            .toList();

        await characterDao.insertCharacters(
            entities: characters, conflictAlgorithm: ConflictAlgorithm.ignore);

        final medias = dtoList
            .map((e) => e.media)
            .whereNotNull()
            .map((e) => MediaEntity.fromNetworkModel(e))
            .toList();

        await mediaDao.insertMedia(medias,
            conflictAlgorithm: ConflictAlgorithm.ignore);
      },
      mapDtoToModel: CharacterAndMediaConnection.fromDto,
    );
  }

  @override
  Stream<StudioModel?> getStudioStream(String id) => studioDao
      .getStudioByIdStream(id)
      .map((entity) => entity != null ? StudioModel.fromEntity(entity) : null);

  @override
  Future<LoadResult<void>> startFetchDetailStudioInfo(
      {required String id, required CancelToken token}) async {
    try {
      /// fetch detail studio information.
      final studioDto =
          await dataSource.getStudioById(studioId: id, token: token);

      /// insert data to database.
      final studioEntity = StudioEntity.fromDto(studioDto);
      await studioDao.insertStudioEntities(entities: [studioEntity]);

      return LoadSuccess(data: null);
    } on Exception catch (exception) {
      return LoadError(exception);
    }
  }

  @override
  Future<LoadResult<List<MediaModel>>> loadStudioContentsPage(
      {required int page,
      required int perPage,
      required String studioId,
      CancelToken? token}) {
    return LoadPageUtil.loadPageWithoutDBCache<MediaEdge, MediaModel>(
      page: page,
      perPage: perPage,
      onGetNetworkRes: (page, prePage) async {
        final mediaConnection = await dataSource.getMediaConnectionByStudioId(
            studioId, page, perPage);
        return mediaConnection.edges;
      },
      onInsertToDB: (dtoList) async {
        final medias = dtoList
            .map((e) => e.media)
            .whereNotNull()
            .map((e) => MediaEntity.fromNetworkModel(e))
            .toList();

        await mediaDao.insertMedia(medias,
            conflictAlgorithm: ConflictAlgorithm.ignore);
      },
      mapDtoToModel: (edge) => MediaModel.fromDto(edge.media!),
    );
  }

}

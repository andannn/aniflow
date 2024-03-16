import 'package:aniflow/core/common/model/anime_category.dart';
import 'package:aniflow/core/common/model/media_sort.dart';
import 'package:aniflow/core/common/model/staff_language.dart';
import 'package:aniflow/core/common/util/load_page_util.dart';
import 'package:aniflow/core/common/util/time_util.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/mappers/airing_schedule_mapper.dart';
import 'package:aniflow/core/data/mappers/character_mapper.dart';
import 'package:aniflow/core/data/mappers/media_mapper.dart';
import 'package:aniflow/core/data/mappers/staff_mapper.dart';
import 'package:aniflow/core/data/mappers/studio_mapper.dart';
import 'package:aniflow/core/data/model/airing_schedule_and_anime_model.dart';
import 'package:aniflow/core/data/model/character_and_voice_actor_model.dart';
import 'package:aniflow/core/data/model/character_model.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/staff_and_role_model.dart';
import 'package:aniflow/core/data/model/staff_character_and_media_connection.dart';
import 'package:aniflow/core/data/model/staff_model.dart';
import 'package:aniflow/core/data/model/studio_model.dart';
import 'package:aniflow/core/database_drift/aniflow_database.dart';
import 'package:aniflow/core/database_drift/mappers/airing_schedule_mapper.dart';
import 'package:aniflow/core/database_drift/mappers/character_mapper.dart';
import 'package:aniflow/core/database_drift/mappers/media_external_link_mapper.dart';
import 'package:aniflow/core/database_drift/mappers/media_mapper.dart';
import 'package:aniflow/core/database_drift/mappers/staff_mapper.dart';
import 'package:aniflow/core/database_drift/mappers/studio_mapper.dart';
import 'package:aniflow/core/database_drift/relations/airing_schedule_and_media_relation.dart';
import 'package:aniflow/core/database_drift/relations/character_and_related_media_relation.dart';
import 'package:aniflow/core/database_drift/relations/character_and_voice_actor_relation.dart';
import 'package:aniflow/core/database_drift/relations/media_and_relation_type_entity.dart';
import 'package:aniflow/core/database_drift/relations/staff_and_role_relation_entity.dart';
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
import 'package:rxdart/rxdart.dart';

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

  final mediaDao = AniflowDatabase2().mediaDao;
  final characterDao = AniflowDatabase2().characterDao;
  final staffDao = AniflowDatabase2().staffDao;
  final studioDao = AniflowDatabase2().studioDao;
  final airingScheduleDao = AniflowDatabase2().airingSchedulesDao;

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
            preferences.season.value,
            preferences.seasonYear.value,
            preferences.aniListSettings.value.displayAdultContent),
      ),
      onGetEntityFromDB: (page, perPage) => mediaDao.getMediaByPage(
          category.getContentValue(),
          page: page,
          perPage: perPage),
      onInsertEntityToDB: (entities) => mediaDao
          .upsertMediaByCategory(category.getContentValue(), medias: entities),
      onClearDbCache: () =>
          mediaDao.clearCategoryMediaCrossRef(category.getContentValue()),
      mapDtoToEntity: (dto) => dto.toEntity(),
      mapEntityToModel: (entity) => entity.toModel(),
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
      onClearDbCache: () => characterDao.clearMediaCharacterCrossRef(animeId),
      onInsertEntityToDB: (entities) =>
          characterDao.insertCharacterVoiceActorsOfMedia(animeId, entities),
      onGetEntityFromDB: (page, perPage) =>
          characterDao.getCharacterOfMediaByPage(
        animeId.toString(),
        staffLanguage: language.toJson(),
        page: page,
        perPage: perPage,
      ),
      mapDtoToEntity: (dto) => CharacterAndVoiceActorRelation(
        characterEntity: dto.characterNode!.toEntity(),
        voiceActorEntity: dto.voiceActors.firstOrNull?.toEntity(),
        characterRole: dto.role?.toJson(),
        staffLanguage: language.toJson(),
      ),
      mapEntityToModel: (entity) =>
          CharacterAndVoiceActorRelation.fromDatabaseEntity(entity),
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
          staffDao.insertStaffRelationEntitiesOfMedia(animeId, entities),
      onGetEntityFromDB: (page, perPage) => staffDao.getStaffOfMediaByPage(
        animeId.toString(),
        page: page,
        perPage: perPage,
      ),
      mapDtoToEntity: (dto) => StaffAndRoleRelationEntity(
        staff: dto.staffNode!.toEntity(),
        role: dto.role ?? '',
      ),
      mapEntityToModel: (entity) => entity.toModel(),
    );
  }

  @override
  Stream<MediaModel> getDetailAnimeInfoStream(String id) {
    final mediaStream = mediaDao.getMediaStream(id);
    final characterStream = characterDao.getCharacterListStream(id,
        staffLanguage: StaffLanguage.japanese.toJson());
    return CombineLatestStream.combine2(
      mediaStream,
      characterStream,
      (media, characterList) => media.toModel().copyWith(
        characterAndVoiceActors: characterList.map((e) => e.toModel()).toList()
      ),
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
      await mediaDao.upsertMedia([networkResult.toEntity()]);

      final List<CharacterEdge> characters =
          networkResult.characters?.edges ?? [];
      if (characters.isNotEmpty) {
        await characterDao.clearMediaCharacterCrossRef(id);

        /// inset character entities to db.
        final List<CharacterAndVoiceActorRelation> characterAndVoiceActors =
            characters
                .map(
                  (e) => CharacterAndVoiceActorRelation(
                      characterEntity: e.characterNode!.toEntity(),
                      voiceActorEntity: e.voiceActors.firstOrNull?.toEntity(),
                      characterRole: e.role?.toJson(),
                      // only fetch japanese voice actor in detail page.
                      staffLanguage: StaffLanguage.japanese.toJson()),
                )
                .toList();

        await characterDao.insertCharacterVoiceActorsOfMedia(
            id, characterAndVoiceActors);
      }

      final List<StaffEdge> staffs = networkResult.staff?.edges ?? [];
      if (staffs.isNotEmpty) {
        /// inset staff entities to db.
        final List<StaffAndRoleRelationEntity> entities = staffs
            .map(
              (e) => StaffAndRoleRelationEntity(
                staff: e.staffNode!.toEntity(),
                role: e.role ?? '',
              ),
            )
            .toList();
        await staffDao.insertStaffRelationEntitiesOfMedia(id, entities);
      }

      final List<StudioDto> studios = networkResult.studios?.nodes ?? [];

      /// insert studio info to database.
      if (studios.isNotEmpty) {
        final studioEntities = studios.map((e) => e.toEntity()).toList();
        await studioDao.insertOrIgnoreStudioEntitiesOfMedia(id, studioEntities);
      }

      final List<MediaExternalLinkDto> externalLinks =
          networkResult.externalLinks;

      /// insert external links to database.
      if (externalLinks.isNotEmpty) {
        final linkEntities = externalLinks.map((e) => e.toEntity(id)).toList();
        await mediaDao.upsertMediaExternalLinks(linkEntities);
      }

      final MediaConnection? relations = networkResult.relations;

      /// insert media relations to database.
      if (relations != null) {
        await mediaDao.upsertMediaRelations(
          id,
          relations.edges
              .map((e) => MediaAndRelationTypeEntity.fromDto(e))
              .toList(),
        );
      }

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
            airingSchedule: e.airingSchedule.toModel(),
            animeModel: e.mediaEntity.toModel(),
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
      await airingScheduleDao.upsertAiringSchedules(
        networkResults
            .map(
              (e) => AiringScheduleAndMediaRelation(
                  airingSchedule: e.toEntity(),
                  mediaEntity: e.media!.toEntity()),
            )
            .toList(),
      );

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
      final characterEntity = characterDto.toEntity();
      final mediaEntityList =
          characterDto.media?.edges.map((e) => e.media!.toEntity()).toList() ??
              [];
      await characterDao.upsertCharacterAndRelatedMedia(
        CharacterAndRelatedMediaRelation(
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
    return characterDao.getCharacterAndRelatedMediaStreamById(id).map(
          (entity) => entity.toModel(),
        );
  }

  @override
  Stream<StaffModel?> getDetailStaffStream(String id) {
    return staffDao.getStaffStream(id).map((entity) => entity?.toModel());
  }

  @override
  Future<LoadResult<void>> startFetchDetailStaffInfo(
      {required String id, CancelToken? token}) async {
    try {
      /// fetch detail character information.
      final staffDto = await dataSource.getStaffById(staffId: id, token: token);

      /// insert data to database.
      final staffEntity = staffDto.toEntity();

      await staffDao.upsertStaffEntities([staffEntity]);

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
            .map((e) => e.toEntity())
            .toList();

        await characterDao.insertOrIgnoreCharacters(characters);

        final medias = dtoList
            .map((e) => e.media)
            .whereNotNull()
            .map((e) => e.toEntity())
            .toList();

        await mediaDao.insertOrIgnoreMedia(medias);
      },
      mapDtoToModel: CharacterAndMediaConnection.fromDto,
    );
  }

  @override
  Stream<StudioModel?> getStudioStream(String id) =>
      studioDao.getStudioStream(id).map((entity) => entity?.toModel());

  @override
  Future<LoadResult<void>> startFetchDetailStudioInfo(
      {required String id, required CancelToken token}) async {
    try {
      /// fetch detail studio information.
      final studioDto =
          await dataSource.getStudioById(studioId: id, token: token);

      /// insert data to database.
      final studioEntity = studioDto.toEntity();
      await studioDao.upsertStudioEntities([studioEntity]);

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
            .map((e) => e.toEntity())
            .toList();

        await mediaDao.insertOrIgnoreMedia(medias);
      },
      mapDtoToModel: (edge) => MediaModel.fromDto(edge.media!),
    );
  }
}

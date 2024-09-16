import 'package:aniflow/app/di/env.dart';
import 'package:aniflow/core/common/definitions/media_category.dart';
import 'package:aniflow/core/common/definitions/media_format.dart';
import 'package:aniflow/core/common/definitions/media_sort.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/definitions/staff_language.dart';
import 'package:aniflow/core/common/util/load_page_util.dart';
import 'package:aniflow/core/common/util/time_util.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/mappers/airing_schedule_mapper.dart';
import 'package:aniflow/core/data/mappers/character_mapper.dart';
import 'package:aniflow/core/data/mappers/media_external_link_mapper.dart';
import 'package:aniflow/core/data/mappers/media_mapper.dart';
import 'package:aniflow/core/data/mappers/media_relation_mapper.dart';
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
import 'package:aniflow/core/database/dao/airing_schedules_dao.dart';
import 'package:aniflow/core/database/dao/character_dao.dart';
import 'package:aniflow/core/database/dao/media_dao.dart';
import 'package:aniflow/core/database/dao/staff_dao.dart';
import 'package:aniflow/core/database/dao/studio_dao.dart';
import 'package:aniflow/core/database/mappers/airing_schedule_mapper.dart';
import 'package:aniflow/core/database/mappers/character_mapper.dart';
import 'package:aniflow/core/database/mappers/media_external_link_mapper.dart';
import 'package:aniflow/core/database/mappers/media_mapper.dart';
import 'package:aniflow/core/database/mappers/staff_mapper.dart';
import 'package:aniflow/core/database/mappers/studio_mapper.dart';
import 'package:aniflow/core/database/relations/airing_schedule_and_media_relation.dart';
import 'package:aniflow/core/database/relations/character_and_related_media_relation.dart';
import 'package:aniflow/core/database/relations/character_and_voice_actor_relation.dart';
import 'package:aniflow/core/database/relations/media_and_relation_type_entity.dart';
import 'package:aniflow/core/database/relations/staff_and_role_relation_entity.dart';
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
import 'package:aniflow/core/shared_preference/user_data_preferences.dart';
import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@LazySingleton(env: [AfEnvironment.impl])
class MediaInformationRepository {
  MediaInformationRepository(
    this._dataSource,
    this._characterDao,
    this._staffDao,
    this._studioDao,
    this._airingScheduleDao,
    this._mediaDao,
    this._preferences,
  );

  final AniListDataSource _dataSource;
  final MediaDao _mediaDao;
  final CharacterDao _characterDao;
  final StaffDao _staffDao;
  final StudioDao _studioDao;
  final AiringSchedulesDao _airingScheduleDao;
  final UserDataPreferences _preferences;

  Future<LoadResult<List<MediaModel>>> loadMediaPageByCategory({
    required MediaCategory category,
    required bool displayAdultContent,
    required LoadType loadType,
    CancelToken? token,
  }) {
    return LoadPageUtil.loadPage(
      type: loadType,
      onGetNetworkRes: (page, perPage) => _dataSource.getNetworkMediaPage(
        page: page,
        perPage: perPage,
        token: token,
        param: createMediaPageQueryParamByCategory(
          category,
          _preferences.userData.season,
          _preferences.userData.seasonYear,
          displayAdultContent,
        ),
      ),
      onGetEntityFromDB: (page, perPage) => _mediaDao.getMediaPageByCategory(
          category.getContentValue(),
          page: page,
          perPage: perPage),
      onInsertEntityToDB: (entities) => _mediaDao
          .upsertMediaByCategory(category.getContentValue(), medias: entities),
      onClearDbCache: () =>
          _mediaDao.clearCategoryMediaCrossRef(category.getContentValue()),
      mapDtoToEntity: (dto) => dto.toEntity(),
      mapEntityToModel: (entity) => entity.toModel(),
    );
  }

  Future<LoadResult<List<MediaModel>>> refreshMoviesPage({
    required DateTime startDateGreater,
    required DateTime endDateLesser,
    required bool isAdult,
    CancelToken? token,
  }) {
    return LoadPageUtil.loadPage(
      type: const Refresh(50),
      onGetNetworkRes: (page, perPage) => _dataSource.getNetworkMediaPage(
        page: page,
        perPage: perPage,
        token: token,
        param: AnimePageQueryParam(
          type: MediaType.anime,
          startDateGreater: startDateGreater,
          endDateGreater: endDateLesser,
          mediaFormat: [MediaFormat.movie],
          isAdult: isAdult,
        ),
      ),
      onGetEntityFromDB: (page, perPage) => _mediaDao.getMediasByTimeRange(
        page: page,
        perPage: perPage,
        mediaFormat: [MediaFormat.movie].map((e) => e.toJson()).toList(),
        startDate: startDateGreater,
        endDate: endDateLesser,
      ),
      onInsertEntityToDB: (entities) => _mediaDao.insertOrUpdateMedia(entities),
      onClearDbCache: () async {},
      mapDtoToEntity: (dto) => dto.toEntity(),
      mapEntityToModel: (entity) => entity.toModel(),
    );
  }

  Future<LoadResult<List<CharacterAndVoiceActorModel>>>
      loadCharacterPageByAnimeId({
    required String animeId,
    required LoadType loadType,
    required StaffLanguage language,
    CancelToken? token,
  }) async {
    return LoadPageUtil.loadPage(
      type: loadType,
      onGetNetworkRes: (page, perPage) => _dataSource.getCharacterPage(
        animeId: int.parse(animeId),
        language: language,
        page: page,
        perPage: perPage,
        token: token,
      ),
      onClearDbCache: () => _characterDao.clearMediaCharacterCrossRef(animeId),
      onInsertEntityToDB: (entities) =>
          _characterDao.insertCharacterVoiceActorsOfMedia(animeId, entities),
      onGetEntityFromDB: (page, perPage) =>
          _characterDao.getCharacterOfMediaByPage(
        animeId.toString(),
        staffLanguage: language.toJson(),
        page: page,
        perPage: perPage,
      ),
      mapDtoToEntity: (dto) => CharacterAndVoiceActorRelation(
        characterEntity: dto.characterNode!.toEntity(),
        voiceActorEntity: dto.voiceActors.firstOrNull?.toEntity(),
        characterRole: dto.role?.toJson(),
        staffLanguage:
            dto.voiceActors.firstOrNull != null ? language.toJson() : null,
      ),
      mapEntityToModel: (entity) =>
          CharacterAndVoiceActorRelation.fromDatabaseEntity(entity),
    );
  }

  Future<LoadResult<List<StaffAndRoleModel>>> loadStaffPageByAnimeId({
    required String animeId,
    required LoadType loadType,
    CancelToken? token,
  }) {
    return LoadPageUtil.loadPage(
      type: loadType,
      onGetNetworkRes: (page, perPage) => _dataSource.getStaffPage(
        animeId: int.parse(animeId),
        page: page,
        perPage: perPage,
        token: token,
      ),
      onClearDbCache: () async {},
      onInsertEntityToDB: (entities) =>
          _staffDao.insertStaffRelationEntitiesOfMedia(animeId, entities),
      onGetEntityFromDB: (page, perPage) => _staffDao.getStaffOfMediaByPage(
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

  Stream<MediaModel> getDetailMediaInfoStream(String id) {
    final mediaStream = _mediaDao.getMediaStream(id);
    final characterStream = _characterDao.getCharacterListStream(id,
        staffLanguage: StaffLanguage.japanese.toJson());
    final staffStream = _staffDao.getStaffListStream(id);
    final studioStream = _studioDao.getStudioOfMediaStream(id);
    final externalLinkStream = _mediaDao.getAllExternalLinksOfMediaStream(id);
    final mediaRelationStream = _mediaDao.getMediaRelationsStream(id);
    return CombineLatestStream.combine6(
      mediaStream,
      characterStream,
      staffStream,
      studioStream,
      externalLinkStream,
      mediaRelationStream,
      (
        media,
        characterList,
        staffList,
        studioList,
        externalLinkList,
        mediaRelationList,
      ) {
        return media.toModel().copyWith(
              characterAndVoiceActors:
                  characterList.map((e) => e.toModel()).toList(),
              staffs: staffList.map((e) => e.toModel()).toList(),
              studios: studioList.map((e) => e.toModel()).toList(),
              externalLinks: externalLinkList.map((e) => e.toModel()).toList(),
              relations: mediaRelationList.map((e) => e.toModel()).toList(),
            );
      },
    );
  }

  Future<LoadResult<void>> startFetchDetailAnimeInfo(
      {required String id, CancelToken? token}) async {
    try {
      /// fetch anime info from network.
      MediaDto networkResult =
          await _dataSource.getNetworkAnime(id: int.parse(id), token: token);

      /// insert anime info to db.
      await _mediaDao.insertOrUpdateMedia([networkResult.toEntity()]);

      final List<CharacterEdge> characters =
          networkResult.characters?.edges ?? [];
      if (characters.isNotEmpty) {
        await _characterDao.clearMediaCharacterCrossRef(id);

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

        await _characterDao.insertCharacterVoiceActorsOfMedia(
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
        await _staffDao.insertStaffRelationEntitiesOfMedia(id, entities);
      }

      final List<StudioDto> studios = networkResult.studios?.nodes ?? [];

      /// insert studio info to database.
      if (studios.isNotEmpty) {
        final studioEntities = studios.map((e) => e.toEntity()).toList();
        await _studioDao.insertOrIgnoreStudioEntitiesOfMedia(
            id, studioEntities);
      }

      final List<MediaExternalLinkDto> externalLinks =
          networkResult.externalLinks;

      /// insert external links to database.
      if (externalLinks.isNotEmpty) {
        final linkEntities = externalLinks.map((e) => e.toEntity(id)).toList();
        await _mediaDao.upsertMediaExternalLinks(linkEntities);
      }

      final MediaConnection? relations = networkResult.relations;

      /// insert media relations to database.
      if (relations != null) {
        await _mediaDao.upsertMediaRelations(
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

  Future<List<AiringScheduleAndAnimeModel>> getAiringScheduleAndAnimeByDateTime(
      DateTime dateTime) async {
    final (startMs, endMs) = TimeUtil.getTimeRangeOfTheTargetDay(dateTime);
    final entities = await _airingScheduleDao
        .getAiringSchedulesByTimeRange(timeRange: (startMs, endMs));

    return entities
        .map(
          (e) => AiringScheduleAndAnimeModel(
            airingSchedule: e.airingSchedule.toModel(),
            mediaModel: e.mediaEntity.toModel(),
          ),
        )
        .toList();
  }

  Stream<List<AiringScheduleAndAnimeModel>>
      getAiringScheduleAndAnimeByDateTimeStream(DateTime dateTime) {
    final (startMs, endMs) = TimeUtil.getTimeRangeOfTheTargetDay(dateTime);
    final entities = _airingScheduleDao
        .getAiringSchedulesByTimeRangeStream(timeRange: (startMs, endMs));

    return entities.map(
      (e) => e
          .map(
            (e) => AiringScheduleAndAnimeModel(
              airingSchedule: e.airingSchedule.toModel(),
              mediaModel: e.mediaEntity.toModel(),
            ),
          )
          .toList(),
    );
  }

  /// Refresh airing schedule data in range of [now - dayAgo, not + dayAfter].
  /// The ani list api restrict the count to 50. so maybe we can only get
  /// one or two days airing schedule when using this method.
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
      final networkResults = await _dataSource.getAiringSchedules(
        param: AiringSchedulesQueryParam(
            airingAtGreater: startMs ~/ 1000, airingAtLesser: endMs ~/ 1000),
        token: token,
      );

      /// insert airing schedule data to db.
      await _airingScheduleDao.upsertAiringSchedules(
        networkResults
            .map(
              (e) => AiringScheduleAndMediaRelation(
                  airingSchedule: e.toEntity(),
                  mediaEntity: e.media!.toEntity()),
            )
            .toList(),
      );

      return LoadSuccess(data: null);
    } on Exception catch (exception) {
      return LoadError(exception);
    }
  }

  Future<LoadResult<void>> startFetchDetailCharacterInfo(
      {required String id, CancelToken? token}) async {
    try {
      /// fetch detail character information.
      final characterDto =
          await _dataSource.getCharacterById(characterId: id, token: token);

      /// insert data to database.
      final characterEntity = characterDto.toEntity();
      final mediaEntityList =
          characterDto.media?.edges.map((e) => e.media!.toEntity()).toList() ??
              [];
      await _characterDao
          .upsertCharacterAndRelatedMedia(CharacterAndRelatedMediaRelation(
        character: characterEntity,
        medias: mediaEntityList,
      ));

      return LoadSuccess(data: null);
    } on Exception catch (exception) {
      return LoadError(exception);
    }
  }

  Stream<List<MediaModel>> getMediasOfCategory({
    required MediaCategory category,
    required int max,
  }) {
    return _mediaDao
        .getCategoryMediasStream(category.getContentValue(), limit: max)
        .map(
          (e) => e.map((e) => e.toModel()).toList(),
        );
  }

  Stream<CharacterModel> getDetailCharacterStream(String id) {
    return _characterDao.getCharacterAndRelatedMediaStreamById(id).map(
          (entity) => entity.toModel(),
        );
  }

  Stream<StaffModel?> getDetailStaffStream(String id) {
    return _staffDao.getStaffStream(id).map((entity) => entity?.toModel());
  }

  Future<LoadResult<void>> startFetchDetailStaffInfo(
      {required String id, CancelToken? token}) async {
    try {
      /// fetch detail character information.
      final staffDto =
          await _dataSource.getStaffById(staffId: id, token: token);

      /// insert data to database.
      final staffEntity = staffDto.toEntity();

      await _staffDao.upsertStaffEntities([staffEntity]);

      return LoadSuccess(data: null);
    } on Exception catch (exception) {
      return LoadError(exception);
    }
  }

  Future<LoadResult<List<CharacterAndMediaConnection>>>
      loadVoiceActorContentsPage({
    required int page,
    required int perPage,
    required String staffId,
    required MediaSort mediaSort,
    CancelToken? token,
  }) {
    return LoadPageUtil.loadPageWithoutOrderingCache(
      page: page,
      perPage: perPage,
      onGetNetworkRes: (page, prePage) async {
        final mediaConnection = await _dataSource.getMediaConnectionByStaffId(
            staffId, page, perPage, mediaSort, token);
        return mediaConnection.edges;
      },
      onInsertToDB: (dtoList) async {
        final characters = dtoList
            .map((e) => e.characters.firstOrNull)
            .whereNotNull()
            .map((e) => e.toEntity())
            .toList();

        await _characterDao.insertOrIgnoreCharacters(characters);

        final medias = dtoList
            .map((e) => e.media)
            .whereNotNull()
            .map((e) => e.toEntity())
            .toList();

        await _mediaDao.insertOrIgnoreMedia(medias);
      },
      mapDtoToModel: CharacterAndMediaConnection.fromDto,
    );
  }

  Stream<StudioModel?> getStudioStream(String id) =>
      _studioDao.getStudioStream(id).map((entity) => entity?.toModel());

  Future<LoadResult<void>> startFetchDetailStudioInfo(
      {required String id, required CancelToken token}) async {
    try {
      /// fetch detail studio information.
      final studioDto =
          await _dataSource.getStudioById(studioId: id, token: token);

      /// insert data to database.
      final studioEntity = studioDto.toEntity();
      await _studioDao.upsertStudioEntities([studioEntity]);

      return LoadSuccess(data: null);
    } on Exception catch (exception) {
      return LoadError(exception);
    }
  }

  Future<LoadResult<List<MediaModel>>> loadStudioContentsPage(
      {required int page,
      required int perPage,
      required String studioId,
      CancelToken? token}) {
    return LoadPageUtil.loadPageWithoutOrderingCache<MediaEdge, MediaModel>(
      page: page,
      perPage: perPage,
      onGetNetworkRes: (page, prePage) async {
        final mediaConnection = await _dataSource.getMediaConnectionByStudioId(
            studioId, page, perPage);
        return mediaConnection.edges;
      },
      onInsertToDB: (dtoList) async {
        final medias = dtoList
            .map((e) => e.media)
            .whereNotNull()
            .map((e) => e.toEntity())
            .toList();

        await _mediaDao.insertOrIgnoreMedia(medias);
      },
      mapDtoToModel: (edge) => edge.media!.toModel(),
    );
  }

  Stream<List<MediaModel>> getMediaStreamByAiringTimeRange(
      {required DateTime start,
      required DateTime end,
      required List<MediaFormat> format}) {
    return _mediaDao
        .getMediaStreamByAiringTimeRange(
          start,
          end,
          format.map((e) => e.toJson()).toList(),
        )
        .map(
          (entities) => entities.map((entity) => entity.toModel()).toList(),
        );
  }
}

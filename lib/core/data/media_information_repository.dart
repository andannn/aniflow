import 'package:anime_tracker/core/common/model/anime_category.dart';
import 'package:anime_tracker/core/common/util/load_page_util.dart';
import 'package:anime_tracker/core/common/util/time_util.dart';
import 'package:anime_tracker/core/data/load_result.dart';
import 'package:anime_tracker/core/data/model/airing_schedule_and_anime_model.dart';
import 'package:anime_tracker/core/data/model/airing_schedule_model.dart';
import 'package:anime_tracker/core/data/model/anime_model.dart';
import 'package:anime_tracker/core/data/model/character_and_voice_actor_model.dart';
import 'package:anime_tracker/core/database/anime_dao.dart';
import 'package:anime_tracker/core/database/anime_database.dart';
import 'package:anime_tracker/core/database/model/airing_schedules_entity.dart';
import 'package:anime_tracker/core/database/model/anime_entity.dart';
import 'package:anime_tracker/core/database/model/character_entity.dart';
import 'package:anime_tracker/core/database/model/media_external_link_entity.dart';
import 'package:anime_tracker/core/database/model/relations/anime_and_detail_info.dart';
import 'package:anime_tracker/core/database/model/staff_entity.dart';
import 'package:anime_tracker/core/network/ani_list_data_source.dart';
import 'package:anime_tracker/core/network/api/airing_schedules_query_graphql.dart.dart';
import 'package:anime_tracker/core/network/api/ani_list_query_graphql.dart';
import 'package:anime_tracker/core/network/model/anime_dto.dart';
import 'package:anime_tracker/core/network/model/character_edge.dart';
import 'package:anime_tracker/core/network/model/media_external_links_dto.dart';
import 'package:anime_tracker/core/network/model/staff_edge.dart';
import 'package:anime_tracker/core/network/util/http_status_util.dart';
import 'package:anime_tracker/core/shared_preference/user_data.dart';
import 'package:dio/dio.dart';
import 'package:sqflite/sqflite.dart';

/// repository for get anime list.
abstract class MediaInformationRepository {
  Future<LoadResult<List<AnimeModel>>> loadAnimePageByCategory({
    required AnimeCategory category,
    required LoadType loadType,
  });

  Future<LoadResult<List<CharacterAndVoiceActorModel>>>
      loadCharacterPageByAnimeId({
    required String animeId,
    required LoadType loadType,
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
  Future<LoadResult<List<AnimeModel>>> loadAnimePageByCategory(
      {required AnimeCategory category, required LoadType loadType}) {
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
          animeDao.getAnimeByPage(category, page: page, perPage: perPage),
      onInsertEntityToDB: (entities) => animeDao
          .insertOrIgnoreAnimeByAnimeCategory(category, animeList: entities),
      onClearDbCache: () => animeDao.clearAll(),
      mapDtoToEntity: (dto) => AnimeEntity.fromNetworkModel(dto),
      mapEntityToModel: (entity) => AnimeModel.fromDatabaseModel(entity),
    );
  }

  @override
  Future<LoadResult<List<CharacterAndVoiceActorModel>>>
      loadCharacterPageByAnimeId(
          {required String animeId, required LoadType loadType}) async {
    return LoadPageUtil.loadPage<CharacterEdge, CharacterAndVoiceActor,
        CharacterAndVoiceActorModel>(
      type: loadType,
      onGetNetworkRes: (page, perPage) => aniListDataSource.getCharacterPage(
          animeId: int.parse(animeId), page: page, perPage: perPage),
      onClearDbCache: () async {},
      onInsertEntityToDB: (entities) => animeDao.insertCharacterVoiceActors(
          animeId: int.parse(animeId), entities: entities),
      onGetEntityFromDB: (page, perPage) => animeDao.getCharacterOfAnimeByPage(
        animeId.toString(),
        page: page,
        perPage: perPage,
      ),
      mapDtoToEntity: (dto) => CharacterAndVoiceActor(
        characterEntity: CharacterEntity.fromNetworkModel(dto),
        voiceActorEntity: StaffEntity.fromVoiceActorDto(dto),
      ),
      mapEntityToModel: (entity) =>
          CharacterAndVoiceActorModel.fromDatabaseEntity(entity),
    );
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
      AnimeDto networkResult = await aniListDataSource.getNetworkAnime(
        id: int.parse(id),
      );

      /// insert anime info to db.
      await animeDao.upsertAnimeInformation(
          [AnimeEntity.fromNetworkModel(networkResult)],
          conflictAlgorithm: ConflictAlgorithm.replace);

      final List<CharacterEdge> characters =
          networkResult.characters?.edges ?? [];
      if (characters.isNotEmpty) {
        /// inset character entities to db.
        final List<CharacterAndVoiceActor> characterAndVoiceActors = characters
            .map(
              (e) => CharacterAndVoiceActor(
                characterEntity: CharacterEntity.fromNetworkModel(e),
                voiceActorEntity: StaffEntity.fromVoiceActorDto(e),
              ),
            )
            .toList();

        await animeDao.insertCharacterVoiceActors(
            animeId: int.parse(id), entities: characterAndVoiceActors);
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
          .map((e) => AnimeEntity.fromNetworkModel(e.media!))
          .toList();
      await animeDao.upsertAnimeInformation(animeEntities,
          conflictAlgorithm: ConflictAlgorithm.ignore);

      return LoadSuccess(data: null);
    } on NetworkException catch (exception) {
      return LoadError(exception);
    }
  }
}

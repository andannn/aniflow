import 'package:aniflow/core/common/model/anime_category.dart';
import 'package:aniflow/core/common/model/anime_season.dart';
import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/shared_preference/aniflow_prefrences.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  group('anime_database_test', () {
    final animeDatabase = AniflowDatabase();
    late MediaInformationRepository aniListRepository;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
      await AniFlowPreferences().init();
      await AniFlowPreferences().setCurrentSeasonYear(2023);
      await AniFlowPreferences().setCurrentSeason(AnimeSeason.summer);
      await animeDatabase.initDatabase(isTest: true);

      aniListRepository = MediaInformationRepositoryImpl();
    });

    tearDown(() async {
      await animeDatabase.aniflowDB.delete(Tables.mediaTable);
      await animeDatabase.aniflowDB.delete(Tables.animeCategoryCrossRefTable);
      await animeDatabase.aniflowDB.delete(Tables.categoryTable);
      await animeDatabase.aniflowDB.delete(Tables.userDataTable);
    });

    test('ani_list_get_current_season_anime', () async {
      final animeDao = animeDatabase.getMediaInformationDaoDao();

      final result = await aniListRepository.loadAnimePageByCategory(
          category: MediaCategory.currentSeasonAnime,
          loadType: const Append(page: 1, perPage: Config.defaultPerPageCount));
      final dbResult =
          await animeDao.getMediaByPage(MediaCategory.currentSeasonAnime, page: 1);
      expect(
          (result as LoadSuccess).data,
          equals(
              dbResult.map((e) => MediaModel.fromDatabaseModel(e)).toList()));
    });

    test('ani_list_refresh_current_season_anime', () async {
      final animeDao = animeDatabase.getMediaInformationDaoDao();

      final result = await aniListRepository.loadAnimePageByCategory(
          loadType: const Refresh(), category: MediaCategory.currentSeasonAnime);
      final dbResult =
          await animeDao.getMediaByPage(MediaCategory.currentSeasonAnime, page: 1);
      expect(
          (result as LoadSuccess).data,
          equals(
              dbResult.map((e) => MediaModel.fromDatabaseModel(e)).toList()));
    });

    test('ani_list_get_nex_season_anime', () async {
      final animeDao = animeDatabase.getMediaInformationDaoDao();

      final result = await aniListRepository.loadAnimePageByCategory(
          category: MediaCategory.nextSeasonAnime,
          loadType: const Append(page: 1, perPage: Config.defaultPerPageCount));
      final dbResult =
          await animeDao.getMediaByPage(MediaCategory.nextSeasonAnime, page: 1);
      expect(
          (result as LoadSuccess).data,
          equals(
              dbResult.map((e) => MediaModel.fromDatabaseModel(e)).toList()));
    });

    test('ani_list_refresh_nex_season_anime', () async {
      final animeDao = animeDatabase.getMediaInformationDaoDao();

      final result = await aniListRepository.loadAnimePageByCategory(
          loadType: const Refresh(), category: MediaCategory.nextSeasonAnime);
      final dbResult =
          await animeDao.getMediaByPage(MediaCategory.nextSeasonAnime, page: 1);
      expect(
          (result as LoadSuccess<List<MediaModel>>).data.map((e) => e.id),
          equals(dbResult
              .map((e) => MediaModel.fromDatabaseModel(e))
              .map((e) => e.id)
              .toList()));
    });

    test('ani_list_fetch_anime_detail_data', () async {
      await aniListRepository.startFetchDetailAnimeInfo('789');
    });

    test('ani_list_fetch_anime_detail_data_and_get_result', () async {
      await aniListRepository.startFetchDetailAnimeInfo('161964');
      final res =
          await aniListRepository.getDetailAnimeInfoStream('161964').first;
      expect(res.id, equals('161964'));
    });

    test('ani_list_refresh_airing_schedule', () async {
      await aniListRepository.refreshAiringSchedule(DateTime.now(),
          dayAgo: 6, dayAfter: 6);
    });

    test('ani_list_refresh_and_get_airing_schedule', () async {
      await aniListRepository.refreshAiringSchedule(DateTime.now(),
          dayAgo: 0, dayAfter: 2);
      final res = await aniListRepository
          .getAiringScheduleAndAnimeByDateTime(DateTime.now());
      expect(res.isNotEmpty, equals(true));
    });
  });
}

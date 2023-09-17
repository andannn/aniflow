import 'package:anime_tracker/core/data/model/short_anime_model.dart';
import 'package:anime_tracker/core/data/repository/ani_list_repository.dart';
import 'package:anime_tracker/core/database/anime_database.dart';
import 'package:anime_tracker/core/network/ani_list_data_source.dart';
import 'package:anime_tracker/core/shared_preference/user_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  group('anime_database_test', () {
    final animeDatabase = AnimeDatabase();
    late AniListRepository aniListRepository;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
      await AnimeTrackerPreferences().init();
      await AnimeTrackerPreferences().setCurrentSeasonYear(2023);
      await AnimeTrackerPreferences().setCurrentSeason(AnimeSeason.summer);
      await animeDatabase.initDatabase(isTest: true);

      aniListRepository = AniListRepositoryImpl(AniListDataSource(),
          animeDatabase.getAnimeDao(), AnimeTrackerPreferences());
    });

    tearDown(() async {
      await animeDatabase.animeDB.delete(Tables.animeTable);
      await animeDatabase.animeDB.delete(Tables.animeCategoryCrossRefTable);
      await animeDatabase.animeDB.delete(Tables.categoryTable);
      await animeDatabase.animeDB.delete(Tables.userDataTable);
    });

    test('ani_list_get_current_season_anime', () async {
      final animeDao = animeDatabase.getAnimeDao();

      final result = await aniListRepository.getAnimePageByCategory(
          category: AnimeCategory.currentSeason, page: 1);
      final dbResult = await animeDao
          .getAnimeByPage(AnimeCategory.currentSeason, page: 1);
      expect(
          (result as LoadSuccess).data,
          equals(dbResult
              .map((e) => ShortAnimeModel.fromDatabaseModel(e))
              .toList()));
    });

    test('ani_list_refresh_current_season_anime', () async {
      final animeDao = animeDatabase.getAnimeDao();

      final result = await aniListRepository.refreshAnimeByCategory(
          category: AnimeCategory.currentSeason);
      final dbResult = await animeDao
          .getAnimeByPage(AnimeCategory.currentSeason, page: 1);
      expect(
          (result as LoadSuccess).data,
          equals(dbResult
              .map((e) => ShortAnimeModel.fromDatabaseModel(e))
              .toList()));
    });

    test('ani_list_get_nex_season_anime', () async {
      final animeDao = animeDatabase.getAnimeDao();

      final result = await aniListRepository.getAnimePageByCategory(
          category: AnimeCategory.nextSeason, page: 1);
      final dbResult = await animeDao
          .getAnimeByPage(AnimeCategory.nextSeason, page: 1);
      expect(
          (result as LoadSuccess).data,
          equals(dbResult
              .map((e) => ShortAnimeModel.fromDatabaseModel(e))
              .toList()));
    });

    test('ani_list_refresh_nex_season_anime', () async {
      final animeDao = animeDatabase.getAnimeDao();

      final result = await aniListRepository.refreshAnimeByCategory(
          category: AnimeCategory.nextSeason);
      final dbResult = await animeDao
          .getAnimeByPage(AnimeCategory.nextSeason, page: 1);
      expect(
          (result as LoadSuccess<ShortAnimeModel>).data.map((e) => e.id),
          equals(dbResult
              .map((e) => ShortAnimeModel.fromDatabaseModel(e))
              .map((e) => e.id)
              .toList()));
    });

    test('ani_list_fetch_anime_detail_data', () async {
      await aniListRepository.startFetchDetailAnimeInfo('789');
    });

    test('ani_list_fetch_anime_detail_data_and_get_result', () async {
      await aniListRepository.startFetchDetailAnimeInfo('789');
      final res = await aniListRepository
          .getDetailAnimeInfoStream('789')
          .first;
      expect(res.id, equals('789'));
    });
  });
}

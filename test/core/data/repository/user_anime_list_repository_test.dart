import 'package:anime_tracker/core/data/model/short_anime_model.dart';
import 'package:anime_tracker/core/data/repository/ani_list_repository.dart';
import 'package:anime_tracker/core/data/repository/user_anime_list_repository.dart';
import 'package:anime_tracker/core/database/anime_database.dart';
import 'package:anime_tracker/core/network/ani_list_data_source.dart';
import 'package:anime_tracker/core/shared_preference/user_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  group('anime_database_test', () {
    final animeDatabase = AnimeDatabase();
    late UserAnimeListRepository repository;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
      await AnimeTrackerPreferences().init();
      await AnimeTrackerPreferences().setCurrentSeasonYear(2023);
      await AnimeTrackerPreferences().setCurrentSeason(AnimeSeason.summer);
      await animeDatabase.initDatabase(isTest: true);

      repository = UserAnimeListRepositoryImpl();
    });

    tearDown(() async {
      await animeDatabase.animeDB.delete(Tables.animeTable);
      await animeDatabase.animeDB.delete(Tables.animeCategoryCrossRefTable);
      await animeDatabase.animeDB.delete(Tables.categoryTable);
      await animeDatabase.animeDB.delete(Tables.userDataTable);
      await animeDatabase.animeDB.delete(Tables.userAnimeListTable);
    });

    test('ani_list_get_current_season_anime', () async {
      final res = await repository.syncUserAnimeList(1);
      expect(res.runtimeType, equals(LoadSuccess<void>));
    });
  });
}

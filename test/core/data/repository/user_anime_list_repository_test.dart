import 'package:anime_tracker/core/data/repository/ani_list_repository.dart';
import 'package:anime_tracker/core/data/repository/user_anime_list_repository.dart';
import 'package:anime_tracker/core/database/anime_database.dart';
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
      await AniFlowPreferences().init();
      await AniFlowPreferences().setCurrentSeasonYear(2023);
      await AniFlowPreferences().setCurrentSeason(AnimeSeason.summer);
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

    test('get_user_anime_list_from_data_source', () async {
      final res = await repository.syncUserAnimeList(userId: '1');
      expect(res.runtimeType, equals(LoadSuccess<void>));
    });

    test('ani_list_get_from_database', () async {
      final res = await repository.syncUserAnimeList(userId: '1');
      expect(res.runtimeType, equals(LoadSuccess<void>));

      final res2 = await repository.getUserAnimeList(
          userId: 1,
          status: [AnimeListStatus.current, AnimeListStatus.planning]);
      expect(res2.isNotEmpty, equals(true));
    });

    test('ani_list_get_stream_test', () async {
      final res = await repository.syncUserAnimeList(userId: '1');
      expect(res.runtimeType, equals(LoadSuccess<void>));

      final stream = repository.getUserAnimeListStream(
          userId: '1',
          status: [AnimeListStatus.current, AnimeListStatus.planning]);
      final res2 = await stream.first;
      expect(res2.isNotEmpty, equals(true));
    });
  });
}

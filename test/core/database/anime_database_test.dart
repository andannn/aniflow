import 'package:anime_tracker/core/database/anime_database.dart';
import 'package:anime_tracker/core/database/model/short_cut_anime_entity.dart';
import 'package:anime_tracker/core/database/model/user_data_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  group('anime_database_test', () {
    final animeDatabase = AnimeDatabase();

    final dummyAnimeData = [
      ShortcutAnimeEntity(
          id: '5784',
          englishTitle: '',
          romajiTitle: 'Ai no Kusabi (2012)',
          nativeTitle: '間の楔',
          coverImage:
          'https://s4.anilist.co/file/anilistcdn/media/anime/cover/small/bx5784-RRtXLc6endVP.jpg',
          coverImageColor: '#6b351a'),
      ShortcutAnimeEntity(
          id: '8917',
          englishTitle: 'Bodacious Space Pirates',
          romajiTitle: 'Mouretsu Pirates',
          nativeTitle: 'モーレツ宇宙海賊',
          coverImage:
          'https://s4.anilist.co/file/anilistcdn/media/anime/cover/small/bx8917-mmUSOxFEQj3f.png',
          coverImageColor: '#50aee4'),
      ShortcutAnimeEntity(
          id: '9523',
          englishTitle: '',
          romajiTitle: 'Minori Scramble!',
          nativeTitle: 'みのりスクランブル!',
          coverImage:
          'https://s4.anilist.co/file/anilistcdn/media/anime/cover/small/9523.jpg',
          coverImageColor: '#f10000')
    ];

    final dummyUserData = UserDataEntity(id: 'aa', avatar: "bb");

    setUp(() async {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;

      await animeDatabase.initDatabase(isTest: true);
    });

    tearDown(() async {
      await animeDatabase.animeDB.delete(Tables.currentSeasonAnimeTable);
      await animeDatabase.animeDB.delete(Tables.nextSeasonAnimeTable);
      await animeDatabase.animeDB.delete(Tables.trendingSeasonAnimeTable);
      await animeDatabase.animeDB.delete(Tables.userDataTable);
    });

    test('anime_dao_clear_all', () async {
      final animeDao = animeDatabase.getAnimeDao();
      await animeDao.clearAll(Tables.currentSeasonAnimeTable);
    });

    test('anime_dao_query_when_null', () async {
      final animeDao = animeDatabase.getAnimeDao();
      final res =
      await animeDao.getAnimeByPage(
          Tables.currentSeasonAnimeTable, page: 0, perPage: 5);
      expect(res, equals([]));
    });

    test('anime_dao_upsert_anime', () async {
      final animeDao = animeDatabase.getAnimeDao();
      await animeDao.upsertAll(
          Tables.currentSeasonAnimeTable, animeList: dummyAnimeData);

      final query = await animeDao.getAnimeByPage(
          Tables.currentSeasonAnimeTable, page: 0);
      expect(query, equals(dummyAnimeData));
    });
    test('anime_dao_upsert_anime_and_get_by_page', () async {
      final animeDao = animeDatabase.getAnimeDao();
      await animeDao.upsertAll(
          Tables.currentSeasonAnimeTable, animeList: dummyAnimeData);

      final queryPage1 = await animeDao.getAnimeByPage(
          Tables.currentSeasonAnimeTable, page: 1, perPage: 1);
      expect(queryPage1, equals([dummyAnimeData[0]]));

      final queryPage2 = await animeDao.getAnimeByPage(
          Tables.currentSeasonAnimeTable, page: 2, perPage: 1);
      expect(queryPage2, equals([dummyAnimeData[1]]));

      final queryPage3 = await animeDao.getAnimeByPage(
          Tables.currentSeasonAnimeTable, page: 3, perPage: 1);
      expect(queryPage3, equals([dummyAnimeData[2]]));
    });

    test('user_data_insert_test', () async {
      final userDataDao = animeDatabase.getUserDataDao();

      await userDataDao.updateUserData(dummyUserData);
      final res = await userDataDao.getUserData();
      expect(res, equals(dummyUserData));
    });
    test('get_user_data_stream_test', () async {
      final userDataDao = animeDatabase.getUserDataDao();

      await userDataDao.updateUserData(dummyUserData);
      final res = await userDataDao.getUserDataStream().first;
      expect(res, equals(dummyUserData));
    });
    test('get_none_user_data_stream_test', () async {
      final userDataDao = animeDatabase.getUserDataDao();

      final res = await userDataDao.getUserDataStream().first;
      expect(res, equals(null));
    });
    test('remove_user_data_stream_test', () async {
      final userDataDao = animeDatabase.getUserDataDao();
      await userDataDao.updateUserData(dummyUserData);
      await userDataDao.removeUserData();

      final res = await userDataDao.getUserDataStream().first;
      expect(res, equals(null));
    });
  });
}

import 'package:anime_tracker/core/database/anime_database.dart';
import 'package:anime_tracker/core/data/repository/ani_list_repository.dart';
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
      await animeDatabase.animeDB.delete(Tables.animeTable);
      // await animeDatabase.animeDB.delete(Tables.nextSeasonAnimeTable);
      // await animeDatabase.animeDB.delete(Tables.trendingSeasonAnimeTable);
      // await animeDatabase.animeDB.delete(Tables.userDataTable);
    });

    test('anime_dao_clear_all', () async {
      final animeDao = animeDatabase.getAnimeDao();
      await animeDao.clearAll();
    });

    test('anime_dao_insert', () async {
      final animeDao = animeDatabase.getAnimeDao();
      await animeDao.upsertByAnimeCategory(AnimeCategory.trending,
          animeList: dummyAnimeData);
    });

    test('anime_dao_insert_and_get', () async {
      final animeDao = animeDatabase.getAnimeDao();
      await animeDao.upsertByAnimeCategory(AnimeCategory.trending,
          animeList: dummyAnimeData);

      final res = await animeDao.getAnimeByPage(AnimeCategory.trending, page: 1);
      expect(res, equals(dummyAnimeData));
    });

    test('user_data_insert_and_get_cross_ref', () async {
      final animeDao = animeDatabase.getAnimeDao();
      await animeDao.upsertByAnimeCategory(AnimeCategory.trending,
          animeList: dummyAnimeData.sublist(0, 2));
      await animeDao.upsertByAnimeCategory(AnimeCategory.currentSeason,
          animeList: dummyAnimeData.sublist(1, 3));
      final res = await animeDao.getAnimeByPage(AnimeCategory.trending, page: 1);
      expect(res, equals(dummyAnimeData.sublist(0, 2)));
      final res1 = await animeDao.getAnimeByPage(AnimeCategory.currentSeason, page: 1);
      expect(res1, equals(dummyAnimeData.sublist(1, 3)));
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

import 'package:anime_tracker/core/data/repository/ani_list_repository.dart';
import 'package:anime_tracker/core/data/repository/anime_track_list_repository.dart';
import 'package:anime_tracker/core/database/anime_database.dart';
import 'package:anime_tracker/core/database/model/anime_entity.dart';
import 'package:anime_tracker/core/database/model/anime_track_item_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  group('user_anime_list_test', () {
    final animeDatabase = AnimeDatabase();
    final dummyUserAnimeListEntity = <AnimeTrackItemEntity>[
      AnimeTrackItemEntity(
        id: '1',
        userId: '22',
        animeId: '33',
        status: AnimeListStatus.current,
      ),
      AnimeTrackItemEntity(
        id: '2',
        userId: '22',
        animeId: '55',
        status: AnimeListStatus.dropped,
      )
    ];

    final dummyAnimeData = [AnimeEntity(id: '33', englishTitle: 'aaaaaaaaaaa')];

    setUp(() async {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;

      await animeDatabase.initDatabase(isTest: true);
    });

    tearDown(() async {
      await animeDatabase.animeDB.delete(Tables.animeTable);
      await animeDatabase.animeDB.delete(Tables.categoryTable);
      await animeDatabase.animeDB.delete(Tables.animeCategoryCrossRefTable);
      await animeDatabase.animeDB.delete(Tables.userDataTable);
      await animeDatabase.animeDB.delete(Tables.animeCharacterCrossRefTable);
      await animeDatabase.animeDB.delete(Tables.characterTable);
      await animeDatabase.animeDB.delete(Tables.animeTrackListTable);
    });

    test('insert_test', () async {
      final dao = animeDatabase.getAnimeTrackListDao();
      await dao.insertUserAnimeListEntities(dummyUserAnimeListEntity);
    });

    test('get_list_by_user_test', () async {
      final dao = animeDatabase.getAnimeTrackListDao();
      await dao.insertUserAnimeListEntities(dummyUserAnimeListEntity);

      final res = await dao
          .getUserAnimeListByPage('22', [AnimeListStatus.current], page: 1);
      expect(res[0].userAnimeListEntity, equals(dummyUserAnimeListEntity[0]));
    });

    test('get_list_and_anime_by_user_test', () async {
      final dao = animeDatabase.getAnimeTrackListDao();
      await dao.insertUserAnimeListEntities(dummyUserAnimeListEntity);

      await animeDatabase.getAnimeDao().upsertByAnimeCategory(
          AnimeCategory.movie,
          animeList: dummyAnimeData);

      final res = await dao
          .getUserAnimeListByPage('22', [AnimeListStatus.current], page: 1);
      expect(res[0].animeEntity, equals(dummyAnimeData[0]));
    });

    test('get_list_by_multi_status', () async {
      final dao = animeDatabase.getAnimeTrackListDao();
      await dao.insertUserAnimeListEntities(dummyUserAnimeListEntity);

      final res = await dao.getUserAnimeListByPage(
          '22', [AnimeListStatus.current, AnimeListStatus.dropped],
          page: 1);
      expect(res.length, equals(2));
    });

    test('get_list_no_limit', () async {
      final dao = animeDatabase.getAnimeTrackListDao();
      await dao.insertUserAnimeListEntities(dummyUserAnimeListEntity);

      final res = await dao.getUserAnimeListByPage(
          '22', [AnimeListStatus.current, AnimeListStatus.dropped],
          page: 1, perPage: null);
      expect(res.length, equals(2));
    });

    test('get_list_ids_stream', () async {
      final dao = animeDatabase.getAnimeTrackListDao();
      await dao.insertUserAnimeListEntities(dummyUserAnimeListEntity);

      final stream = dao.getAnimeListAnimeIdsByUserStream(
          '22', [AnimeListStatus.current, AnimeListStatus.dropped]);
      final res = await stream.first;
      expect(res, equals({'33', '55'}));
    });

    test('get_list_ids_stream', () async {
      final dao = animeDatabase.getAnimeTrackListDao();
      await dao.insertUserAnimeListEntities(dummyUserAnimeListEntity);

      final isTracking =
          await dao.getIsTrackingByUserAndId(userId: '22', animeId: '33');
      expect(isTracking, equals(true));

      final isTracking2 =
          await dao.getIsTrackingByUserAndId(userId: '12', animeId: '33');
      expect(isTracking2, equals(false));
    });

    test('get_track_item', () async {
      final dao = animeDatabase.getAnimeTrackListDao();
      await dao.insertUserAnimeListEntities(dummyUserAnimeListEntity);

      final item = await dao.getAnimeTrackItem(animeId: '55');
      expect(item, equals(dummyUserAnimeListEntity[1]));
    });

    test('get_track_item', () async {
      final dao = animeDatabase.getAnimeTrackListDao();
      await dao.insertUserAnimeListEntities(dummyUserAnimeListEntity);

      final item = await dao.getAnimeTrackItem(animeId: '55');
      expect(item, equals(dummyUserAnimeListEntity[1]));

      final item2 = await dao.getAnimeTrackItem(animeId: '55', entryId: '3');
      expect(item2, equals(null));

      final item3 = await dao.getAnimeTrackItem(animeId: '55', entryId: '2');
      expect(item3, equals(dummyUserAnimeListEntity[1]));
    });
  });
}

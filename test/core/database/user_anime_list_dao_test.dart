import 'package:aniflow/core/common/model/anime_category.dart';
import 'package:aniflow/core/common/model/favorite_category.dart';
import 'package:aniflow/core/common/model/media_type.dart';
import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/model/media_entity.dart';
import 'package:aniflow/core/database/model/media_list_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  group('user_anime_list_test', () {
    final animeDatabase = AniflowDatabase();
    final mediaDao = animeDatabase.getMediaInformationDaoDao();
    final favoriteDao = animeDatabase.getFavoriteDao();

    final dummyUserAnimeListEntity = <MediaListEntity>[
      MediaListEntity(
        id: '1',
        userId: '22',
        animeId: '33',
        status: MediaListStatus.current,
      ),
      MediaListEntity(
        id: '2',
        userId: '22',
        animeId: '55',
        status: MediaListStatus.dropped,
      )
    ];

    final dummyMediaData = [
      MediaEntity(id: '33', type: 'ANIME', englishTitle: 'aaaaaaaaaaa'),
      MediaEntity(id: '55', type: 'MANGA', englishTitle: 'bbbbbbbbbbb')
    ];

    setUp(() async {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;

      await animeDatabase.initDatabase(isTest: true);
    });

    tearDown(() async {
      await animeDatabase.aniflowDB.delete(Tables.mediaTable);
      await animeDatabase.aniflowDB.delete(Tables.categoryTable);
      await animeDatabase.aniflowDB.delete(Tables.animeCategoryCrossRefTable);
      await animeDatabase.aniflowDB.delete(Tables.userDataTable);
      await animeDatabase.aniflowDB.delete(Tables.mediaCharacterCrossRefTable);
      await animeDatabase.aniflowDB.delete(Tables.characterTable);
      await animeDatabase.aniflowDB.delete(Tables.mediaListTable);
    });

    test('insert_test', () async {
      final dao = animeDatabase.getMediaListDao();
      await dao.insertMediaListEntities(dummyUserAnimeListEntity);
    });

    test('get_list_by_user_test', () async {
      final dao = animeDatabase.getMediaListDao();
      final mediaDao = animeDatabase.getMediaInformationDaoDao();
      await dao.insertMediaListEntities(dummyUserAnimeListEntity);
      await mediaDao.upsertMediaInformation(dummyMediaData);

      final res = await dao.getMediaListByPage('22', [MediaListStatus.current],
          type: MediaType.anime, page: 1);
      expect(res[0].mediaListEntity, equals(dummyUserAnimeListEntity[0]));
    });

    test('get_list_and_anime_by_user_test', () async {
      final dao = animeDatabase.getMediaListDao();
      await dao.insertMediaListEntities(dummyUserAnimeListEntity);

      await animeDatabase
          .getMediaInformationDaoDao()
          .insertOrIgnoreMediaByAnimeCategory(MediaCategory.movieAnime,
              animeList: dummyMediaData);

      final res = await dao.getMediaListByPage('22', [MediaListStatus.current],
          type: MediaType.anime, page: 1);
      expect(res[0].mediaEntity, equals(dummyMediaData[0]));
    });

    test('get_list_by_multi_status', () async {
      final dao = animeDatabase.getMediaListDao();
      final mediaDao = animeDatabase.getMediaInformationDaoDao();
      await dao.insertMediaListEntities(dummyUserAnimeListEntity);
      await mediaDao.upsertMediaInformation(dummyMediaData);

      final res = await dao.getMediaListByPage(
          '22', [MediaListStatus.current, MediaListStatus.dropped],
          type: MediaType.anime, page: 1);
      expect(res[0].mediaEntity, equals(dummyMediaData[0]));
    });

    test('get_list_no_limit', () async {
      final dao = animeDatabase.getMediaListDao();
      final mediaDao = animeDatabase.getMediaInformationDaoDao();
      await dao.insertMediaListEntities(dummyUserAnimeListEntity);
      await mediaDao.upsertMediaInformation(dummyMediaData);

      final res = await dao.getMediaListByPage(
          '22', [MediaListStatus.current, MediaListStatus.dropped],
          type: MediaType.anime, page: 1, perPage: null);
      expect(res[0].mediaEntity, equals(dummyMediaData[0]));
    });

    test('get_anime_list_ids_stream', () async {
      final listDao = animeDatabase.getMediaListDao();
      final mediaDao = animeDatabase.getMediaInformationDaoDao();
      await listDao.insertMediaListEntities(dummyUserAnimeListEntity);
      await mediaDao.upsertMediaInformation(dummyMediaData);

      final stream = listDao.getMediaListMediaIdsByUserStream('22',
          [MediaListStatus.current, MediaListStatus.dropped], MediaType.anime);
      final res = await stream.first;
      expect(res, equals({'33'}));
    });

    test('get_manga_list_ids_stream', () async {
      final listDao = animeDatabase.getMediaListDao();
      final mediaDao = animeDatabase.getMediaInformationDaoDao();
      await listDao.insertMediaListEntities(dummyUserAnimeListEntity);
      await mediaDao.upsertMediaInformation(dummyMediaData);

      final stream = listDao.getMediaListMediaIdsByUserStream('22',
          [MediaListStatus.current, MediaListStatus.dropped], MediaType.manga);
      final res = await stream.first;
      expect(res, equals({'55'}));
    });

    test('get_list_ids_stream', () async {
      final dao = animeDatabase.getMediaListDao();
      await dao.insertMediaListEntities(dummyUserAnimeListEntity);

      final isTracking =
          await dao.getIsTrackingByUserAndId(userId: '22', mediaId: '33');
      expect(isTracking, equals(true));

      final isTracking2 =
          await dao.getIsTrackingByUserAndId(userId: '12', mediaId: '33');
      expect(isTracking2, equals(false));
    });

    test('get_track_item', () async {
      final dao = animeDatabase.getMediaListDao();
      await dao.insertMediaListEntities(dummyUserAnimeListEntity);

      final item = await dao.getMediaListItem(mediaId: '55');
      expect(item, equals(dummyUserAnimeListEntity[1]));
    });

    test('get_track_item', () async {
      final dao = animeDatabase.getMediaListDao();
      await dao.insertMediaListEntities(dummyUserAnimeListEntity);

      final item = await dao.getMediaListItem(mediaId: '55');
      expect(item, equals(dummyUserAnimeListEntity[1]));

      final item2 = await dao.getMediaListItem(mediaId: '55', entryId: '3');
      expect(item2, equals(null));

      final item3 = await dao.getMediaListItem(mediaId: '55', entryId: '2');
      expect(item3, equals(dummyUserAnimeListEntity[1]));
    });

    test('get_favorite_anime', () async {
      await mediaDao.upsertMediaInformation(dummyMediaData);
      await favoriteDao
          .insertFavoritesCrossRef('1', FavoriteType.anime, ['33']);
      await favoriteDao
          .insertFavoritesCrossRef('1', FavoriteType.manga, ['55']);

      final res =
          await favoriteDao.getFavoriteMedia(MediaType.anime, '1', 1, 10);
      expect(res, equals([dummyMediaData[0]]));
    });
  });
}

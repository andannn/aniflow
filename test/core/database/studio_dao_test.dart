import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/dao/media_dao.dart';
import 'package:aniflow/core/database/dao/studio_dao.dart';
import 'package:aniflow/core/database/model/studio_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  group('studio_dao_test', () {
    final database = AniflowDatabase();
    StudioDao studioDao = database.getStudioDao();
    MediaDao mediaDao = database.getMediaDao();

    final dummyStudioData = [
      StudioEntity(
        id: '95084',
        name: 'AAAA',
        siteUrl: 'urlurlurlurlurl',
        isFavourite: 0,
        isAnimationStudio: 1,
      ),
      StudioEntity(
        id: '1248484',
        name: 'BBBBB',
        siteUrl: 'urlurlurlurlurl',
        isFavourite: 0,
        isAnimationStudio: 0,
      ),
    ];

    setUp(() async {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;

      await database.initDatabase(path: inMemoryDatabasePath);
    });

    tearDown(() async {
      await database.aniflowDB.close();
    });

    test('insert_studio_entity', () async {
      await studioDao.insertStudioEntitiesOfMedia(
          mediaId: '1', entities: dummyStudioData);
    });

    test('insert_and_get_studio_entity', () async {
      await studioDao.insertStudioEntitiesOfMedia(
          mediaId: '1', entities: dummyStudioData);
      final res = await studioDao.getStudioById('95084');
      expect(res, equals(dummyStudioData[0]));
    });

    test('insert_and_get_anime_studio', () async {
      await studioDao.insertStudioEntitiesOfMedia(
          mediaId: '1', entities: dummyStudioData);
      final res = await mediaDao.getStudioOfMedia('1');
      expect(res, equals([dummyStudioData[0]]));
    });
  });
}

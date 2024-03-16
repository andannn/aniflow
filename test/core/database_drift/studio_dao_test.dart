import 'package:aniflow/core/database_drift/aniflow_database.dart';
import 'package:aniflow/core/database_drift/dao/studio_dao.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('studio dao test', () {
    late AniflowDatabase2 db;
    late StudioDao dao;

    setUp(() async {
      db = AniflowDatabase2.test(NativeDatabase.memory());
      dao = db.studioDao;
    });

    tearDown(() async {
      await db.close();
    });

    test('studio can be created', () async {
      const studioEntity = StudioEntity(
          id: "1",
          name: 'name',
          isAnimationStudio: false,
          isFavourite: false);
      await dao.upsertStudioEntities([studioEntity]);
      final studio = await dao.getStudio('1');

      expect(studio, equals(studioEntity));
    });

    test('inesert studio with media relation', () async {
      const studioEntity = StudioEntity(
          id: "2323",
          name: 'name',
          isAnimationStudio: true,
          isFavourite: false);
      final stream = dao.getStudioOfMediaStream('1');

      await dao.insertOrIgnoreStudioEntitiesOfMedia('1', [studioEntity]);
      final expectation = expectLater(
        stream,
        emitsInOrder([[studioEntity]]),
      );

      await expectation;
    });

    test('stream emits a new studio when the name updates', () async {
      const studioEntity = StudioEntity(
          id: "1",
          name: 'name',
          isAnimationStudio: false,
          isFavourite: false);
      await dao.upsertStudioEntities([studioEntity]);
      final expectation = expectLater(
        dao.getStudioStream('1').map((event) => event?.name),
        emitsInOrder(['name']),
      );

      await expectation;
    });
  });
}

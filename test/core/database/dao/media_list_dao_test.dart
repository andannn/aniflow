import 'package:aniflow/core/common/definitions/media_status.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/dao/media_list_dao.dart';
import 'package:aniflow/core/database/relations/media_list_and_media_relation.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('anime_database_test', () {
    late AniflowDatabase db;
    late MediaListDao dao;

    setUp(() async {
      db = AniflowDatabase(NativeDatabase.memory());
      dao = db.mediaListDao;
    });

    tearDown(() async {
      await db.close();
    });

    final dummyData = [
      MediaListAndMediaRelation(
        mediaEntity: const MediaEntity(
            id: '8917',
            englishTitle: 'Bodacious Space Pirates',
            romajiTitle: 'Mouretsu Pirates',
            nativeTitle: 'モーレツ宇宙海賊',
            coverImageExtraLarge:
                'https://s4.anilist.co/file/anilistcdn/media/anime/cover/small/bx8917-mmUSOxFEQj3f.png',
            coverImageColor: '#50aee4',
            type: 'anime'),
        mediaListEntity: MediaListEntity(
          id: '1',
          userId: '22',
          mediaId: '8917',
          status: 'current',
          updatedAt: DateTime(2023, 1).microsecondsSinceEpoch,
        ),
      ),
      MediaListAndMediaRelation(
        mediaEntity: const MediaEntity(
          id: '9523',
          englishTitle: '',
          romajiTitle: 'Minori Scramble!',
          nativeTitle: 'みのりスクランブル!',
          coverImageExtraLarge:
              'https://s4.anilist.co/file/anilistcdn/media/anime/cover/small/9523.jpg',
          coverImageColor: '#f10000',
          type: 'anime',
        ),
        mediaListEntity: MediaListEntity(
          id: '2',
          userId: '22',
          mediaId: '9523',
          status: 'dropped',
          updatedAt: DateTime(2023, 3).microsecondsSinceEpoch,
        ),
      )
    ];

    test('upsert and get mediaList by mediaId', () async {
      await dao.upsertMediaListAndMediaRelations(dummyData);

      final res = await dao.getMediaListItem('9523', '22');

      expect(res, equals(dummyData[1].mediaListEntity));
    });

    test('upsert and get mediaList by media List id', () async {
      await dao.upsertMediaListAndMediaRelations(dummyData);

      final res = await dao.getMediaListItemByMediaId('8917', '22');

      expect(res, equals(dummyData[0]));
    });

    test('upsert and get mediaList page', () async {
      await dao.upsertMediaListAndMediaRelations(dummyData);

      final res = await dao.getMediaListByPage(
        '22',
        ['current'],
        mediaType: 'anime',
        page: 1,
      );

      expect(res, equals([dummyData[0]]));
    });

    test('upsert and get mediaList stream', () async {
      final stream =
          dao.getAllSortedMediaListOfUserStream('22', ['current'], 'anime');
      final data = [
        MediaListAndMediaRelation(
          mediaEntity: MediaEntity(
            id: '8917',
            type: 'anime',
            nativeTitle: 'モーレツ宇宙海賊',
            nextAiringEpisode: 3,
            status: MediaStatus.releasing.toJson(),
          ),
          mediaListEntity: const MediaListEntity(
            id: '1',
            progress: 1,
            status: 'current',
            userId: '22',
            mediaId: '8917',
          ),
        ),
        const MediaListAndMediaRelation(
          mediaEntity: MediaEntity(
            id: '8111',
            type: 'anime',
            nativeTitle: 'ヨルクラ  ',
          ),
          mediaListEntity: MediaListEntity(
            id: '2',
            status: 'current',
            userId: '22',
            mediaId: '8111',
          ),
        )
      ];
      await dao.upsertMediaListAndMediaRelations(data);
      await db.mediaDao.insertOrUpdateMedia([
        MediaEntity(
          id: '8917',
          type: 'anime',
          nativeTitle: 'モーレツ宇宙海賊',
          nextAiringEpisode: 4,
          status: MediaStatus.releasing.toJson(),
        )
      ]);

      final result = await stream.first;
      expect(result.newUpdateList.first.mediaEntity.id, '8917');
      expect(result.otherList.first.mediaEntity.id, '8111');
    });

    test('insert into MediaAiringScheduleUpdatedTable trigger test', () async {
      await db.batch((batch) {
        batch.insert(
            db.mediaTable,
            const MediaEntity(
              id: '8111',
              type: 'anime',
              nativeTitle: 'ヨルクラ  ',
              nextAiringEpisode: 0,
            ));
      });

      expect((await db.select(db.mediaAiringScheduleUpdatedTable).get()).length,
          0);

      await db.batch((batch) {
        batch.insertAllOnConflictUpdate(db.mediaTable, [
          const MediaEntity(
              id: '8111',
              type: 'anime',
              nativeTitle: 'ヨルクラ  ',
              nextAiringEpisode: 1)
        ]);
      });
      expect((await db.select(db.mediaAiringScheduleUpdatedTable).get()).length,
          1);

      await db.batch((batch) {
        batch.insertAllOnConflictUpdate(db.mediaTable, [
          const MediaEntity(
              id: '8111',
              type: 'anime',
              nativeTitle: 'ヨルクラ  ',
              nextAiringEpisode: 2)
        ]);
      });
      expect((await db.select(db.mediaAiringScheduleUpdatedTable).get()).length,
          1);
    });

    test('upsert and get mediaId stream', () async {
      final stream =
          dao.getAllMediaIdInMediaListStream('22', ['current'], 'anime');
      await dao.upsertMediaListAndMediaRelations(dummyData);

      final expectation = expectLater(
        stream,
        emitsInOrder([
          ['8917']
        ]),
      );

      await expectation;
    });

    test('upsert and get media list and media relation stream', () async {
      final dummyData = [
        MediaListAndMediaRelation(
          mediaEntity: const MediaEntity(id: '8917', type: 'anime'),
          mediaListEntity: MediaListEntity(
            id: '1',
            userId: '22',
            mediaId: '8917',
            status: 'current',
            updatedAt: DateTime(2023, 3).microsecondsSinceEpoch,
          ),
        ),
        MediaListAndMediaRelation(
          mediaEntity: const MediaEntity(
            id: '9523',
            type: 'anime',
          ),
          mediaListEntity: MediaListEntity(
            id: '2',
            userId: '22',
            mediaId: '9523',
            status: 'current',
            updatedAt: DateTime(2023, 1).microsecondsSinceEpoch,
          ),
        )
      ];
      final stream = dao.getMediaListStream('22', ['current'], 'anime');
      await dao.upsertMediaListAndMediaRelations(dummyData);

      final expectation = expectLater(
        stream,
        emitsInOrder([dummyData]),
      );

      await expectation;
    });
  });
}

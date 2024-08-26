import 'package:aniflow/core/common/definitions/media_status.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/dao/media_list_dao.dart';
import 'package:aniflow/core/database/relations/media_list_and_media_relation.dart';
import 'package:aniflow/core/database/relations/sorted_group_media_list_entity.dart';
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

      final res = await dao.getMediaListItem('9523');

      expect(res, equals(dummyData[1].mediaListEntity));
    });

    test('upsert and get mediaList by media List id', () async {
      await dao.upsertMediaListAndMediaRelations(dummyData);

      final res = await dao.getMediaListItemByMediaId('8917');

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
            nextAiringEpisodeUpdateTime: DateTime.now()
                .subtract(const Duration(days: 3))
                .add(const Duration(seconds: 1)),
          ),
          mediaListEntity: const MediaListEntity(
            id: '1',
            progress: 1,
            status: 'current',
            userId: '22',
            mediaId: '8917',
          ),
        ),
        MediaListAndMediaRelation(
          mediaEntity: MediaEntity(
            id: '8111',
            type: 'anime',
            nativeTitle: 'ヨルクラ  ',
            nextAiringEpisodeUpdateTime:
                DateTime.now().subtract(const Duration(days: 4, seconds: 1)),
          ),
          mediaListEntity: const MediaListEntity(
            id: '2',
            status: 'current',
            userId: '22',
            mediaId: '8111',
          ),
        )
      ];
      await dao.upsertMediaListAndMediaRelations(data);
      final expectation = expectLater(
        stream,
        emitsInOrder([
          SortedGroupMediaListEntity([
            data[0]
          ], [
            data[1],
          ])
        ]),
      );

      await expectation;
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

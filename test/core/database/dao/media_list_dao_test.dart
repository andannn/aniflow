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
      db = AniflowDatabase.test(NativeDatabase.memory());
      dao = db.mediaListDao;
    });

    tearDown(() async {
      await db.close();
    });

    final dummyData = [
      const MediaListAndMediaRelation(
        mediaEntity: MediaEntity(
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
        ),
      ),
      const MediaListAndMediaRelation(
        mediaEntity: MediaEntity(
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
        ),
      )
    ];

    test('upsert and get mediaList by mediaId', () async {
      await dao.upsertMediaListAndMediaRelations(dummyData);

      final res = await dao.getMediaListItem('9523');

      expect(res, equals(dummyData[1].mediaListEntity));
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
          dao.getAllMediaListOfUserStream('22', ['current'], 'anime');
      final data = [
        MediaListAndMediaRelation(
          mediaEntity: MediaEntity(
            id: '8917',
            type: 'anime',
            nativeTitle: 'モーレツ宇宙海賊',
            nextAiringEpisodeUpdateTime: DateTime(2000),
          ),
          mediaListEntity: const MediaListEntity(
            id: '1',
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
            nextAiringEpisodeUpdateTime: DateTime(2001),
          ),
          mediaListEntity: const MediaListEntity(
            id: '2',
            status: 'current',
            userId: '22',
            mediaId: '8111',
          ),
        )
      ];
      await dao.upsertMediaListAndMediaRelations(
          data
      );

      final expectation = expectLater(
        stream,
        emitsInOrder([
          [data[1], data[0]]
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
  });
}

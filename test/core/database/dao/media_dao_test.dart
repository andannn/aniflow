import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/dao/media_dao.dart';
import 'package:aniflow/core/database/relations/media_and_relation_type_entity.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('anime_database_test', () {
    late AniflowDatabase db;
    late MediaDao dao;

    setUp(() async {
      db = AniflowDatabase.test(NativeDatabase.memory());
      dao = db.mediaDao;
    });

    tearDown(() async {
      await db.close();
    });

    final dummyAnimeData = [
       MediaEntity(
          id: '5784',
          englishTitle: '',
          romajiTitle: 'Ai no Kusabi (2012)',
          nextAiringEpisode: 11,
          nativeTitle: '間の楔',
          startDate: DateTime(2024, 1, 2),
          format: 'TEST',
          coverImageExtraLarge:
              'https://s4.anilist.co/file/anilistcdn/media/anime/cover/small/bx5784-RRtXLc6endVP.jpg',
          coverImageColor: '#6b351a'),
      const MediaEntity(
          id: '8917',
          englishTitle: 'Bodacious Space Pirates',
          romajiTitle: 'Mouretsu Pirates',
          nativeTitle: 'モーレツ宇宙海賊',
          coverImageExtraLarge:
              'https://s4.anilist.co/file/anilistcdn/media/anime/cover/small/bx8917-mmUSOxFEQj3f.png',
          coverImageColor: '#50aee4'),
      const MediaEntity(
          id: '9523',
          englishTitle: '',
          romajiTitle: 'Minori Scramble!',
          nativeTitle: 'みのりスクランブル!',
          coverImageExtraLarge:
              'https://s4.anilist.co/file/anilistcdn/media/anime/cover/small/9523.jpg',
          coverImageColor: '#f10000'),
      const MediaEntity(
          id: '4353',
          englishTitle: '',
          romajiTitle: 'test test test!',
          coverImageExtraLarge:
              'https://s4.anilist.co/file/anilistcdn/media/anime/cover/small/91234123.jpg',
          coverImageColor: '#f10000')
    ];

    final dummyMediaRelation = [
      const MediaAndRelationTypeEntity(
        mediaRelation: 'alternative',
        media: MediaEntity(
          id: '8917',
          englishTitle: 'Bodacious Space Pirates',
          romajiTitle: 'Mouretsu Pirates',
          nativeTitle: 'モーレツ宇宙海賊',
          coverImageExtraLarge:
              'https://s4.anilist.co/file/anilistcdn/media/anime/cover/small/bx8917-mmUSOxFEQj3f.png',
          coverImageColor: '#50aee4',
        ),
      ),
      const MediaAndRelationTypeEntity(
        mediaRelation: 'character',
        media: MediaEntity(
          id: '9523',
          englishTitle: '',
          romajiTitle: 'Minori Scramble!',
          nativeTitle: 'みのりスクランブル!',
          coverImageExtraLarge:
              'https://s4.anilist.co/file/anilistcdn/media/anime/cover/small/9523.jpg',
          coverImageColor: '#f10000',
        ),
      ),
    ];

    final dummyExternalLinks = [
      const MediaExternalLinkEntity(
        id: '212',
        mediaId: '5784',
        site: '1',
      ),
      const MediaExternalLinkEntity(
        id: '124',
        mediaId: '9523',
        site: '2',
      ),
    ];

    test('anime_dao_insert_and_get', () async {
      await dao.upsertMediaByCategory('trendingAnime', medias: dummyAnimeData);

      final res = await dao.getMediaPageByCategory('trendingAnime', page: 1);
      expect(res, equals(dummyAnimeData));
    });

    test('anime_dao_insert_and_get_stream', () async {
      await dao.upsertMediaByCategory('trendingAnime', medias: dummyAnimeData);

      final steam = dao.getCategoryMediasStream('trendingAnime', limit: 5);

      final expectation = expectLater(
        steam,
        emitsInOrder([dummyAnimeData]),
      );
      await expectation;
    });

    test('user_data_insert_and_get_cross_ref', () async {
      await dao.upsertMediaByCategory('trendingAnime',
          medias: dummyAnimeData.sublist(0, 2));
      await dao.upsertMediaByCategory('currentSeasonAnime',
          medias: dummyAnimeData.sublist(1, 3));
      final res = await dao.getMediaPageByCategory('trendingAnime', page: 1);
      expect(res, equals(dummyAnimeData.sublist(0, 2)));
      final res1 =
          await dao.getMediaPageByCategory('currentSeasonAnime', page: 1);
      expect(res1, equals(dummyAnimeData.sublist(1, 3)));
    });

    test('get_media_relation', () async {
      await dao.upsertMediaRelations('1', dummyMediaRelation);
      final stream = dao.getMediaRelationsStream('1');
      final res = await stream.first;
      expect(res, equals(dummyMediaRelation));
    });

    test('get_medias', () async {
      await dao.insertOrUpdateMedia(dummyAnimeData);
      final res = await dao.getMedias(['5784', '8917']);
      expect(res.length, equals(2));
    });

    test('external links', () async {
      final stream = dao.getAllExternalLinksOfMediaStream('5784');

      await dao.upsertMediaExternalLinks(dummyExternalLinks);
      final expectation = expectLater(
        stream,
        emitsInOrder([
          [dummyExternalLinks[0]]
        ]),
      );

      await expectation;
    });

    test('clear category media cross ref', () async {
      await dao.upsertMediaByCategory('trendingAnime', medias: dummyAnimeData);

      await dao.clearCategoryMediaCrossRef('trendingAnime');

      final res = await dao.getMediaPageByCategory('trendingAnime', page: 1);

      expect(res, equals([]));
    });

    test('test update_next_airing_episode_update_time_trigger', () async {
      await dao.insertOrUpdateMedia(dummyAnimeData);

      await (db.update(db.mediaTable)..where((t) => t.id.equals('5784')))
          .write(const MediaTableCompanion(nextAiringEpisode: Value(12)));

      await (db.select(db.mediaTable)..where((t) => t.id.equals('5784'))).get();
    });

    test('get medias by time range', () async {
      await dao.insertOrUpdateMedia(dummyAnimeData);

      final res = await dao.getMediasByTimeRange(
        page: 1,
        perPage: 12,
        mediaFormat: ['TEST'],
        startDate: DateTime(2024, 1, 2),
        endDate: DateTime(2024, 1, 3),
      );
      expect(res, equals([dummyAnimeData[0]]));
    });
  });
}

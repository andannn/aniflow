import 'package:aniflow/core/common/model/anime_category.dart';
import 'package:aniflow/core/common/model/media_relation.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/model/airing_schedules_entity.dart';
import 'package:aniflow/core/database/model/character_entity.dart';
import 'package:aniflow/core/database/model/media_entity.dart';
import 'package:aniflow/core/database/model/media_external_link_entity.dart';
import 'package:aniflow/core/database/model/relations/character_and_voice_actor_relation.dart';
import 'package:aniflow/core/database/model/relations/media_relation_entities_with_owner_id.dart';
import 'package:aniflow/core/database/model/staff_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  group('anime_database_test', () {
    final animeDatabase = AniflowDatabase();

    final dummyAnimeData = [
      MediaEntity(
          id: '5784',
          englishTitle: '',
          romajiTitle: 'Ai no Kusabi (2012)',
          nativeTitle: '間の楔',
          coverImage:
              'https://s4.anilist.co/file/anilistcdn/media/anime/cover/small/bx5784-RRtXLc6endVP.jpg',
          coverImageColor: '#6b351a'),
      MediaEntity(
          id: '8917',
          englishTitle: 'Bodacious Space Pirates',
          romajiTitle: 'Mouretsu Pirates',
          nativeTitle: 'モーレツ宇宙海賊',
          coverImage:
              'https://s4.anilist.co/file/anilistcdn/media/anime/cover/small/bx8917-mmUSOxFEQj3f.png',
          coverImageColor: '#50aee4'),
      MediaEntity(
          id: '9523',
          englishTitle: '',
          romajiTitle: 'Minori Scramble!',
          nativeTitle: 'みのりスクランブル!',
          coverImage:
              'https://s4.anilist.co/file/anilistcdn/media/anime/cover/small/9523.jpg',
          coverImageColor: '#f10000'),
      MediaEntity(
          id: '4353',
          englishTitle: '',
          romajiTitle: 'test test test!',
          coverImage:
              'https://s4.anilist.co/file/anilistcdn/media/anime/cover/small/91234123.jpg',
          coverImageColor: '#f10000')
    ];

    final dummyMediaRelation = MediaRelationEntitiesWithOwnerId(
      ownerId: '4353',
      medias: [
        MediaRelationEntity(
          MediaRelation.alternative,
          MediaEntity(
            id: '8917',
            englishTitle: 'Bodacious Space Pirates',
            romajiTitle: 'Mouretsu Pirates',
            nativeTitle: 'モーレツ宇宙海賊',
            coverImage:
                'https://s4.anilist.co/file/anilistcdn/media/anime/cover/small/bx8917-mmUSOxFEQj3f.png',
            coverImageColor: '#50aee4',
          ),
        ),
        MediaRelationEntity(
          MediaRelation.character,
          MediaEntity(
            id: '9523',
            englishTitle: '',
            romajiTitle: 'Minori Scramble!',
            nativeTitle: 'みのりスクランブル!',
            coverImage:
                'https://s4.anilist.co/file/anilistcdn/media/anime/cover/small/9523.jpg',
            coverImageColor: '#f10000',
          ),
        ),
      ],
    );

    final dummyCharacterData = [
      CharacterEntity(
        id: '2736',
        voiceActorId: '95084',
        image:
            'https://s4.anilist.co/file/anilistcdn/character/large/b2736-0Eoluq9UxXu4.png',
        nameEnglish: 'Grencia Mars Elijah Guo Eckener',
        nameNative: 'グレン',
      ),
      CharacterEntity(
        id: '6694',
        voiceActorId: '95262',
        image:
            'https://s4.anilist.co/file/anilistcdn/character/large/b6694-y0PmKzrcVa7A.png',
        nameEnglish: 'Judy',
        nameNative: 'ジュディ',
      ),
      CharacterEntity(
        id: '2334',
        voiceActorId: '95262',
        image:
            'https://s4.anilist.co/file/anilistcdn/character/large/b6694-y0PmKzrcVa7A.png',
        nameEnglish: 'Jack',
      ),
    ];

    final dummyVoiceActorData = [
      StaffEntity(
        id: '95084',
        image:
            'https://s4.anilist.co/file/anilistcdn/staff/large/n95084-RTrZSU38POPF.png',
        nameNative: '若本規夫',
        nameEnglish: 'Norio Wakamoto',
      ),
      StaffEntity(
        id: '95262',
        image: 'https://s4.anilist.co/file/anilistcdn/staff/large/262.jpg',
        nameNative: '堀内賢雄',
        nameEnglish: 'Kenyuu Horiuchi',
      ),
      StaffEntity(
        id: '95346',
        image: 'https://s4.anilist.co/file/anilistcdn/staff/large/262.jpg',
        nameEnglish: 'Character A',
      ),
    ];

    // final dummyStaff = [
    //   StaffEntity(id: '1234', nameEnglish: 'nameA'),
    //   StaffEntity(id: '4567', nameEnglish: 'nameB'),
    // ];

    final dummyAiringSchedule = [
      AiringSchedulesEntity(id: '122', mediaId: '5784', airingAt: 1),
      AiringSchedulesEntity(id: '132', mediaId: '8917', airingAt: 3),
      AiringSchedulesEntity(id: '142', mediaId: '4353', airingAt: 2),
      AiringSchedulesEntity(id: '152', mediaId: '9523', airingAt: 4),
    ];
    final dummyExternalLinks = [
      MediaExternalLinkEntity(
        id: '212',
        animeId: '5784',
        site: 'youtube',
      ),
      MediaExternalLinkEntity(
        id: '124',
        animeId: '9523',
        site: 'bilibili',
      ),
    ];

    setUp(() async {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;

      await animeDatabase.initDatabase(path: inMemoryDatabasePath);
    });

    tearDown(() async {
      await animeDatabase.aniflowDB.close();
    });

    test('anime_dao_clear_all', () async {
      final animeDao = animeDatabase.getMediaInformationDaoDao();
      await animeDao.clearAnimeCategoryCrossRef(MediaCategory.movieAnime);
    });

    test('anime_dao_insert', () async {
      final animeDao = animeDatabase.getMediaInformationDaoDao();
      await animeDao.insertOrIgnoreMediaByAnimeCategory(
          MediaCategory.trendingAnime,
          animeList: dummyAnimeData);
    });

    test('anime_dao_insert_and_get', () async {
      final animeDao = animeDatabase.getMediaInformationDaoDao();
      await animeDao.insertOrIgnoreMediaByAnimeCategory(
          MediaCategory.trendingAnime,
          animeList: dummyAnimeData);

      final res =
          await animeDao.getMediaByPage(MediaCategory.trendingAnime, page: 1);
      expect(res, equals(dummyAnimeData));
    });

    test('user_data_insert_and_get_cross_ref', () async {
      final animeDao = animeDatabase.getMediaInformationDaoDao();
      await animeDao.insertOrIgnoreMediaByAnimeCategory(
          MediaCategory.trendingAnime,
          animeList: dummyAnimeData.sublist(0, 2));
      await animeDao.insertOrIgnoreMediaByAnimeCategory(
          MediaCategory.currentSeasonAnime,
          animeList: dummyAnimeData.sublist(1, 3));
      final res =
          await animeDao.getMediaByPage(MediaCategory.trendingAnime, page: 1);
      expect(res, equals(dummyAnimeData.sublist(0, 2)));
      final res1 = await animeDao
          .getMediaByPage(MediaCategory.currentSeasonAnime, page: 1);
      expect(res1, equals(dummyAnimeData.sublist(1, 3)));
    });

    test('upsert_detail_anime_data', () async {
      final animeDao = animeDatabase.getMediaInformationDaoDao();
      await animeDao.upsertMediaInformation([dummyAnimeData[0]]);
      final res = await animeDatabase.aniflowDB.query(Tables.mediaTable);
      expect(MediaEntity.fromJson(res.first), equals(dummyAnimeData[0]));
    });

    test('upsert_voice_actor_data', () async {
      final animeDao = animeDatabase.getMediaInformationDaoDao();
      await animeDao.upsertStaffInfo(dummyVoiceActorData);
    });

    test('insert_airing_schedule', () async {
      final animeDao = animeDatabase.getMediaInformationDaoDao();
      await animeDao.upsertAiringSchedules(schedules: dummyAiringSchedule);
    });

    test('get_airing_schedule_by_range', () async {
      final animeDao = animeDatabase.getMediaInformationDaoDao();
      await animeDao.upsertAiringSchedules(schedules: dummyAiringSchedule);
      await animeDao.upsertMediaInformation(dummyAnimeData);

      final result =
          await animeDao.getAiringSchedulesByTimeRange(timeRange: (1000, 4000));

      expect(
          result.map((e) => e.airingSchedule).toList(),
          equals(dummyAiringSchedule.sublist(0, 3)
            ..sort((a, b) => a.airingAt!.compareTo(b.airingAt!))));
    });

    test('upsert_media_external_links_test', () async {
      final animeDao = animeDatabase.getMediaInformationDaoDao();

      await animeDao.upsertMediaInformation(dummyAnimeData);
      await animeDao.upsertMediaExternalLinks(
          externalLinks: dummyExternalLinks);
      await animeDao.upsertMediaRelations(relationEntity: dummyMediaRelation);

      final result = await animeDao.getDetailMediaInfo('5784');
      expect(result.externalLinks, equals([dummyExternalLinks[0]]));
    });

    test('query_character_page', () async {
      final animeDao = animeDatabase.getMediaInformationDaoDao();

      await animeDao.insertCharacterVoiceActors(mediaId: 5784, entities: [
        CharacterAndVoiceActorRelation(
            characterEntity: dummyCharacterData[0], voiceActorEntity: null),
        CharacterAndVoiceActorRelation(
            characterEntity: dummyCharacterData[1], voiceActorEntity: null),
        CharacterAndVoiceActorRelation(
            characterEntity: dummyCharacterData[2], voiceActorEntity: null),
      ]);

      await animeDao.getCharacterOfMediaByPage('5784', page: 1);
    });

    test('insert_media_relation', () async {
      final animeDao = animeDatabase.getMediaInformationDaoDao();
      await animeDao.upsertMediaRelations(relationEntity: dummyMediaRelation);
    });

    test('get_media_relation', () async {
      final animeDao = animeDatabase.getMediaInformationDaoDao();
      await animeDao.upsertMediaRelations(relationEntity: dummyMediaRelation);
      final res = await animeDao.getMediaRelations('4353');
      expect(res.map((e) => e.media),
          equals(dummyMediaRelation.medias.map((e) => e.media)));
    });
  });
}

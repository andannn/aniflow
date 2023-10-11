import 'package:anime_tracker/core/database/anime_dao.dart';
import 'package:anime_tracker/core/database/anime_database.dart';
import 'package:anime_tracker/core/data/repository/ani_list_repository.dart';
import 'package:anime_tracker/core/database/model/airing_schedules_entity.dart';
import 'package:anime_tracker/core/database/model/anime_entity.dart';
import 'package:anime_tracker/core/database/model/character_entity.dart';
import 'package:anime_tracker/core/database/model/user_data_entity.dart';
import 'package:anime_tracker/core/database/model/staff_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  group('anime_database_test', () {
    final animeDatabase = AnimeDatabase();

    final dummyAnimeData = [
      AnimeEntity(
          id: '5784',
          englishTitle: '',
          romajiTitle: 'Ai no Kusabi (2012)',
          nativeTitle: '間の楔',
          coverImage:
              'https://s4.anilist.co/file/anilistcdn/media/anime/cover/small/bx5784-RRtXLc6endVP.jpg',
          coverImageColor: '#6b351a'),
      AnimeEntity(
          id: '8917',
          englishTitle: 'Bodacious Space Pirates',
          romajiTitle: 'Mouretsu Pirates',
          nativeTitle: 'モーレツ宇宙海賊',
          coverImage:
              'https://s4.anilist.co/file/anilistcdn/media/anime/cover/small/bx8917-mmUSOxFEQj3f.png',
          coverImageColor: '#50aee4'),
      AnimeEntity(
          id: '9523',
          englishTitle: '',
          romajiTitle: 'Minori Scramble!',
          nativeTitle: 'みのりスクランブル!',
          coverImage:
              'https://s4.anilist.co/file/anilistcdn/media/anime/cover/small/9523.jpg',
          coverImageColor: '#f10000'),
      AnimeEntity(
          id: '4353',
          englishTitle: '',
          romajiTitle: 'test test test!',
          coverImage:
              'https://s4.anilist.co/file/anilistcdn/media/anime/cover/small/91234123.jpg',
          coverImageColor: '#f10000')
    ];

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
    ];

    final dummyStaff = [
      StaffEntity(id: '1234', nameEnglish: 'nameA'),
      StaffEntity(id: '4567', nameEnglish: 'nameB'),
    ];

    final dummyUserData = UserDataEntity(id: 'aa', avatar: "bb");

    final dummyAiringSchedule = [
      AiringSchedulesEntity(id: '122', mediaId: '5784', airingAt: 1),
      AiringSchedulesEntity(id: '132', mediaId: '8917', airingAt: 3),
      AiringSchedulesEntity(id: '142', mediaId: '4353', airingAt: 2),
      AiringSchedulesEntity(id: '152', mediaId: '9523', airingAt: 4),
    ];

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
      await animeDatabase.animeDB.delete(Tables.airingSchedulesTable);
    });

    test('anime_dao_clear_all', () async {
      final animeDao = animeDatabase.getAnimeDao();
      await animeDao.clearAll();
    });

    test('anime_dao_insert', () async {
      final animeDao = animeDatabase.getAnimeDao();
      await animeDao.insertOrIgnoreAnimeByAnimeCategory(AnimeCategory.trending,
          animeList: dummyAnimeData);
    });

    test('anime_dao_insert_and_get', () async {
      final animeDao = animeDatabase.getAnimeDao();
      await animeDao.insertOrIgnoreAnimeByAnimeCategory(AnimeCategory.trending,
          animeList: dummyAnimeData);

      final res =
          await animeDao.getAnimeByPage(AnimeCategory.trending, page: 1);
      expect(res, equals(dummyAnimeData));
    });

    test('user_data_insert_and_get_cross_ref', () async {
      final animeDao = animeDatabase.getAnimeDao();
      await animeDao.insertOrIgnoreAnimeByAnimeCategory(AnimeCategory.trending,
          animeList: dummyAnimeData.sublist(0, 2));
      await animeDao.insertOrIgnoreAnimeByAnimeCategory(
          AnimeCategory.currentSeason,
          animeList: dummyAnimeData.sublist(1, 3));
      final res =
          await animeDao.getAnimeByPage(AnimeCategory.trending, page: 1);
      expect(res, equals(dummyAnimeData.sublist(0, 2)));
      final res1 =
          await animeDao.getAnimeByPage(AnimeCategory.currentSeason, page: 1);
      expect(res1, equals(dummyAnimeData.sublist(1, 3)));
    });

    test('upsert_detail_anime_data', () async {
      final animeDao = animeDatabase.getAnimeDao();
      await animeDao.upsertAnimeInformation([dummyAnimeData[0]]);
      final res = await animeDatabase.animeDB.query(Tables.animeTable);
      expect(AnimeEntity.fromJson(res.first), equals(dummyAnimeData[0]));
    });

    test('upsert_detail_character_data', () async {
      final animeDao = animeDatabase.getAnimeDao();
      await animeDao.upsertCharacterInfo(dummyCharacterData);
    });

    test('upsert_voice_actor_data', () async {
      final animeDao = animeDatabase.getAnimeDao();
      await animeDao.upsertStaffInfo(dummyVoiceActorData);
    });

    test('upsert_anime_character_cross_ref_data', () async {
      final animeDao = animeDatabase.getAnimeDao();
      await animeDao.upsertAnimeCharacterCrossRef(
        crossRefs: [
          AnimeCharacterCrossRef(animeId: '5784', characterId: '2736'),
        ],
      );
    });

    test('upsert_and_get_detail_anime_data', () async {
      final animeDao = animeDatabase.getAnimeDao();
      await animeDao.upsertAnimeInformation(dummyAnimeData);

      await animeDao.upsertCharacterInfo(dummyCharacterData);

      await animeDao.upsertStaffInfo(dummyVoiceActorData);

      await animeDao.upsertStaffInfo(dummyStaff);

      await animeDao.upsertAnimeCharacterCrossRef(
        crossRefs: [
          AnimeCharacterCrossRef(animeId: '5784', characterId: '2736'),
          AnimeCharacterCrossRef(animeId: '5784', characterId: '6694'),
        ],
      );

      await animeDao.upsertAnimeStaffCrossRef(
        crossRefs: [
          AnimeStaffCrossRef(
              animeId: '5784', staffId: '1234', staffRole: 'job 1'),
          AnimeStaffCrossRef(
              animeId: '5784', staffId: '4567', staffRole: 'job b'),
        ],
      );

      final result = await animeDao.getDetailAnimeInfo('5784');
      expect(result.animeEntity, equals(dummyAnimeData[0]));
      expect(
        result.characterAndVoiceActors.map((e) => e.voiceActorEntity).toList(),
        equals(dummyVoiceActorData),
      );
      expect(
        result.characterAndVoiceActors.map((e) => e.characterEntity).toList(),
        equals(dummyCharacterData),
      );
      expect(
        result.staffs.map((e) => e.staff).toList(),
        equals(dummyStaff),
      );
      expect(
        result.staffs.map((e) => e.role).toList(),
        equals(['job 1', 'job b']),
      );
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

    test('insert_airing_schedule', () async {
      final animeDao = animeDatabase.getAnimeDao();
      await animeDao.upsertAiringSchedules(schedules: dummyAiringSchedule);
    });

    test('get_airing_schedule_by_range', () async {
      final animeDao = animeDatabase.getAnimeDao();
      await animeDao.upsertAiringSchedules(schedules: dummyAiringSchedule);
      await animeDao.upsertAnimeInformation(dummyAnimeData);

      final result =
          await animeDao.getAiringSchedulesByTimeRange(timeRange: (1000, 4000));

      expect(
          result.map((e) => e.airingSchedule).toList(),
          equals(dummyAiringSchedule
          .sublist(0, 3)
            ..sort((a, b) => a.airingAt!.compareTo(b.airingAt!))));
    });
  });
}

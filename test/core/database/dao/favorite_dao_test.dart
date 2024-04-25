import 'package:aniflow/core/common/definitions/favorite_category.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/dao/character_dao.dart';
import 'package:aniflow/core/database/dao/favorite_dao.dart';
import 'package:aniflow/core/database/dao/media_dao.dart';
import 'package:aniflow/core/database/dao/staff_dao.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('anime_database_test', () {
    late AniflowDatabase db;
    late FavoriteDao favoriteDao;
    late MediaDao mediaDao;
    late StaffDao staffDao;
    late CharacterDao characterDao;

    setUp(() async {
      db = AniflowDatabase.test(NativeDatabase.memory());
      favoriteDao = db.favoriteDao;
      mediaDao = db.mediaDao;
      staffDao = db.staffDao;
      characterDao = db.characterDao;
    });

    tearDown(() async {
      await db.close();
    });

    final dummyMediaData = [
      const MediaEntity(id: '33', type: 'ANIME', englishTitle: 'aaaaaaaaaaa'),
      const MediaEntity(id: '55', type: 'MANGA', englishTitle: 'bbbbbbbbbbb')
    ];

    final dummyStaffData = [
      const StaffEntity(
        id: '95084',
        largeImage:
        'https://s4.anilist.co/file/anilistcdn/staff/large/n95084-RTrZSU38POPF.png',
        firstName: '若本規夫',
      ),
    ];

    final dummyCharacterData = [
      const CharacterEntity(
        id: '2334',
        largeImage:
        'https://s4.anilist.co/file/anilistcdn/character/large/b6694-y0PmKzrcVa7A.png',
        firstName: 'Jack',
      ),
    ];

    test('get_favorite_anime', () async {
      await mediaDao.upsertMedia(dummyMediaData);
      await favoriteDao
          .insertFavoritesCrossRef('1', FavoriteType.anime, ['33']);
      await favoriteDao
          .insertFavoritesCrossRef('1', FavoriteType.manga, ['55']);

      final res =
          await favoriteDao.getFavoriteMediaByPage(MediaType.anime, '1', 1, 10);
      expect(res, equals([dummyMediaData[0]]));
    });

    test('get_favorite_staff', () async {
      await staffDao.upsertStaffEntities(dummyStaffData);
      await favoriteDao
          .insertFavoritesCrossRef('1', FavoriteType.staff, ['95084']);

      final res = await favoriteDao.getFavoriteStaffs('1', 1, 10);
      expect(res, equals([dummyStaffData[0]]));
    });

    test('get_favorite_character', () async {
      await characterDao.upsertCharacters(dummyCharacterData);
      await favoriteDao
          .insertFavoritesCrossRef('1', FavoriteType.character, ['2334']);

      final res = await favoriteDao.getFavoriteCharacters('1', 1, 10);
      expect(res, equals([dummyCharacterData[0]]));
    });
  });
}

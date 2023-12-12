import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/dao/character_dao.dart';
import 'package:aniflow/core/database/model/character_entity.dart';
import 'package:aniflow/core/database/model/media_entity.dart';
import 'package:aniflow/core/database/model/relations/character_and_related_media.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  group('character_dao_test', () {
    final animeDatabase = AniflowDatabase();
    CharacterDao characterDao = animeDatabase.getCharacterDao();

    setUp(() async {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;

      await animeDatabase.initDatabase(path: inMemoryDatabasePath);
    });

    tearDown(() async {
      await animeDatabase.aniflowDB.close();
    });

    final dummyCharacterAndRelatedMedia = CharacterAndRelatedMedia(
      character: CharacterEntity(id: '4', firstName: 'character a'),
      medias: [
        MediaEntity(id: '1', nativeTitle: 'media a'),
        MediaEntity(id: '2', nativeTitle: 'media b'),
      ],
    );

    final dummyCharacter = CharacterAndRelatedMedia(
      character: CharacterEntity(id: '4', firstName: 'character a'),
      medias: [],
    );

    test('insert_and_get_character_and_related_media', () async {
      await characterDao
          .insertCharacterAndRelatedMedia(dummyCharacterAndRelatedMedia);

      final res = await characterDao.getCharacterAndRelatedMedia('4');

      expect(res.character, equals(dummyCharacterAndRelatedMedia.character));
      expect(res.medias, equals(dummyCharacterAndRelatedMedia.medias));
    });

    test('insert_and_get_character', () async {
      await characterDao
          .insertCharacterAndRelatedMedia(dummyCharacter);

      final res = await characterDao.getCharacterAndRelatedMedia('4');

      expect(res.character, equals(dummyCharacter.character));
      expect(res.medias, equals([]));
    });

    test('insert_and_get_character_stream', () async {
      await characterDao
          .insertCharacterAndRelatedMedia(dummyCharacterAndRelatedMedia);

      final stream = characterDao.getCharacterStream('4');
      final res = await stream.first;
      expect(res.character, equals(dummyCharacterAndRelatedMedia.character));
      expect(res.medias, equals(dummyCharacterAndRelatedMedia.medias));
    });
  });
}

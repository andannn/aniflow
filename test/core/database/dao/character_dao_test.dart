import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/dao/character_dao.dart';
import 'package:aniflow/core/database/relations/character_and_related_media_relation.dart';
import 'package:aniflow/core/database/relations/character_and_voice_actor_relation.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('character_dao_test', () {
    late AniflowDatabase db;
    late CharacterDao dao;

    setUp(() async {
      db = AniflowDatabase.test(NativeDatabase.memory());
      dao = db.characterDao;
    });

    tearDown(() async {
      await db.close();
    });

    const dummyCharacterAndRelatedMedia = CharacterAndRelatedMediaRelation(
      character: CharacterEntity(id: '4', firstName: 'character a'),
      medias: [
        MediaEntity(id: '1', nativeTitle: 'media a'),
        MediaEntity(id: '2', nativeTitle: "media b"),
      ],
    );

    final dummyCharacterVoiceActorRelations = [
      const CharacterAndVoiceActorRelation(
          characterEntity: CharacterEntity(
            id: '2334',
            largeImage:
                'https://s4.anilist.co/file/anilistcdn/character/large/b6694-y0PmKzrcVa7A.png',
            firstName: 'Jack',
          ),
          voiceActorEntity: StaffEntity(
            id: '95346',
            largeImage:
                'https://s4.anilist.co/file/anilistcdn/staff/large/262.jpg',
            firstName: 'Character A',
          ),
          staffLanguage: 'japanese',
          characterRole: 'background'),
      const CharacterAndVoiceActorRelation(
          characterEntity: CharacterEntity(
            id: '6694',
            largeImage:
                'https://s4.anilist.co/file/anilistcdn/character/large/b6694-y0PmKzrcVa7A.png',
            firstName: 'Judy',
          ),
          voiceActorEntity: StaffEntity(
            id: '95262',
            largeImage:
                'https://s4.anilist.co/file/anilistcdn/staff/large/262.jpg',
            firstName: '堀内賢雄',
          ),
          staffLanguage: 'japanese',
          characterRole: 'background'),
    ];

    test('insert_and_get_character_and_related_media', () async {
      final stream = dao.getCharacterAndRelatedMediaStreamById('4');

      await dao.upsertCharacterAndRelatedMedia(dummyCharacterAndRelatedMedia);

      final expectation1 = expectLater(
        stream.map((e) => e.medias),
        emitsInOrder([dummyCharacterAndRelatedMedia.medias]),
      );

      await expectation1;
    });

    test('insert_and_get_related_media', () async {
      final stream = dao.getCharacterAndRelatedMediaStreamById('4');

      await dao.upsertCharacterAndRelatedMedia(dummyCharacterAndRelatedMedia);

      final expectation1 = expectLater(
        stream.map((e) => e.medias),
        emitsInOrder([dummyCharacterAndRelatedMedia.medias]),
      );

      await expectation1;
    });

    test('insert_and_get_character', () async {
      final stream = dao.getCharacterAndRelatedMediaStreamById('4');

      await dao.upsertCharacterAndRelatedMedia(dummyCharacterAndRelatedMedia);

      final expectation1 = expectLater(
        stream.map((e) => e.character),
        emitsInOrder([dummyCharacterAndRelatedMedia.character]),
      );

      await expectation1;
    });

    test('insert_all_and_get_character', () async {
      await dao.insertCharacterVoiceActorsOfMedia(
          '1', dummyCharacterVoiceActorRelations);

      final res = await dao.getCharacter('2334');

      expect(res, equals(dummyCharacterVoiceActorRelations[0].characterEntity));
    });

    test('insert_all_and_get_character', () async {
      await dao.insertCharacterVoiceActorsOfMedia(
          '1', dummyCharacterVoiceActorRelations);

      final res = await dao.getCharacter('2334');

      expect(res, equals(dummyCharacterVoiceActorRelations[0].characterEntity));
    });

    test('insert_all_and_get_character_voice_actor_relation', () async {
      await dao.insertCharacterVoiceActorsOfMedia(
          '1', dummyCharacterVoiceActorRelations);

      final res = await dao.getCharacterOfMediaByPage('1',
          staffLanguage: 'japanese', page: 1);

      expect(res, equals(dummyCharacterVoiceActorRelations));
    });

    test('insert_all_and_clear_relations', () async {
      await dao.insertCharacterVoiceActorsOfMedia(
          '1', dummyCharacterVoiceActorRelations);

      await dao.clearMediaCharacterCrossRef('1');

      final res = await dao.getCharacterOfMediaByPage('1',
          staffLanguage: 'japanese', page: 1);

      expect(res, equals([]));
    });
  });
}

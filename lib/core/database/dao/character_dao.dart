import 'package:aniflow/core/common/definitions/media_category.dart';
import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/relations/character_and_related_media_relation.dart';
import 'package:aniflow/core/database/relations/character_and_voice_actor_relation.dart';
import 'package:aniflow/core/database/tables/category_media_paging_cross_reference_table.dart';
import 'package:aniflow/core/database/tables/character_media_cross_reference_table.dart';
import 'package:aniflow/core/database/tables/character_table.dart';
import 'package:aniflow/core/database/tables/character_voice_actor_cross_reference_table.dart';
import 'package:aniflow/core/database/tables/media_character_paging_cross_reference_table.dart';
import 'package:aniflow/core/database/tables/media_table.dart';
import 'package:aniflow/core/database/tables/staff_table.dart';
import 'package:collection/collection.dart';
import 'package:drift/drift.dart';

part 'character_dao.g.dart';

@DriftAccessor(tables: [
  CharacterTable,
  CharacterRelatedMediaCrossRefTable,
  CharacterVoiceActorCrossRefTable,
  MediaTable,
  MediaCharacterPagingCrossRefTable,
  CategoryMediaPagingCrossRefTable,
  StaffTable,
])
class CharacterDao extends DatabaseAccessor<AniflowDatabase>
    with _$CharacterDaoMixin {
  CharacterDao(super.db);

  Future upsertCharacters(
    List<CharacterEntity> entities,
  ) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(characterTable, entities);
    });
  }

  Future insertOrIgnoreCharacters(
    List<CharacterEntity> entities,
  ) async {
    await batch((batch) {
      batch.insertAll(characterTable, entities,
          mode: InsertMode.insertOrIgnore);
    });
  }

  Stream<CharacterAndRelatedMediaRelation>
      getCharacterAndRelatedMediaStreamById(String id) {
    final query = select(characterTable).join([
      leftOuterJoin(
          characterRelatedMediaCrossRefTable,
          characterRelatedMediaCrossRefTable.characterId
              .equalsExp(characterTable.id)),
      leftOuterJoin(mediaTable,
          characterRelatedMediaCrossRefTable.mediaId.equalsExp(mediaTable.id)),
    ])
      ..where(characterTable.id.equals(id));

    final streamRecord = query
        .map(
          (row) =>
              (row.readTable(characterTable), row.readTableOrNull(mediaTable)),
        )
        .watch();

    return streamRecord.map(
      (record) => CharacterAndRelatedMediaRelation(
        character: record.first.$1,
        medias: record.map((e) => e.$2).whereNotNull().toList(),
      ),
    );
  }

  /// upsert character table and ignore media table if conflict.
  Future upsertCharacterAndRelatedMedia(
      CharacterAndRelatedMediaRelation entity) {
    return batch((batch) {
      batch.insertAllOnConflictUpdate(characterTable, [entity.character]);

      batch.insertAll(
        mediaTable,
        entity.medias,
        mode: InsertMode.insertOrIgnore,
      );

      batch.insertAll(
        characterRelatedMediaCrossRefTable,
        entity.medias.map(
          (media) => CharacterRelatedMediaCrossRefTableCompanion.insert(
            characterId: entity.character.id,
            mediaId: media.id,
          ),
        ),
        mode: InsertMode.replace,
      );
    });
  }

  Future upsertBirthdayCharacters(
      List<CharacterAndRelatedMediaRelation> entities) {
    return batch((batch) {
      for (final entity in entities) {
        batch.insert(
          categoryMediaPagingCrossRefTable,
          CategoryMediaPagingCrossRefTableCompanion(
            category: const Value(CategoryColumnsValues.birthdayCharacters),
            mediaId: Value(entity.character.id),
            timeStamp: Value(DateTime.now().microsecondsSinceEpoch),
          ),
          mode: InsertMode.insertOrReplace,
        );

        batch.insertAllOnConflictUpdate(
          characterTable,
          [entity.character.toCompanion(true)],
        );

        batch.insertAll(
          mediaTable,
          entity.medias,
          mode: InsertMode.insertOrIgnore,
        );

        batch.insertAll(
          characterRelatedMediaCrossRefTable,
          entity.medias.map(
            (media) => CharacterRelatedMediaCrossRefTableCompanion.insert(
              characterId: entity.character.id,
              mediaId: media.id,
            ),
          ),
          mode: InsertMode.replace,
        );
      }
    });
  }

  Selectable<QueryRow> _birthdayCharactersQuery(limit, offset) {
    final customQuery = '''
      SELECT * 
      FROM (
        SELECT * FROM ${categoryMediaPagingCrossRefTable.actualTableName}
        WHERE ${categoryMediaPagingCrossRefTable.category.name} = ?
        LIMIT ?
        OFFSET ?
      )
      INNER JOIN ${characterTable.actualTableName}
      ON ${categoryMediaPagingCrossRefTable.mediaId.name} = ${characterTable.id.name}
      LEFT OUTER JOIN ${characterRelatedMediaCrossRefTable.actualTableName}
      ON ${characterRelatedMediaCrossRefTable.characterId.name} = ${characterTable.id.name}
      LEFT OUTER JOIN ${mediaTable.actualTableName}
      ON ${characterRelatedMediaCrossRefTable.mediaId.name} = ${mediaTable.id.name}
      WHERE
      (CAST(strftime('%m', ${characterTable.dateOfBirth.name}) AS INTEGER)) = ? AND
      (CAST(strftime('%d', ${characterTable.dateOfBirth.name}) AS INTEGER)) = ?
      ORDER BY ${categoryMediaPagingCrossRefTable.timeStamp.name} ASC 
    ''';

    return customSelect(
      customQuery,
      variables: [
        const Variable(CategoryColumnsValues.birthdayCharacters),
        Variable.withInt(limit),
        Variable.withInt(offset),
        Variable.withInt(DateTime.now().month),
        Variable.withInt(DateTime.now().day),
      ],
      readsFrom: {
        categoryMediaPagingCrossRefTable,
        characterTable,
        mediaTable,
        characterRelatedMediaCrossRefTable,
      },
    );
  }

  Stream<List<CharacterAndRelatedMediaRelation>> getBirthdayCharactersStream(
      int count) {
    final query = _birthdayCharactersQuery(count, 0);
    final recordStream = query
        .map(
          (row) => (
            character: characterTable.map(row.data),
            media: mediaTable.map(row.data),
          ),
        )
        .watch();
    return recordStream.map(
      (record) => record
          .groupListsBy((e) => e.character)
          .values
          .map(
            (e) => CharacterAndRelatedMediaRelation(
              character: e.first.character,
              medias: e.map((e) => e.media).toList(),
            ),
          )
          .toList(),
    );
  }

  Future<List<CharacterAndRelatedMediaRelation>> getBirthdayCharacters(
      int page, int perPage) async {
    final int limit = perPage;
    final int offset = (page - 1) * perPage;
    final query = _birthdayCharactersQuery(limit, offset);

    final resultRecord = await query
        .map(
          (row) => (
            character: characterTable.map(row.data),
            media: mediaTable.map(row.data),
          ),
        )
        .get();
    return resultRecord
        .groupListsBy((e) => e.character)
        .values
        .map(
          (e) => CharacterAndRelatedMediaRelation(
            character: e.first.character,
            medias: e.map((e) => e.media).toList(),
          ),
        )
        .toList();
  }

  Future<CharacterEntity> getCharacter(String id) {
    return (select(characterTable)..where((t) => t.id.equals(id))).getSingle();
  }

  Future clearBirthdayCharacters() async {
    return (delete(categoryMediaPagingCrossRefTable)
          ..where((tbl) => categoryMediaPagingCrossRefTable.category
              .equals(CategoryColumnsValues.birthdayCharacters)))
        .go();
  }

  Future<List<CharacterAndVoiceActorRelation>> getCharacterOfMediaByPage(
      String mediaId,
      {required String staffLanguage,
      required int page,
      int perPage = AfConfig.defaultPerPageCount}) {
    final int limit = perPage;
    final int offset = (page - 1) * perPage;

    final query = _characterPageQuery(
        staffLanguage: staffLanguage,
        mediaId: mediaId,
        limit: limit,
        offset: offset);

    return (query.map(
      (row) => CharacterAndVoiceActorRelation(
        characterEntity: row.readTable(characterTable),
        voiceActorEntity: row.readTableOrNull(staffTable),
        staffLanguage: row.read(characterVoiceActorCrossRefTable.language),
        characterRole: row.read(characterVoiceActorCrossRefTable.role),
      ),
    )).get();
  }

  Stream<List<CharacterAndVoiceActorRelation>> getCharacterListStream(
      String mediaId,
      {int count = 12,
      required String staffLanguage}) {
    final query = _characterPageQuery(
        staffLanguage: staffLanguage, mediaId: mediaId, limit: count);

    return (query.map(
      (row) => CharacterAndVoiceActorRelation(
        characterEntity: row.readTable(characterTable),
        voiceActorEntity: row.readTableOrNull(staffTable),
        staffLanguage: row.read(characterVoiceActorCrossRefTable.language),
        characterRole: row.read(characterVoiceActorCrossRefTable.role),
      ),
    )).watch();
  }

  JoinedSelectStatement<HasResultSet, dynamic> _characterPageQuery(
          {required staffLanguage,
          required mediaId,
          required limit,
          offset = 0}) =>
      select(characterTable).join([
        innerJoin(
            mediaCharacterPagingCrossRefTable,
            characterTable.id
                .equalsExp(mediaCharacterPagingCrossRefTable.characterId)),
        leftOuterJoin(
          characterVoiceActorCrossRefTable,
          characterTable.id
                  .equalsExp(characterVoiceActorCrossRefTable.characterId) &
              characterVoiceActorCrossRefTable.language.equals(staffLanguage),
        ),
        leftOuterJoin(staffTable,
            characterVoiceActorCrossRefTable.staffId.equalsExp(staffTable.id)),
      ])
        ..where(mediaCharacterPagingCrossRefTable.mediaId.equals(mediaId))
        ..orderBy(
            [OrderingTerm.asc(mediaCharacterPagingCrossRefTable.timeStamp)])
        ..limit(limit, offset: offset);

  Future insertCharacterVoiceActorsOfMedia(
    String mediaId,
    List<CharacterAndVoiceActorRelation> entities,
  ) {
    return batch((batch) {
      batch.insertAllOnConflictUpdate(
        mediaCharacterPagingCrossRefTable,
        entities.map(
          (e) => MediaCharacterPagingCrossRefTableCompanion(
            mediaId: Value(mediaId),
            characterId: Value(e.characterEntity.id),
            timeStamp: Value(DateTime.now().microsecondsSinceEpoch),
          ),
        ),
      );

      batch.insertAll(
        characterVoiceActorCrossRefTable,
        entities.where((e) => e.voiceActorEntity != null).map(
              (e) => CharacterVoiceActorCrossRefTableCompanion(
                characterId: Value(e.characterEntity.id),
                staffId: Value(e.voiceActorEntity!.id),
                role: Value.absentIfNull(e.characterRole),
                language: Value.absentIfNull(e.staffLanguage),
              ),
            ),
        mode: InsertMode.insertOrReplace,
      );

      batch.insertAll(
        characterTable,
        entities.map((e) => e.characterEntity),
        mode: InsertMode.insertOrIgnore,
      );

      batch.insertAll(
        staffTable,
        entities.map((e) => e.voiceActorEntity).whereNotNull(),
        mode: InsertMode.insertOrIgnore,
      );
    });
  }

  Future clearMediaCharacterCrossRef(String mediaId) {
    return (delete(mediaCharacterPagingCrossRefTable)
          ..where((tbl) =>
              mediaCharacterPagingCrossRefTable.mediaId.equals(mediaId)))
        .go();
  }
}

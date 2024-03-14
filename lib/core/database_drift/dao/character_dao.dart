import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/database_drift/aniflow_database.dart';
import 'package:aniflow/core/database_drift/relations/character_and_related_media_relation.dart';
import 'package:aniflow/core/database_drift/relations/character_and_voice_actor_relation.dart';
import 'package:aniflow/core/database_drift/tables/character_media_cross_reference_table.dart';
import 'package:aniflow/core/database_drift/tables/character_table.dart';
import 'package:aniflow/core/database_drift/tables/character_voice_actor_cross_reference_table.dart';
import 'package:aniflow/core/database_drift/tables/media_character_paging_cross_reference_table.dart';
import 'package:aniflow/core/database_drift/tables/media_table.dart';
import 'package:aniflow/core/database_drift/tables/staff_table.dart';
import 'package:collection/collection.dart';
import 'package:drift/drift.dart';

part 'character_dao.g.dart';

@DriftAccessor(tables: [
  CharacterTable,
  CharacterRelatedMediaCrossRefTable,
  CharacterVoiceActorCrossRefTable,
  MediaTable,
  MediaCharacterPagingCrossRefTable,
  StaffTable,
])
class CharacterDao extends DatabaseAccessor<AniflowDatabase2>
    with _$CharacterDaoMixin {
  CharacterDao(super.db);

  Future upsertCharacters(
    List<CharacterEntity> entities,
  ) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(characterTable, entities);
    });
  }

  Stream<CharacterAndRelatedMediaRelation> getCharacterAndRelatedMediaStream(
    String id,
  ) {
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

  Future<CharacterEntity> getCharacter(String id) {
    return (select(characterTable)..where((t) => t.id.equals(id))).getSingle();
  }

  Future<List<CharacterAndVoiceActorRelation>> getCharacterOfMediaByPage(
      String mediaId,
      {required String staffLanguage,
      required int page,
      int perPage = AfConfig.defaultPerPageCount}) {
    final int limit = perPage;
    final int offset = (page - 1) * perPage;
    final query = select(characterTable).join([
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
      ..orderBy([OrderingTerm.asc(mediaCharacterPagingCrossRefTable.timeStamp)])
      ..limit(limit, offset: offset);

    return (query.map(
      (row) => CharacterAndVoiceActorRelation(
        characterEntity: row.readTable(characterTable),
        voiceActorEntity: row.readTable(staffTable),
        staffLanguage: row.read(characterVoiceActorCrossRefTable.language),
        characterRole: row.read(characterVoiceActorCrossRefTable.role),
      ),
    )).get();
  }

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

      batch.insertAllOnConflictUpdate(
        characterVoiceActorCrossRefTable,
        entities.where((e) => e.voiceActorEntity != null).map(
              (e) => CharacterVoiceActorCrossRefTableCompanion(
                characterId: Value(e.characterEntity.id),
                staffId: Value(e.voiceActorEntity!.id),
                role: Value.ofNullable(e.characterRole),
                language: Value.ofNullable(e.staffLanguage),
              ),
            ),
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

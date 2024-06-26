import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/tables/studio_media_cross_reference_table.dart';
import 'package:aniflow/core/database/tables/studio_table.dart';
import 'package:drift/drift.dart';

part 'studio_dao.g.dart';

@DriftAccessor(tables: [StudioTable, StudioMediaCrossRefTable])
class StudioDao extends DatabaseAccessor<AniflowDatabase>
    with _$StudioDaoMixin {
  StudioDao(super.db);

  Future<StudioEntity?> getStudio(String id) {
    return (select(studioTable)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Stream<StudioEntity?> getStudioStream(String id) {
    return (select(studioTable)..where((t) => t.id.equals(id)))
        .watchSingleOrNull();
  }

  Future upsertStudioEntities(List<StudioEntity> entities) async {
    return attachedDatabase.transaction(() async {
      await batch((batch) {
        batch.insertAllOnConflictUpdate(studioTable, entities);
      });
    });
  }

  Future insertOrIgnoreStudioEntitiesOfMedia(
    String mediaId,
    List<StudioEntity> entities,
  ) async {
    return attachedDatabase.transaction(() async {
      await batch((batch) async {
        batch.insertAll(studioTable, entities, mode: InsertMode.insertOrIgnore);
        batch.insertAllOnConflictUpdate(
          studioMediaCrossRefTable,
          entities.map(
            (e) => StudioMediaCrossRefTableCompanion.insert(
              studioId: e.id,
              mediaId: mediaId,
            ),
          ),
        );
      });
    });
  }

  Stream<List<StudioEntity>> getStudioOfMediaStream(String mediaId) {
    final query = select(studioTable).join(
      [
        innerJoin(studioMediaCrossRefTable,
            studioTable.id.equalsExp(studioMediaCrossRefTable.studioId))
      ],
    )..where(
        studioMediaCrossRefTable.mediaId.equals(mediaId) &
            studioTable.isAnimationStudio.equals(true),
      );

    return (query.map((row) => row.readTable(studioTable))).watch();
  }

  Future insertOrIgnoreEntities(List<StudioEntity> entities) async {
    return attachedDatabase.transaction(() async {
      await batch((batch) {
        batch.insertAllOnConflictUpdate(
          studioTable,
          entities.map((e) => e.toCompanion(true)),
        );
      });
    });
  }
}

import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/relations/media_list_and_media_relation.dart';
import 'package:aniflow/core/database/tables/media_list_table.dart';
import 'package:aniflow/core/database/tables/media_table.dart';
import 'package:collection/collection.dart';
import 'package:drift/drift.dart';

part 'media_list_dao.g.dart';

@DriftAccessor(tables: [MediaListTable, MediaTable])
class MediaListDao extends DatabaseAccessor<AniflowDatabase2>
    with _$MediaListDaoMixin {
  MediaListDao(super.db);

  Future removeMediaListOfUser(String userId) {
    return (delete(mediaListTable)..where((t) => t.userId.equals(userId))).go();
  }

  Future<List<MediaListAndMedia>> getMediaListByPage(
      String userId, List<String> status,
      {required String mediaType,
      required int page,
      int perPage = AfConfig.defaultPerPageCount}) {
    final int limit = perPage;
    final int offset = (page - 1) * perPage;

    final query = select(mediaListTable).join([
      leftOuterJoin(mediaTable, mediaListTable.mediaId.equalsExp(mediaTable.id))
    ])
      ..where(
        mediaListTable.status.isIn(status) &
            mediaListTable.userId.equals(userId) &
            mediaTable.type.equals(mediaType),
      )
      ..orderBy([OrderingTerm.desc(mediaListTable.updatedAt)])
      ..limit(limit, offset: offset);

    return query
        .map(
          (row) => MediaListAndMedia(
              mediaListEntity: row.readTable(mediaListTable),
              mediaEntity: row.readTable(mediaTable)),
        )
        .get();
  }

  Stream<List<String>> getAllMediaIdInMediaListStream(
      String userId, List<String> status, String mediaType) {
    final query = select(mediaListTable).join([
      leftOuterJoin(mediaTable, mediaListTable.mediaId.equalsExp(mediaTable.id))
    ])
      ..where(
        mediaListTable.status.isIn(status) &
            mediaListTable.userId.equals(userId) &
            mediaTable.type.equals(mediaType),
      );

    return query
        .map((row) => row.read(mediaTable.id))
        .watch()
        .map((value) => value.whereNotNull().toList());
  }

  Future<MediaListEntity?> getMediaListItem(String mediaId) {
    return (select(mediaListTable)
          ..where((tbl) => mediaListTable.mediaId.equals(mediaId)))
        .getSingleOrNull();
  }

  Stream<MediaListEntity?> getMediaListOfUserStream(
      String userId, String mediaId) {
    return (select(mediaListTable)
          ..where((tbl) =>
              mediaListTable.id.equals(mediaId) &
              mediaListTable.userId.equals(userId)))
        .watchSingleOrNull();
  }

  Future upsertMediaListEntities(List<MediaListEntity> entities) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(mediaListTable, entities);
    });
  }

  Future deleteMediaListOfUser(String userId) {
    return (delete(mediaListTable)..where((tbl) => tbl.userId.equals(userId)))
        .go();
  }

  Stream<List<MediaListAndMedia>> getAllMediaListOfUserStream(
      String userId, List<String> status, String mediaType) {
    final query = select(mediaListTable).join([
      innerJoin(mediaTable, mediaListTable.mediaId.equalsExp(mediaTable.id))
    ])
      ..where(
        mediaListTable.status.isIn(status) &
            mediaListTable.userId.equals(userId) &
            mediaTable.type.equals(mediaType),
      );

    return query
        .map(
          (row) => MediaListAndMedia(
            mediaListEntity: row.readTable(mediaListTable),
            mediaEntity: row.readTable(mediaTable),
          ),
        )
        .watch();
  }

  /// upsert mediaList and ignore media when conflict.
  Future upsertMediaListAndMediaRelations(List<MediaListAndMedia> entities) {
    return batch((batch) {
      batch.insertAllOnConflictUpdate(
        mediaListTable,
        entities.map((e) => e.mediaListEntity),
      );

      batch.insertAllOnConflictUpdate(
        mediaTable,
        entities.map((e) => e.mediaEntity),
      );
    });
  }
}

import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/relations/media_and_relation_type_entity.dart';
import 'package:aniflow/core/database/tables/category_media_paging_cross_reference_table.dart';
import 'package:aniflow/core/database/tables/media_external_link_table.dart';
import 'package:aniflow/core/database/tables/media_relation_cross_reference_table.dart';
import 'package:aniflow/core/database/tables/media_table.dart';
import 'package:drift/drift.dart';

part 'media_dao.g.dart';

@DriftAccessor(tables: [
  MediaTable,
  MediaRelationCrossRefTable,
  MediaExternalLinkTable,
  CategoryMediaPagingCrossRefTable
])
class MediaDao extends DatabaseAccessor<AniflowDatabase> with _$MediaDaoMixin {
  MediaDao(super.db);

  Future<MediaEntity> getMedia(String id) {
    return getMedias([id]).then((value) => value.first);
  }

  Stream<MediaEntity> getMediaStream(String id) {
    return (select(mediaTable)..where((tbl) => mediaTable.id.equals(id)))
        .watchSingle();
  }

  Future<List<MediaEntity>> getMedias(List<String> ids) {
    return (select(mediaTable)..where((tbl) => mediaTable.id.isIn(ids))).get();
  }

  Stream<List<MediaAndRelationTypeEntity>> getMediaRelationsStream(
      String mediaId) {
    final query = select(mediaRelationCrossRefTable).join([
      innerJoin(mediaTable,
          mediaRelationCrossRefTable.relationId.equalsExp(mediaTable.id)),
    ])
      ..where(mediaRelationCrossRefTable.ownerId.equals(mediaId));

    return (query.map(
      (row) => MediaAndRelationTypeEntity(
        mediaRelation: row.read(mediaRelationCrossRefTable.relationType),
        media: row.readTable(mediaTable),
      ),
    )).watch();
  }

  Future upsertMediaRelations(
      String ownerId, List<MediaAndRelationTypeEntity> relationEntity) {
    return batch((batch) {
      batch.insertAllOnConflictUpdate(
        mediaRelationCrossRefTable,
        relationEntity.map(
          (e) => MediaRelationCrossRefTableCompanion(
            ownerId: Value(ownerId),
            relationId: Value(e.media.id),
            relationType: Value.absentIfNull(e.mediaRelation),
          ),
        ),
      );

      batch.insertAllOnConflictUpdate(
        mediaTable,
        relationEntity.map((e) => e.media.toCompanion(true)),
      );
    });
  }

  Future insertOrIgnoreMedia(List<MediaEntity> entities) {
    return batch((batch) {
      batch.insertAll(mediaTable, entities, mode: InsertMode.insertOrIgnore);
    });
  }

  Future insertOrUpdateMedia(List<MediaEntity> entities) {
    return batch((batch) {
      /// 1. Set media table column to Value.absent() if null.
      /// 2. Update nextAiringEpisode even if data is null because the
      ///    nextAiringEpisode will be null when last episode aired.
      batch.insertAllOnConflictUpdate(
        mediaTable,
        entities.map((e) => e
            .toCompanion(true)
            .copyWith(nextAiringEpisode: Value(e.nextAiringEpisode))),
      );
    });
  }

  Future upsertMediaExternalLinks(List<MediaExternalLinkEntity> entities) {
    return batch((batch) {
      batch.insertAllOnConflictUpdate(mediaExternalLinkTable, entities);
    });
  }

  Stream<List<MediaExternalLinkEntity>> getAllExternalLinksOfMediaStream(
    String mediaId,
  ) {
    return (select(mediaExternalLinkTable)
          ..where((tbl) => tbl.mediaId.equals(mediaId)))
        .watch();
  }

  Future<List<MediaEntity>> getMediaPageByCategory(String category,
      {required int page, int perPage = AfConfig.defaultPerPageCount}) {
    final int limit = perPage;
    final int offset = (page - 1) * perPage;

    final query = select(mediaTable).join([
      innerJoin(categoryMediaPagingCrossRefTable,
          categoryMediaPagingCrossRefTable.mediaId.equalsExp(mediaTable.id))
    ])
      ..where(categoryMediaPagingCrossRefTable.category.equals(category))
      ..orderBy([OrderingTerm.asc(categoryMediaPagingCrossRefTable.timeStamp)])
      ..limit(limit, offset: offset);

    return (query.map((row) => row.readTable(mediaTable))).get();
  }

  Future<List<MediaEntity>> getMediasByTimeRange({
    required int page,
    required int perPage,
    required List<String> mediaFormat,
    required DateTime startDate,
    required DateTime endDate,
  }) {
    final int limit = perPage;
    final int offset = (page - 1) * perPage;

    final query = select(mediaTable)
      ..where((t) =>
          t.startDate.isBiggerOrEqualValue(startDate) &
          t.startDate.isSmallerOrEqualValue(endDate) &
          t.format.isIn(mediaFormat))
      ..limit(limit, offset: offset);

    return query.get();
  }

  Stream<List<MediaEntity>> getCategoryMediasStream(String category,
      {required int limit}) {
    final query = select(mediaTable).join([
      innerJoin(categoryMediaPagingCrossRefTable,
          categoryMediaPagingCrossRefTable.mediaId.equalsExp(mediaTable.id))
    ])
      ..where(categoryMediaPagingCrossRefTable.category.equals(category))
      ..orderBy([OrderingTerm.asc(categoryMediaPagingCrossRefTable.timeStamp)])
      ..limit(limit);

    return (query.map((row) => row.readTable(mediaTable))).watch();
  }

  Future clearCategoryMediaCrossRef(String category) {
    return (delete(categoryMediaPagingCrossRefTable)
          ..where((tbl) => tbl.category.equals(category)))
        .go();
  }

  Future upsertMediaByCategory(String category,
      {required List<MediaEntity> medias}) {
    return batch((batch) {
      batch.insertAllOnConflictUpdate(
        categoryMediaPagingCrossRefTable,
        medias.map(
          (e) => CategoryMediaPagingCrossRefTableCompanion(
            category: Value(category),
            mediaId: Value(e.id),
            timeStamp: Value(DateTime.now().microsecondsSinceEpoch),
          ),
        ),
      );

      batch.insertAllOnConflictUpdate(
        mediaTable,
        medias.map((e) => e.toCompanion(true)),
      );
    });
  }
}

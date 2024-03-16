import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/database_drift/aniflow_database.dart';
import 'package:aniflow/core/database_drift/relations/media_and_relation_type_entity.dart';
import 'package:aniflow/core/database_drift/tables/category_media_paging_cross_reference_table.dart';
import 'package:aniflow/core/database_drift/tables/media_external_link_table.dart';
import 'package:aniflow/core/database_drift/tables/media_relation_cross_reference_table.dart';
import 'package:aniflow/core/database_drift/tables/media_table.dart';
import 'package:drift/drift.dart';

part 'media_dao.g.dart';

@DriftAccessor(tables: [
  MediaTable,
  MediaRelationCrossRefTable,
  MediaExternalLinkTable,
  CategoryMediaPagingCrossRefTable
])
class MediaDao extends DatabaseAccessor<AniflowDatabase2> with _$MediaDaoMixin {
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

  Future<List<MediaAndRelationTypeEntity>> getMediaRelations(String mediaId) {
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
    )).get();
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
            relationType: Value.ofNullable(e.mediaRelation),
          ),
        ),
      );

      batch.insertAll(
        mediaTable,
        relationEntity.map((e) => e.media),
        mode: InsertMode.insertOrIgnore,
      );
    });
  }

  Future insertOrIgnoreMedia(List<MediaEntity> entities) {
    return batch((batch) {
      batch.insertAll(mediaTable, entities, mode: InsertMode.insertOrIgnore);
    });
  }

  Future upsertMedia(List<MediaEntity> entities) {
    return batch((batch) {
      batch.insertAllOnConflictUpdate(mediaTable, entities);
    });
  }

  Future upsertMediaExternalLinks(List<MediaExternalLinkEntity> entities) {
    return batch((batch) {
      batch.insertAllOnConflictUpdate(mediaExternalLinkTable, entities);
    });
  }

  Future<List<MediaExternalLinkEntity>> getAllExternalLinksOfMedia(
    String mediaId,
  ) {
    return (select(mediaExternalLinkTable)
          ..where((tbl) => tbl.mediaId.equals(mediaId)))
        .get();
  }

  Future<List<MediaEntity>> getMediaByPage(String category,
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

      batch.insertAll(mediaTable, medias, mode: InsertMode.insertOrIgnore);
    });
  }
}

// @override
// Future<MediaWithDetailInfo> getDetailMediaInfo(String id) async {
//   final animeJson = await database.aniflowDB.query(
//     Tables.mediaTable,
//     where: '${MediaTableColumns.id}=$id',
//     limit: 1,
//   );
//   final animeEntity = MediaEntity.fromJson(animeJson.first);
//
//   final characterResults = await getCharacterOfMediaByPage(id, page: 1);
//
//   final staffResults = await getStaffOfMediaByPage(id, page: 1);
//
//   final studios = await getStudioOfMedia(id);
//
//   String externalLinkSql =
//       'select * from ${Tables.mediaExternalLickTable} as media '
//       'where media.${MediaExternalLinkColumnValues.mediaId} = \'$id\' ';
//   List externalLinkResults =
//   await database.aniflowDB.rawQuery(externalLinkSql);
//
//   final mediaRelations = await getMediaRelations(id);
//
//   return MediaWithDetailInfo(
//     mediaEntity: animeEntity,
//     characterAndVoiceActors: characterResults,
//     staffs: staffResults,
//     externalLinks: externalLinkResults
//         .map((e) => MediaExternalLinkEntity.fromJson(e))
//         .toList(),
//     mediaRelations: mediaRelations,
//     studios: studios,
//   );
// }

// @override
// Stream<MediaWithDetailInfo> getDetailMediaInfoStream(String id) {
//   return database.createStream(
//       [
//         Tables.mediaTable,
//         Tables.studioTable,
//         Tables.characterTable,
//         Tables.staffTable,
//         Tables.mediaExternalLickTable,
//         Tables.mediaRelationCrossRef,
//       ], () => getDetailMediaInfo(id));
// }

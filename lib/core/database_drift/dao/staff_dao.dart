import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/database_drift/aniflow_database.dart';
import 'package:aniflow/core/database_drift/relations/staff_and_role_relation_entity.dart';
import 'package:aniflow/core/database_drift/tables/media_staff_paging_cross_reference_table.dart';
import 'package:aniflow/core/database_drift/tables/staff_table.dart';
import 'package:drift/drift.dart';

part 'staff_dao.g.dart';

@DriftAccessor(tables: [
  StaffTable,
  MediaStaffPagingCrossRefTable,
])
class StaffDao extends DatabaseAccessor<AniflowDatabase2> with _$StaffDaoMixin {
  StaffDao(super.db);

  Future upsertStaffEntities(List<StaffEntity> entities) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(staffTable, entities);
    });
  }
  Future insertOrIgnoreStaffEntities(List<StaffEntity> entities) async {
    await batch((batch) {
      batch.insertAll(staffTable, entities, mode: InsertMode.insertOrIgnore);
    });
  }

  Future<StaffEntity?> getStaff(String id) {
    return (select(staffTable)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Stream<StaffEntity?> getStaffStream(String id) {
    return (select(staffTable)..where((t) => t.id.equals(id)))
        .watchSingleOrNull();
  }

  Future insertStaffRelationEntitiesOfMedia(
      String mediaId, List<StaffAndRoleRelationEntity> entities) {
    return batch((batch) {
      batch.insertAllOnConflictUpdate(
        mediaStaffPagingCrossRefTable,
        entities.map(
          (e) => MediaStaffPagingCrossRefTableCompanion(
            mediaId: Value(mediaId),
            staffId: Value(e.staff.id),
            staffRole: Value(e.role),
            timeStamp: Value(DateTime.now().microsecondsSinceEpoch),
          ),
        ),
      );

      batch.insertAll(
        staffTable,
        entities.map((e) => e.staff),
        mode: InsertMode.insertOrIgnore,
      );
    });
  }

  Future<List<StaffAndRoleRelationEntity>> getStaffOfMediaByPage(String mediaId,
      {required int page, int perPage = AfConfig.defaultPerPageCount}) {
    final int limit = perPage;
    final int offset = (page - 1) * perPage;

    final query = select(staffTable).join([
      innerJoin(mediaStaffPagingCrossRefTable,
          staffTable.id.equalsExp(mediaStaffPagingCrossRefTable.staffId))
    ])
      ..where(mediaStaffPagingCrossRefTable.mediaId.equals(mediaId))
      ..orderBy([OrderingTerm.asc(mediaStaffPagingCrossRefTable.timeStamp)])
      ..limit(limit, offset: offset);

    return (query.map(
      (row) => StaffAndRoleRelationEntity(
        staff: row.readTable(staffTable),
        role: row.read(mediaStaffPagingCrossRefTable.staffRole)!,
      ),
    )).get();
  }
}
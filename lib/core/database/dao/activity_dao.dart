import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/relations/activity_and_user_relation.dart';
import 'package:aniflow/core/database/tables/activity_filter_type_paging_cross_reference_table.dart';
import 'package:aniflow/core/database/tables/activity_table.dart';
import 'package:aniflow/core/database/tables/media_table.dart';
import 'package:aniflow/core/database/tables/user_table.dart';
import 'package:collection/collection.dart';
import 'package:drift/drift.dart';

part 'activity_dao.g.dart';

@DriftAccessor(tables: [
  ActivityTable,
  UserTable,
  MediaTable,
  ActivityFilterTypePagingCrossRefTable,
])
class ActivityDao extends DatabaseAccessor<AniflowDatabase2>
    with _$ActivityDaoMixin {
  ActivityDao(super.db);

  /// upsert activities and ignore user and media if conflict.
  Future upsertActivityEntities(List<ActivityAndUserRelation> entities) {
    return batch((batch) {
      batch.insertAllOnConflictUpdate(
        activityTable,
        entities.map((e) => e.activity),
      );

      batch.insertAll(
        userTable,
        entities.map((e) => e.user),
        mode: InsertMode.insertOrIgnore,
      );

      batch.insertAll(
        mediaTable,
        entities.map((e) => e.media).whereNotNull(),
        mode: InsertMode.insertOrIgnore,
      );
    });
  }

  /// upsert activities and ignore user and media if conflict.
  Future upsertActivityEntitiesWithCategory(
      List<ActivityAndUserRelation> entities, String category) {
    return batch((batch) {
      batch.insertAllOnConflictUpdate(
        activityFilterTypePagingCrossRefTable,
        entities.map(
          (e) => ActivityFilterTypePagingCrossRefTableCompanion.insert(
            activityId: e.activity.id,
            category: category,
          ),
        ),
      );

      batch.insertAllOnConflictUpdate(
        activityTable,
        entities.map((e) => e.activity),
      );

      batch.insertAll(
        userTable,
        entities.map((e) => e.user),
        mode: InsertMode.insertOrIgnore,
      );

      batch.insertAll(
        mediaTable,
        entities.map((e) => e.media).whereNotNull(),
        mode: InsertMode.insertOrIgnore,
      );
    });
  }

  Future<List<ActivityAndUserRelation>> getActivityEntitiesByPage(
    String category, [
    int page = 1,
    int perPage = AfConfig.defaultPerPageCount,
  ]) {
    final int limit = perPage;
    final int offset = (page - 1) * perPage;

    final query = select(activityFilterTypePagingCrossRefTable).join([
      innerJoin(
          activityTable,
          activityTable.id
              .equalsExp(activityFilterTypePagingCrossRefTable.activityId)),
      innerJoin(userTable, activityTable.userId.equalsExp(userTable.id)),
      leftOuterJoin(mediaTable, activityTable.mediaId.equalsExp(mediaTable.id))
    ])
      ..where(activityFilterTypePagingCrossRefTable.category.equals(category))
      ..orderBy([OrderingTerm.asc(activityFilterTypePagingCrossRefTable.id)])
      ..limit(limit, offset: offset);

    return query
        .map((row) => ActivityAndUserRelation(
            user: row.readTable(userTable),
            activity: row.readTable(activityTable),
            media: row.readTableOrNull(mediaTable)))
        .get();
  }

  Future clearActivityEntities(String category) {
    return (delete(activityFilterTypePagingCrossRefTable)
          ..where((t) => t.category.equals(category)))
        .go();
  }

  Future<ActivityAndUserRelation> getActivity(String id) {
    final query = select(activityFilterTypePagingCrossRefTable).join([
      innerJoin(
          activityTable,
          activityTable.id
              .equalsExp(activityFilterTypePagingCrossRefTable.activityId)),
      innerJoin(userTable, activityTable.userId.equalsExp(userTable.id)),
      leftOuterJoin(mediaTable, activityTable.mediaId.equalsExp(mediaTable.id))
    ])
      ..where(activityTable.id.equals(id));

    return query
        .map((row) => ActivityAndUserRelation(
            user: row.readTable(userTable),
            activity: row.readTable(activityTable),
            media: row.readTableOrNull(mediaTable)))
        .getSingle();
  }

  Future<(int, int, bool)?> getActivityStatus(String id) {
    final query = select(activityTable)..where((t) => t.id.equals(id));

    return query
        .map((entity) => (entity.likeCount, entity.replyCount, entity.isLiked))
        .getSingleOrNull();
  }

  Stream<(int, int, bool)?> getActivityStatusStream(String id) {
    final query = select(activityTable)..where((t) => t.id.equals(id));

    return query
        .map((entity) => (entity.likeCount, entity.replyCount, entity.isLiked))
        .watchSingleOrNull();
  }

  Future updateActivityStatus(String id, (int, int, bool) record) {
    return (update(activityTable)..where((t) => t.id.equals(id))).write(
        ActivityTableCompanion(
            likeCount: Value(record.$1),
            replyCount: Value(record.$2),
            isLiked: Value(record.$3)));
  }
}

import 'package:aniflow/core/database_drift/aniflow_database.dart';
import 'package:aniflow/core/database_drift/relations/airing_schedule_and_media_relation.dart';
import 'package:aniflow/core/database_drift/tables/airing_schedule_table.dart';
import 'package:aniflow/core/database_drift/tables/media_table.dart';
import 'package:drift/drift.dart';

part 'airing_schedules_dao.g.dart';

@DriftAccessor(tables: [
  AiringScheduleTable,
  MediaTable,
])
class AiringSchedulesDao extends DatabaseAccessor<AniflowDatabase2>
    with _$AiringSchedulesDaoMixin {
  AiringSchedulesDao(super.db);

  Future upsertAiringSchedules(
      List<AiringScheduleAndMediaRelation> schedules) async {
    await batch((batch) {
      batch.insertAllOnConflictUpdate(
        airingScheduleTable,
        schedules.map((e) => e.airingSchedule),
      );

      batch.insertAll(
        mediaTable,
        schedules.map((e) => e.mediaEntity),
        mode: InsertMode.insertOrIgnore,
      );
    });
  }

  Future clearAiringSchedule() {
    return delete(airingScheduleTable).go();
  }

  Future<List<AiringScheduleAndMediaRelation>> getAiringSchedulesByTimeRange(
      {required (int startMs, int endMs) timeRange}) {
    final (startMs, endMs) = timeRange;
    final (startSecond, endSecond) = (startMs ~/ 1000, endMs ~/ 1000);

    final query = select(airingScheduleTable).join([
      innerJoin(
          mediaTable, airingScheduleTable.mediaId.equalsExp(mediaTable.id))
    ])
      ..where(airingScheduleTable.airingAt.isBiggerOrEqualValue(startSecond) &
          airingScheduleTable.airingAt.isSmallerOrEqualValue(endSecond))
      ..orderBy([OrderingTerm.asc(airingScheduleTable.airingAt)]);

    return (query.map(
      (row) => AiringScheduleAndMediaRelation(
        airingSchedule: row.readTable(airingScheduleTable),
        mediaEntity: row.readTable(mediaTable),
      ),
    )).get();
  }
}

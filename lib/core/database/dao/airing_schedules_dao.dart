import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/relations/airing_schedule_and_media_relation.dart';
import 'package:aniflow/core/database/tables/airing_schedule_table.dart';
import 'package:aniflow/core/database/tables/media_table.dart';
import 'package:drift/drift.dart';

part 'airing_schedules_dao.g.dart';

@DriftAccessor(tables: [
  AiringScheduleTable,
  MediaTable,
])
class AiringSchedulesDao extends DatabaseAccessor<AniflowDatabase>
    with _$AiringSchedulesDaoMixin {
  AiringSchedulesDao(super.db);

  Future upsertAiringSchedules(
      List<AiringScheduleAndMediaRelation> schedules) async {
    return attachedDatabase.transaction(() async {
      await batch((batch) {
        batch.insertAllOnConflictUpdate(
          airingScheduleTable,
          schedules.map((e) => e.airingSchedule),
        );

        batch.insertAllOnConflictUpdate(
          mediaTable,
          schedules.map((e) => e.mediaEntity.toCompanion(true)),
        );
      });
    });
  }

  Future clearAiringSchedule() {
    return attachedDatabase.transaction(() async {
      return delete(airingScheduleTable).go();
    });
  }

  Selectable<AiringScheduleAndMediaRelation> _getScheduleQuery(
    startSecond,
    endSecond,
  ) =>
      (select(airingScheduleTable).join([
        innerJoin(
            mediaTable, airingScheduleTable.mediaId.equalsExp(mediaTable.id))
      ])
            ..where(airingScheduleTable.airingAt
                    .isBiggerOrEqualValue(startSecond) &
                airingScheduleTable.airingAt.isSmallerOrEqualValue(endSecond))
            ..orderBy(
              [OrderingTerm.asc(airingScheduleTable.airingAt)],
            ))
          .map((row) => AiringScheduleAndMediaRelation(
                airingSchedule: row.readTable(airingScheduleTable),
                mediaEntity: row.readTable(mediaTable),
              ));

  Future<List<AiringScheduleAndMediaRelation>> getAiringSchedulesByTimeRange(
      {required (int startMs, int endMs) timeRange}) {
    final (startMs, endMs) = timeRange;
    final (startSecond, endSecond) = (startMs ~/ 1000, endMs ~/ 1000);
    return _getScheduleQuery(startSecond, endSecond).get();
  }

  Stream<List<AiringScheduleAndMediaRelation>>
      getAiringSchedulesByTimeRangeStream(
          {required (int startMs, int endMs) timeRange}) {
    final (startMs, endMs) = timeRange;
    final (startSecond, endSecond) = (startMs ~/ 1000, endMs ~/ 1000);

    return _getScheduleQuery(startSecond, endSecond).watch();
  }
}

// ignore_for_file: lines_longer_than_80_chars

import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/dao/media_dao.dart';
import 'package:aniflow/core/database/model/airing_schedules_entity.dart';
import 'package:aniflow/core/database/model/media_entity.dart';
import 'package:aniflow/core/database/model/relations/airing_schedule_and_media_relation.dart';
import 'package:sqflite/sqflite.dart';

/// [Tables.airingSchedulesTable]
mixin AiringSchedulesColumns {
  static const String id = 'airing_schedules_id';
  static const String mediaId = 'airing_schedules_media_id';
  static const String airingAt = 'airing_schedules_airing_at';
  static const String timeUntilAiring = 'airing_schedules_time_until_airing';
  static const String episode = 'airing_schedules_episode';
}

abstract class AiringScheduleDao {
  Future upsertAiringSchedules(
      {required List<AiringSchedulesEntity> schedules});

  /// Get airing schedules in time range of [startMs, endMs]
  Future<List<AiringScheduleAndMediaRelation>> getAiringSchedulesByTimeRange(
      {required (int startMs, int endMs) timeRange});

  Future clearAiringSchedule();
}

class AiringScheduleDaoImpl extends AiringScheduleDao {
  final AniflowDatabase database;

  AiringScheduleDaoImpl(this.database);

  @override
  Future upsertAiringSchedules(
      {required List<AiringSchedulesEntity> schedules}) async {
    final batch = database.aniflowDB.batch();
    for (final schedule in schedules) {
      batch.insert(
        Tables.airingSchedulesTable,
        schedule.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    await batch.commit(noResult: true);

    database.notifyChanged([
      Tables.airingSchedulesTable,
    ]);
  }

  @override
  Future<List<AiringScheduleAndMediaRelation>> getAiringSchedulesByTimeRange(
      {required (int startMs, int endMs) timeRange}) async {
    final (startMs, endMs) = timeRange;
    final (startSecond, endSecond) = (startMs ~/ 1000, endMs ~/ 1000);

    final sql = 'select * from ${Tables.airingSchedulesTable} as air '
        'join ${Tables.mediaTable} as media '
        '  on air.${AiringSchedulesColumns.mediaId} = media.${MediaTableColumns.id} '
        'where air.${AiringSchedulesColumns.airingAt} >= $startSecond '
        '  and air.${AiringSchedulesColumns.airingAt} < $endSecond '
        'order by air.${AiringSchedulesColumns.airingAt} asc ';

    List results = await database.aniflowDB.rawQuery(sql);

    return results
        .map(
          (e) => AiringScheduleAndMediaRelation(
            airingSchedule: AiringSchedulesEntity.fromJson(e),
            mediaEntity: MediaEntity.fromJson(e),
          ),
        )
        .toList();
  }

  @override
  Future clearAiringSchedule() async {
    await database.aniflowDB.delete(Tables.airingSchedulesTable);

    database.notifyChanged([
      Tables.airingSchedulesTable,
    ]);
  }
}

import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/dao/airing_schedules_dao.dart';
import 'package:aniflow/core/database/relations/airing_schedule_and_media_relation.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('anime_database_test', () {
    late AniflowDatabase2 db;
    late AiringSchedulesDao dao;

    setUp(() async {
      db = AniflowDatabase2.test(NativeDatabase.memory());
      dao = db.airingSchedulesDao;
    });

    tearDown(() async {
      await db.close();
    });

    final dummyAiringSchedule = [
      const AiringScheduleAndMediaRelation(
        airingSchedule: AiringScheduleEntity(
          id: '122',
          mediaId: '5784',
          airingAt: 1,
        ),
        mediaEntity: MediaEntity(id: '5784'),
      ),
      const AiringScheduleAndMediaRelation(
        airingSchedule: AiringScheduleEntity(
          id: '132',
          mediaId: '8917',
          airingAt: 3,
        ),
        mediaEntity: MediaEntity(id: '8917'),
      ),
      const AiringScheduleAndMediaRelation(
        airingSchedule: AiringScheduleEntity(
          id: '142',
          mediaId: '4353',
          airingAt: 2,
        ),
        mediaEntity: MediaEntity(id: '4353'),
      ),
      const AiringScheduleAndMediaRelation(
        airingSchedule: AiringScheduleEntity(
          id: '152',
          mediaId: '9523',
          airingAt: 4,
        ),
        mediaEntity: MediaEntity(id: '9523'),
      ),
    ];

    test('get_airing_schedule_by_range', () async {
      await dao.upsertAiringSchedules(dummyAiringSchedule);

      final result =
          await dao.getAiringSchedulesByTimeRange(timeRange: (1000, 4000));

      expect(
          result,
          equals(dummyAiringSchedule
            ..sort((a, b) => a.airingSchedule.airingAt!
                .compareTo(b.airingSchedule.airingAt!))));
    });
  });
}

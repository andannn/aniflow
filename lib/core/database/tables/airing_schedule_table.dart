import 'package:drift/drift.dart';

@DataClassName('AiringScheduleEntity')
class AiringScheduleTable extends Table {
  @override
  Set<Column> get primaryKey => {id};

  TextColumn get id => text().named('airing_schedules_id')();

  TextColumn get mediaId => text().named('airing_schedules_media_id')();

  IntColumn get airingAt =>
      integer().named('airing_schedules_airing_at').nullable()();

  IntColumn get timeUntilAiring =>
      integer().named('airing_schedules_time_until_airing').nullable()();

  IntColumn get episode =>
      integer().named('airing_schedules_episode').nullable()();
}

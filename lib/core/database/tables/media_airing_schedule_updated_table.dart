import 'package:drift/drift.dart';

@DataClassName('MediaAiringScheduleUpdatedEntity')
class MediaAiringScheduleUpdatedTable extends Table {
  @override
  Set<Column> get primaryKey => {updatedMediaId};

  TextColumn get updatedMediaId => text().named('updated_media_id')();

  DateTimeColumn get updateTime =>
      dateTime().named('new_episode_update_date_time')();
}

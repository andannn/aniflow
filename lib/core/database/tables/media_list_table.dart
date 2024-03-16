import 'package:drift/drift.dart';

@DataClassName('MediaListEntity')
class MediaListTable extends Table {
  @override
  Set<Column> get primaryKey => {id};

  TextColumn get id => text().named('media_list_id')();

  TextColumn get userId => text().named('media_list_user_id')();

  TextColumn get mediaId => text().named('media_list_media_id')();

  TextColumn get status => text().named('media_list_status').nullable()();

  TextColumn get notes => text().named('media_list_notes').nullable()();

  IntColumn get progress => integer().named('media_list_progress').nullable()();

  IntColumn get progressVolumes =>
      integer().named('media_list_progress_volumes').nullable()();

  IntColumn get startedAt =>
      integer().named('media_list_started_at').nullable()();

  IntColumn get completedAt =>
      integer().named('media_list_completed_at').nullable()();

  IntColumn get updatedAt =>
      integer().named('media_list_updatedAt').nullable()();

  IntColumn get repeat => integer().named('media_list_repeat').nullable()();

  RealColumn get score => real().named('media_list_score').nullable()();

  BoolColumn get private => boolean().named('media_list_private').nullable()();
}

import 'package:drift/drift.dart';

@DataClassName('ActivityEntity')
class ActivityTable extends Table {
  @override
  Set<Column> get primaryKey => {id};

  TextColumn get id => text().named('activity_id')();

  TextColumn get userId => text().named('activity_userId')();

  TextColumn get mediaId => text().named('activity_mediaId').nullable()();

  TextColumn get textContent => text().named('activity_text').nullable()();

  TextColumn get status => text().named('activity_status').nullable()();

  TextColumn get progress => text().named('activity_progress').nullable()();

  TextColumn get type => text().named('activity_type').nullable()();

  TextColumn get siteUrl => text().named('activity_siteUrl').nullable()();

  IntColumn get replyCount =>
      integer().named('activity_replyCount').withDefault(const Constant(0))();

  IntColumn get likeCount =>
      integer().named('activity_likeCount').withDefault(const Constant(0))();

  IntColumn get createdAt => integer().named('activity_createdAt').nullable()();

  BoolColumn get isLocked => boolean().named('activity_isLocked').nullable()();

  BoolColumn get isLiked => boolean()
      .named('activity_isLiked')
      .withDefault(const Constant<bool>(false))();

  BoolColumn get isPinned => boolean()
      .named('activity_isPinned')
      .nullable()
      .withDefault(const Constant<bool>(false))();
}

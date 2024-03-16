import 'package:drift/drift.dart';

@DataClassName('MediaStaffPagingCrossRefEntity')
class MediaStaffPagingCrossRefTable extends Table {
  @override
  Set<Column> get primaryKey => {staffId, mediaId};

  TextColumn get staffId => text().named('media_staff_cross_staff_id')();

  TextColumn get mediaId => text().named('media_staff_cross_anime_id')();

  TextColumn get staffRole => text().named('media_staff_cross_staff_role')();

  IntColumn get timeStamp => integer().named('media_staff_cross_timeStamp')();
}

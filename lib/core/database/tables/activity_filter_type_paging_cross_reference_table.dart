import 'package:drift/drift.dart';

@DataClassName('ActivityFilterTypePagingCrossRefEntity')
class ActivityFilterTypePagingCrossRefTable extends Table {
  @override
  List<Set<Column>> get uniqueKeys => [
        {activityId, category}
      ];

  IntColumn get id =>
      integer().autoIncrement().named('activity_filter_type_cross_id')();

  TextColumn get activityId =>
      text().named('activity_filter_type_cross_activity_id')();

  TextColumn get category =>
      text().named('activity_filter_type_cross_filter_category')();
}

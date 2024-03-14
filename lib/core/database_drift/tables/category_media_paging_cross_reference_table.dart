import 'package:drift/drift.dart';

@DataClassName('CategoryMediaPagingCrossRefEntity')
class CategoryMediaPagingCrossRefTable extends Table {
  @override
  Set<Column> get primaryKey => {category, mediaId};

  TextColumn get mediaId => text().named('anime_category_cross_media_id')();

  TextColumn get category => text().named('anime_category_cross_category_id')();

  IntColumn get timeStamp =>
      integer().named('anime_category_cross_time_stamp')();
}

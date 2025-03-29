import 'package:drift/drift.dart';

@DataClassName('SearchResultEntity')
class SearchResultTable extends Table {
  @override
  Set<Column> get primaryKey => {mediaId, mediaSource};

  TextColumn get mediaId => text().named('search_result_media_id')();

  TextColumn get mediaSource => text().named('search_result_media_source')();

  TextColumn get cache => text().named('search_result_cache')();
}

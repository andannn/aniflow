import 'package:drift/drift.dart';

@DataClassName('StudioMediaCrossRefEntity')
class StudioMediaCrossRefTable extends Table {
  @override
  Set<Column> get primaryKey => {studioId};

  TextColumn get studioId => text().named('studio_media_cross_ref_studio_id')();

  TextColumn get mediaId => text().named('studio_media_cross_ref_media_id')();
}

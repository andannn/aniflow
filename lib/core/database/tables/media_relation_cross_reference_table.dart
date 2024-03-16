import 'package:drift/drift.dart';

@DataClassName('MediaRelationCrossRefEntity')
class MediaRelationCrossRefTable extends Table {
  @override
  Set<Column> get primaryKey => {ownerId, relationId};

  TextColumn get ownerId =>
      text().named('media_relation_cross_ref_owner_media_id')();

  TextColumn get relationId =>
      text().named('media_relation_cross_ref_relation_media_id')();

  TextColumn get relationType =>
      text().named('media_staff_cross_ref_relation_type')();
}

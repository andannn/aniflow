import 'package:drift/drift.dart';

@DataClassName('CharacterRelatedMediaCrossRefEntity')
class CharacterRelatedMediaCrossRefTable extends Table {
  @override
  Set<Column> get primaryKey => {characterId, mediaId};

  TextColumn get characterId =>
      text().named('character_and_media_relation_cross_ref_character_id')();

  TextColumn get mediaId =>
      text().named('character_and_media_relation_cross_ref_media_id')();
}

import 'package:drift/drift.dart';

@DataClassName('MediaCharacterPagingCrossRefEntity')
class MediaCharacterPagingCrossRefTable extends Table {
  @override
  Set<Column> get primaryKey => {characterId, mediaId};

  TextColumn get characterId =>
      text().named('media_character_cross_anime_id')();

  TextColumn get mediaId =>
      text().named('media_character_cross_character_id')();

  IntColumn get timeStamp =>
      integer().named('media_character_cross_time_stamp')();
}

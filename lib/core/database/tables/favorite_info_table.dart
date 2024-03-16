import 'package:drift/drift.dart';

@DataClassName('FavoriteInfoEntity')
class FavoriteInfoTable extends Table {
  IntColumn get id => integer().autoIncrement().named('favorite_info_id')();

  TextColumn get favoriteType => text().named('favorite_type')();

  TextColumn get infoId => text().named('favorite_info_foreign_id')();

  TextColumn get userId => text().named('favorite_user_id')();
}

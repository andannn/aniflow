import 'package:drift/drift.dart';

@DataClassName('StudioEntity')
class StudioTable extends Table {
  @override
  Set<Column> get primaryKey => {id};

  TextColumn get id => text().named('studio_id')();

  TextColumn get name => text().named('studio_name')();

  TextColumn get siteUrl => text().named('studio_site_url').nullable()();

  BoolColumn get isAnimationStudio =>
      boolean().named('studio_is_animation_studio')();

  BoolColumn get isFavourite => boolean().named('studio_is_favourite')();
}

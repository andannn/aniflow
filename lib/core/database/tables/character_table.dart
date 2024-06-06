import 'package:drift/drift.dart';

@DataClassName('CharacterEntity')
class CharacterTable extends Table {
  @override
  Set<Column> get primaryKey => {id};

  TextColumn get id => text().named('character_id')();

  TextColumn get largeImage =>
      text().named('character_large_image').nullable()();

  TextColumn get mediumImage =>
      text().named('character_medium_image').nullable()();

  TextColumn get firstName => text().named('character_first_name').nullable()();

  TextColumn get middleName =>
      text().named('character_middle_name').nullable()();

  TextColumn get lastName => text().named('character_last_name').nullable()();

  TextColumn get fullName => text().named('character_full_name').nullable()();

  TextColumn get nativeName =>
      text().named('character_native_name').nullable()();

  TextColumn get description =>
      text().named('character_description').nullable()();

  TextColumn get gender => text().named('character_gender').nullable()();

  TextColumn get age => text().named('character_age').nullable()();

  TextColumn get bloodType => text().named('character_blood_type').nullable()();

  TextColumn get siteUrl => text().named('character_site_url').nullable()();

  DateTimeColumn get dateOfBirth =>
      dateTime().named('character_dateOfBirth').nullable()();

  IntColumn get favourites =>
      integer().named('character_favourites').nullable()();

  BoolColumn get isFavourite =>
      boolean().named('character_is_favourite').nullable()();
}

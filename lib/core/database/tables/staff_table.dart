import 'package:drift/drift.dart';

@DataClassName('StaffEntity')
class StaffTable extends Table {
  @override
  Set<Column> get primaryKey => {id};

  TextColumn get id => text().named('staff_id')();

  TextColumn get largeImage => text().named('staff_large_image').nullable()();

  TextColumn get mediumImage => text().named('staff_medium_image').nullable()();

  TextColumn get firstName => text().named('staff_first_name').nullable()();

  TextColumn get middleName => text().named('staff_middle_name').nullable()();

  TextColumn get lastName => text().named('staff_last_name').nullable()();

  TextColumn get fullName => text().named('staff_full_name').nullable()();

  TextColumn get nativeName => text().named('staff_native_name').nullable()();

  TextColumn get description => text().named('staff_description').nullable()();

  TextColumn get gender => text().named('staff_gender').nullable()();

  TextColumn get siteUrl => text().named('staff_site_url').nullable()();

  IntColumn get dateOfBirth =>
      integer().named('staff_date_of_birth').nullable()();

  IntColumn get dateOfDeath =>
      integer().named('staff_date_of_death').nullable()();

  IntColumn get age => integer().named('staff_age').nullable()();

  BoolColumn get isFavourite =>
      boolean().named('staff_is_favourite').nullable()();

  TextColumn get yearsActive => text().named('staff_years_active').nullable()();

  TextColumn get homeTown => text().named('staff_home_town').nullable()();

  TextColumn get bloodType => text().named('staff_blood_type').nullable()();
}

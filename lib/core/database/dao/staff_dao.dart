import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/dao/dao_change_notifier_mixin.dart';
import 'package:aniflow/core/database/model/staff_entity.dart';
import 'package:sqflite/sqflite.dart';

/// [Tables.staffTable]
mixin StaffColumns {
  static const String id = 'staff_id';
  static const String largeImage = 'staff_large_image';
  static const String mediumImage = 'staff_medium_image';
  static const String firstName = 'staff_first_name';
  static const String middleName = 'staff_middle_name';
  static const String lastName = 'staff_last_name';
  static const String fullName = 'staff_full_name';
  static const String nativeName = 'staff_native_name';
  static const String description = 'staff_description';
  static const String gender = 'staff_gender';
  static const String siteUrl = 'staff_site_url';
  static const String dateOfBirth = 'staff_date_of_birth';
  static const String dateOfDeath = 'staff_date_of_death';
  static const String age = 'staff_age';
  static const String isFavourite = 'staff_is_favourite';
  static const String yearsActive = 'staff_years_active';
  static const String homeTown = 'staff_home_town';
  static const String bloodType = 'staff_blood_type';

  // old column name.
  static const String image = 'staff_image';
}

abstract class StaffDao {
  Future insertStaffEntities(List<StaffEntity> entities,
      [ConflictAlgorithm algorithm = ConflictAlgorithm.replace]);

  Future<StaffEntity?> getStaffById(String staffId);

  Stream<StaffEntity?> getStaffByIdStream(String staffId);
}

class StaffDaoImpl extends StaffDao with DbChangedNotifierMixin<String> {
  final AniflowDatabase database;

  StaffDaoImpl(this.database);

  @override
  Future insertStaffEntities(List<StaffEntity> entities,
      [ConflictAlgorithm algorithm = ConflictAlgorithm.replace]) async {
    final batch = database.aniflowDB.batch();
    for (final entity in entities) {
      batch.insert(
        Tables.staffTable,
        entity.toJson(),
        conflictAlgorithm: algorithm,
      );
    }
    await batch.commit(noResult: true);

    final keys = entities.map((e) => e.id).toList();
    notifyChanged(keys);
  }

  @override
  Future<StaffEntity?> getStaffById(String staffId) async {
    final results = await database.aniflowDB.query(Tables.staffTable,
        where: '${StaffColumns.id} = $staffId', limit: 1);
    final staffJson = results.firstOrNull;
    return staffJson != null ? StaffEntity.fromJson(staffJson) : null;
  }

  @override
  Stream<StaffEntity?> getStaffByIdStream(String staffId) {
    return createStreamWithKey(
      staffId,
      () => getStaffById(staffId),
    );
  }
}

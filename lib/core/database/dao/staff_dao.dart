import 'package:aniflow/core/common/util/stream_util.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/model/staff_entity.dart';
import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';

/// [Tables.staffTable]
mixin StaffColumns {
  static const String id = 'staff_id';
  static const String image = 'staff_image';
  static const String name = 'staff_name';
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
}

abstract class StaffDao {
  Future insertStaffEntities(List<StaffEntity> entities,
      [ConflictAlgorithm algorithm = ConflictAlgorithm.replace]);

  Future<StaffEntity?> getStaffById(String staffId);

  Stream<StaffEntity?> getStaffByIdStream(String staffId);

  void notifyStaffChanged(String id);
}

class StaffDaoImpl extends StaffDao {
  final AniflowDatabase database;

  /// staffId to notifiers dict.
  final Map<String, ValueNotifier<int>> _notifiers = {};

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

    for (var e in entities) {
      notifyStaffChanged(e.id);
    }
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
    final changeSource =
        _notifiers.putIfAbsent(staffId, () => ValueNotifier(0));
    return StreamUtil.createStream(
      changeSource,
      () => getStaffById(staffId),
    );
  }

  @override
  void notifyStaffChanged(String id) {
    final notifier = _notifiers[id];
    if (notifier != null) {
      notifier.value = notifier.value++;
    }
  }
}

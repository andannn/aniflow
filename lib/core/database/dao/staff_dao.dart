import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/model/staff_entity.dart';
import 'package:sqflite/sqflite.dart';

/// [Tables.staffTable]
mixin StaffColumns {
  static const String id = 'staff_id';
  static const String image = 'staff_image';
  static const String name = 'staff_name';
}

abstract class StaffDao {
  Future insertStaffEntities(List<StaffEntity> entities);
}

class StaffDaoImpl extends StaffDao {
  final AniflowDatabase database;

  StaffDaoImpl(this.database);

  @override
  Future insertStaffEntities(List<StaffEntity> entities) async {
    final batch = database.aniflowDB.batch();
    for (final entity in entities) {
      batch.insert(
        Tables.staffTable,
        entity.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    return await batch.commit(noResult: true);
  }
}

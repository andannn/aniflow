import 'package:anime_tracker/core/data/model/staff_model.dart';
import 'package:anime_tracker/core/database/model/relations/anime_and_detail_info.dart';

class StaffAndRoleModel {
  StaffAndRoleModel({required this.role, required this.staff});

  final String role;
  final StaffModel staff;

  static StaffAndRoleModel fromDatabaseEntity(StaffAndRoleEntity entity) {
    return StaffAndRoleModel(
      role: entity.role,
      staff: StaffModel.fromDatabaseEntity(entity.staff),
    );
  }
}

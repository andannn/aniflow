
import 'package:aniflow/core/database/dao/media_dao.dart';
import 'package:aniflow/core/database/model/staff_entity.dart';

class StaffAndRoleRelation {
  const StaffAndRoleRelation({required this.staff, required this.role});

  final StaffEntity staff;
  final String role;

  factory StaffAndRoleRelation.fromJson(Map<String, dynamic> json) =>
      StaffAndRoleRelation(
        staff: StaffEntity.fromJson(json),
        role: json[MediaStaffCrossRefColumns.staffRole],
      );
}

import 'package:aniflow/core/database_drift/aniflow_database.dart';
import 'package:equatable/equatable.dart';

class StaffAndRoleRelationEntity extends Equatable {
  const StaffAndRoleRelationEntity({required this.staff, required this.role});

  final StaffEntity staff;
  final String role;

  // factory StaffAndRoleRelation.fromJson(Map<String, dynamic> json) =>
  //     StaffAndRoleRelation(
  //       staff: StaffEntity.fromJson(json),
  //       role: json[MediaStaffCrossRefColumns.staffRole],
  //     );

  @override
  List<Object?> get props => [staff, role];
}

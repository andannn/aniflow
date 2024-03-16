import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:equatable/equatable.dart';

class StaffAndRoleRelationEntity extends Equatable {
  const StaffAndRoleRelationEntity({required this.staff, required this.role});

  final StaffEntity staff;
  final String role;

  @override
  List<Object?> get props => [staff, role];
}

import 'package:aniflow/core/network/model/staff_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'staff_edge.freezed.dart';
part 'staff_edge.g.dart';

@freezed
class StaffEdge with _$StaffEdge {
  factory StaffEdge({
    @JsonKey(name: 'role') String? role,
    @JsonKey(name: 'node') StaffDto? staffNode,
  }) = _StaffEdge;

  factory StaffEdge.fromJson(Map<String, dynamic> json) =>
      _$$StaffEdgeImplFromJson(json);
}

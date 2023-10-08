import 'package:anime_tracker/core/network/model/page_info.dart';
import 'package:anime_tracker/core/network/model/staff_edge.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'staff_connection.freezed.dart';

part 'staff_connection.g.dart';

@freezed
class StaffConnection with _$StaffConnection {
  factory StaffConnection({
    @JsonKey(name: 'pageInfo') PageInfo? pageInfo,
    @Default([]) @JsonKey(name: 'edges') List<StaffEdge> edges,
  }) = _StaffConnection;

  factory StaffConnection.fromJson(Map<String, dynamic> json) =>
      _$$_StaffConnectionFromJson(json);
}

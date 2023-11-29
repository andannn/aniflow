import 'package:aniflow/core/database/dao/staff_dao.dart';
import 'package:aniflow/core/network/model/character_edge.dart';
import 'package:aniflow/core/network/model/staff_dto.dart';
import 'package:aniflow/core/network/model/staff_edge.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'staff_entity.freezed.dart';

part 'staff_entity.g.dart';

@freezed
class StaffEntity with _$StaffEntity {
  factory StaffEntity({
    @Default('') @JsonKey(name: StaffColumns.id) String id,
    @JsonKey(name: StaffColumns.image) String? image,
    @JsonKey(name: StaffColumns.name) String? name,
  }) = _StaffEntity;

  factory StaffEntity.fromJson(Map<String, dynamic> json) =>
      _$$StaffEntityImplFromJson(json);

  static StaffEntity? fromVoiceActorDto(CharacterEdge e) {
    if (e.voiceActors.isEmpty) {
      return null;
    }

    return StaffEntity(
      id: e.voiceActors[0].id.toString(),
      image: e.voiceActors[0].image['large'],
      name: e.voiceActors[0].name['userPreferred'],
    );
  }

  static StaffEntity fromStaffEdge(StaffEdge e) {
    return StaffEntity.fromStaffDto(e.staffNode!);
  }

  static StaffEntity fromStaffDto(StaffDto e) {
    return StaffEntity(
      id: e.id.toString(),
      image: e.image['large'],
      name: e.name['userPreferred'],
    );
  }
}

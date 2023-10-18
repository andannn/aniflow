import 'package:anime_tracker/core/database/dao/anime_dao.dart';
import 'package:anime_tracker/core/network/model/character_edge.dart';
import 'package:anime_tracker/core/network/model/staff_edge.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'staff_entity.freezed.dart';

part 'staff_entity.g.dart';

@freezed
class StaffEntity with _$StaffEntity {
  factory StaffEntity({
    @Default('') @JsonKey(name: StaffColumns.id) String id,
    @JsonKey(name: StaffColumns.image) String? image,
    @JsonKey(name: StaffColumns.nameEnglish) String? nameEnglish,
    @JsonKey(name: StaffColumns.nameNative) String? nameNative,
  }) = _StaffEntity;

  factory StaffEntity.fromJson(Map<String, dynamic> json) =>
      _$$_StaffEntityFromJson(json);

  static StaffEntity? fromVoiceActorDto(CharacterEdge e) {
    if (e.voiceActors.isEmpty) {
      return null;
    }

    return StaffEntity(
      id: e.voiceActors[0].id.toString(),
      image: e.voiceActors[0].image['large'],
      nameNative: e.voiceActors[0].name['native'],
      nameEnglish: e.voiceActors[0].name['full']!,
    );
  }

  static StaffEntity fromStaffDto(StaffEdge e) {
    return StaffEntity(
      id: e.staffNode!.id.toString(),
      image: e.staffNode!.image['large'],
      nameNative: e.staffNode!.name['native'],
      nameEnglish: e.staffNode!.name['full']!,
    );
  }
}

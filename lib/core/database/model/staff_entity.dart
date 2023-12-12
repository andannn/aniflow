import 'dart:convert';

import 'package:aniflow/core/database/dao/staff_dao.dart';
import 'package:aniflow/core/database/util/content_values_util.dart';
import 'package:aniflow/core/network/model/character_edge.dart';
import 'package:aniflow/core/network/model/fuzzy_date_dto.dart';
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
    @JsonKey(name: StaffColumns.firstName) String? firstName,
    @JsonKey(name: StaffColumns.middleName) String? middleName,
    @JsonKey(name: StaffColumns.lastName) String? lastName,
    @JsonKey(name: StaffColumns.fullName) String? fullName,
    @JsonKey(name: StaffColumns.nativeName) String? nativeName,
    @JsonKey(name: StaffColumns.description) String? description,
    @JsonKey(name: StaffColumns.gender) String? gender,
    @JsonKey(name: StaffColumns.siteUrl) String? siteUrl,
    @JsonKey(name: StaffColumns.dateOfBirth) int? dateOfBirth,
    @JsonKey(name: StaffColumns.dateOfDeath) int? dateOfDeath,
    @JsonKey(name: StaffColumns.age) int? age,
    @JsonKey(name: StaffColumns.isFavourite) int? isFavourite,
    @JsonKey(name: StaffColumns.yearsActive) String? yearsActive,
    @JsonKey(name: StaffColumns.homeTown) String? homeTown,
    @JsonKey(name: StaffColumns.bloodType) String? bloodType,
  }) = _StaffEntity;

  factory StaffEntity.fromJson(Map<String, dynamic> json) =>
      _$$StaffEntityImplFromJson(json);

  static StaffEntity? fromVoiceActorDto(CharacterEdge e) {
    if (e.voiceActors.isEmpty) {
      return null;
    }

    return fromStaffDto(e.voiceActors[0]);
  }

  static StaffEntity fromStaffEdge(StaffEdge e) {
    return StaffEntity.fromStaffDto(e.staffNode!);
  }

  static StaffEntity fromStaffDto(StaffDto e) {
    return StaffEntity(
      id: e.id.toString(),
      image: e.image['large'],
      firstName: e.name?.first,
      middleName: e.name?.middle,
      lastName: e.name?.last,
      fullName: e.name?.full,
      nativeName: e.name?.native,
      description: e.description,
      gender: e.gender,
      siteUrl: e.siteUrl,
      age: e.age,
      isFavourite: e.isFavourite.toInteger(),
      dateOfBirth: e.dateOfBirth?.toDateTime()?.millisecondsSinceEpoch,
      dateOfDeath: e.dateOfDeath?.toDateTime()?.millisecondsSinceEpoch,
      yearsActive: e.yearsActive.isNotEmpty ? jsonEncode(e.yearsActive) : null,
      homeTown: e.homeTown,
      bloodType: e.bloodType,
    );
  }
}

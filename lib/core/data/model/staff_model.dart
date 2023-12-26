import 'dart:convert';

import 'package:aniflow/core/data/model/staff_character_name_model.dart';
import 'package:aniflow/core/database/model/staff_entity.dart';
import 'package:aniflow/core/database/util/content_values_util.dart';
import 'package:aniflow/core/network/model/staff_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'staff_model.freezed.dart';

@freezed
class StaffModel with _$StaffModel {
  factory StaffModel({
    @Default('') String id,
    @Default('') String image,
    StaffCharacterName? name,
    String? description,
    String? gender,
    String? siteUrl,
    DateTime? dateOfBirth,
    DateTime? dateOfDeath,
    int? age,
    @Default(false) bool isFavourite,
    @Default([]) List yearsActive,
    String? homeTown,
    String? bloodType,
  }) = _StaffModel;

  static StaffModel fromEntity(StaffEntity entity) {
    return StaffModel(
      id: entity.id,
      image: entity.image ?? '',
      name: StaffCharacterName(
        first: entity.firstName,
        middle: entity.middleName,
        last: entity.lastName,
        full: entity.fullName,
        native: entity.nativeName,
      ),
      description: entity.description,
      gender: entity.gender,
      siteUrl: entity.siteUrl,
      age: entity.age,
      isFavourite: entity.isFavourite.toBoolean(),
      dateOfBirth: entity.dateOfBirth != null
          ? DateTime.fromMillisecondsSinceEpoch(entity.dateOfBirth!)
          : null,
      dateOfDeath: entity.dateOfDeath != null
          ? DateTime.fromMillisecondsSinceEpoch(entity.dateOfDeath!)
          : null,
      yearsActive:
      entity.yearsActive != null ? jsonDecode(entity.yearsActive!) : [],
      homeTown: entity.homeTown,
      bloodType: entity.bloodType,
    );
  }

  static StaffModel fromDto(StaffDto dto) {
    return StaffModel.fromEntity(StaffEntity.fromStaffDto(dto));
  }
}

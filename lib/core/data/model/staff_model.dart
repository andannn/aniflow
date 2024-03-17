
import 'package:aniflow/core/data/model/staff_character_name_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'staff_model.freezed.dart';

@freezed
class StaffModel with _$StaffModel {
  factory StaffModel({
    @Default('') String id,
    @Default('') String largeImage,
    @Default('') String mediumImage,
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

}

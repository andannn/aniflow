import 'package:aniflow/core/data/model/staff_character_name_model.dart';
import 'package:aniflow/core/network/model/fuzzy_date_dto.dart';
import 'package:aniflow/core/network/model/media_connection.dart';
import 'package:aniflow/core/network/model/staff_image_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'staff_dto.freezed.dart';

part 'staff_dto.g.dart';

@freezed
class StaffDto with _$StaffDto {
  factory StaffDto({
    @Default(-1) @JsonKey(name: 'id') int id,
    @JsonKey(name: 'image') StaffImageDto? image,
    @JsonKey(name: 'name') StaffCharacterName? name,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'gender') String? gender,
    @JsonKey(name: 'siteUrl') String? siteUrl,
    @JsonKey(name: 'dateOfBirth') FuzzyDateDto? dateOfBirth,
    @JsonKey(name: 'dateOfDeath') FuzzyDateDto? dateOfDeath,
    @JsonKey(name: 'age') int? age,
    @Default(false) @JsonKey(name: 'isFavourite') bool isFavourite,
    @Default([]) @JsonKey(name: 'yearsActive') List<int> yearsActive,
    @JsonKey(name: 'homeTown') String? homeTown,
    @JsonKey(name: 'bloodType') String? bloodType,
    @JsonKey(name: 'characterMedia') MediaConnection? characterMedia,
  }) = _StaffDto;

  factory StaffDto.fromJson(Map<String, dynamic> json) =>
      _$$StaffDtoImplFromJson(json);
}

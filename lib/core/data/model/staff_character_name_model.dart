import 'package:aniflow/core/common/model/setting/user_staff_name_language.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'staff_character_name_model.freezed.dart';

part 'staff_character_name_model.g.dart';

@freezed
class StaffCharacterName with _$StaffCharacterName {
  factory StaffCharacterName({
    @JsonKey(name: 'first') String? first,
    @JsonKey(name: 'middle') String? middle,
    @JsonKey(name: 'last') String? last,
    @JsonKey(name: 'full') String? full,
    @JsonKey(name: 'native') String? native,
  }) = _StaffCharacterName;

  factory StaffCharacterName.fromJson(Map<String, dynamic> json) =>
      _$$StaffCharacterNameImplFromJson(json);
}

extension StaffCharacterNameEx on StaffCharacterName {
  String getNameByUserSetting(UserStaffNameLanguage language) {
    switch (language) {
      case UserStaffNameLanguage.romajiWestern:
        return native != null ? '${first ?? ''} ${last ?? ''}' : full ?? '';
      case UserStaffNameLanguage.romaji:
        return native != null ? '${last ?? ''} ${first ?? ''}' : full ?? '';
      case UserStaffNameLanguage.native:
        return native ?? full ?? '';
    }
  }
}

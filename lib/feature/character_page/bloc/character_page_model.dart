import 'package:aniflow/core/common/definitions/staff_language.dart';
import 'package:aniflow/core/common/setting/user_staff_name_language.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_page_model.freezed.dart';

@freezed
class CharacterPageState with _$CharacterPageState {
  factory CharacterPageState({
    @Default(StaffLanguage.japanese) StaffLanguage language,
    @Default(UserStaffNameLanguage.native)
    UserStaffNameLanguage userStaffNameLanguage,
  }) = _CharacterPageState;
}

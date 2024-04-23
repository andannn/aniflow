import 'package:aniflow/core/common/setting/user_staff_name_language.dart';
import 'package:aniflow/core/common/setting/user_title_language.dart';
import 'package:aniflow/core/data/model/character_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_character_state.freezed.dart';

@freezed
class DetailCharacterState with _$DetailCharacterState {
  factory DetailCharacterState({
    @Default(false) bool isLoading,
    CharacterModel? characterModel,
    @Default(UserStaffNameLanguage.native)
    UserStaffNameLanguage userStaffNameLanguage,
    @Default(UserTitleLanguage.native) UserTitleLanguage userTitleLanguage,
  }) = _DetailCharacterState;
}

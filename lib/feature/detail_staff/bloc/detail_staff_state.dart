import 'package:aniflow/core/common/definitions/media_sort.dart';
import 'package:aniflow/core/common/setting/user_staff_name_language.dart';
import 'package:aniflow/core/common/setting/user_title_language.dart';
import 'package:aniflow/core/data/model/staff_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_staff_state.freezed.dart';

@freezed
class DetailStaffState with _$DetailStaffState {
  factory DetailStaffState({
    @Default(false) bool isLoading,
    @Default(MediaSort.newest) MediaSort mediaSort,
    @Default(UserStaffNameLanguage.native) UserStaffNameLanguage userStaffNameLanguage,
    @Default(UserTitleLanguage.native) UserTitleLanguage userTitleLanguage,
    StaffModel? staffModel,
  }) = _DetailCharacterState;
}

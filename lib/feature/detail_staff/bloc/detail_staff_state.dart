import 'package:aniflow/core/common/definitions/media_sort.dart';
import 'package:aniflow/core/data/model/staff_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_staff_state.freezed.dart';

@freezed
class DetailStaffState with _$DetailStaffState {
  factory DetailStaffState({
    @Default(false) bool isLoading,
    @Default(MediaSort.newest) MediaSort mediaSort,
    StaffModel? staffModel,
  }) = _DetailCharacterState;
}

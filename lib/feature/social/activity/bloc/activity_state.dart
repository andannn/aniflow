
import 'package:aniflow/core/common/model/activity_filter_type.dart';
import 'package:aniflow/core/common/model/activity_scope_category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_state.freezed.dart';

@freezed
class ActivityState with _$ActivityState {
  factory ActivityState({
    @Default(ActivityFilterType.all) ActivityFilterType filterType,
    @Default(ActivityScopeCategory.global) ActivityScopeCategory userType,
  }) = _ActivityState;
}

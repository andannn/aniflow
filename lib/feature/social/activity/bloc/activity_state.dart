
import 'package:aniflow/core/common/definitions/activity_filter_type.dart';
import 'package:aniflow/core/common/definitions/activity_scope_category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_state.freezed.dart';

@freezed
class ActivityState with _$ActivityState {
  factory ActivityState({
    @Default(true) bool isLoading,
    ActivityFilterType? filterType,
    ActivityScopeCategory? scopeCategory,
  }) = _ActivityState;
}


import 'package:aniflow/core/common/model/activity_filter_type.dart';
import 'package:aniflow/core/common/model/activity_scope_category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_state.freezed.dart';

@freezed
class ActivityState with _$ActivityState {
  factory ActivityState({
    @Default(false) bool isLoading,
    ActivityFilterType? filterType,
    ActivityScopeCategory? scopeCategory,
  }) = _ActivityState;
}

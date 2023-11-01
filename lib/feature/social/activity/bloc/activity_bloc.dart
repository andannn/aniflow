import 'dart:async';

import 'package:aniflow/core/common/model/activity_filter_type.dart';
import 'package:aniflow/core/common/model/activity_scope_category.dart';
import 'package:aniflow/feature/social/activity/bloc/activity_state.dart';
import 'package:bloc/bloc.dart';

sealed class ActivityEvent {}

class OnFilterTypeChanged extends ActivityEvent {
  OnFilterTypeChanged({required this.type});

  final ActivityFilterType type;
}

class OnUserTypeChanged extends ActivityEvent {
  OnUserTypeChanged({required this.type});

  final ActivityScopeCategory type;
}

class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  ActivityBloc() : super(ActivityState()) {
    on<OnFilterTypeChanged>(_onFilterTypeChanged);
    on<OnUserTypeChanged>(_onUserTypeChanged);
  }

  FutureOr<void> _onFilterTypeChanged(
      OnFilterTypeChanged event, Emitter<ActivityState> emit) {
    emit(state.copyWith(filterType: event.type));
  }

  FutureOr<void> _onUserTypeChanged(
      OnUserTypeChanged event, Emitter<ActivityState> emit) {
    emit(state.copyWith(userType: event.type));
  }
}

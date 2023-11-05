import 'dart:async';

import 'package:aniflow/core/common/model/activity_filter_type.dart';
import 'package:aniflow/core/common/model/activity_scope_category.dart';
import 'package:aniflow/core/data/activity_repository.dart';
import 'package:aniflow/feature/social/activity/bloc/activity_state.dart';
import 'package:bloc/bloc.dart';

sealed class ActivityEvent {}

class OnLoadingStateChanged extends ActivityEvent {
  OnLoadingStateChanged({required this.isLoading});

  final bool isLoading;
}

class OnFilterTypeChanged extends ActivityEvent {
  OnFilterTypeChanged({required this.type});

  final ActivityFilterType type;
}

class OnActivityScopeChanged extends ActivityEvent {
  OnActivityScopeChanged({required this.type});

  final ActivityScopeCategory type;
}

class _OnActivityTypeChanged extends ActivityEvent {
  _OnActivityTypeChanged(this.scopeCategory, this.filterType);

  final ActivityScopeCategory scopeCategory;
  final ActivityFilterType filterType;
}

class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  ActivityBloc(ActivityRepository repository)
      : _repository = repository,
        super(ActivityState()) {
    on<OnFilterTypeChanged>(_onFilterTypeChanged);
    on<OnActivityScopeChanged>(_onActivityScopeChanged);
    on<_OnActivityTypeChanged>(_onActivityTypeChanged);
    on<OnLoadingStateChanged>(_onLoadingStateChanged);

    repository.getActivityTypeStream().listen((type) {
      final (filter, scope) = type;
      add(_OnActivityTypeChanged(scope, filter));
    });
  }

  final ActivityRepository _repository;

  FutureOr<void> _onFilterTypeChanged(
      OnFilterTypeChanged event, Emitter<ActivityState> emit) {
    _repository.setActivityFilterType(event.type);
  }

  FutureOr<void> _onActivityScopeChanged(
      OnActivityScopeChanged event, Emitter<ActivityState> emit) {
    _repository.setActivityScopeCategory(event.type);
  }

  FutureOr<void> _onActivityTypeChanged(
      _OnActivityTypeChanged event, Emitter<ActivityState> emit) {
    emit(state.copyWith(
        filterType: event.filterType, scopeCategory: event.scopeCategory));
  }

  FutureOr<void> _onLoadingStateChanged(
      OnLoadingStateChanged event, Emitter<ActivityState> emit) {
    emit(state.copyWith(isLoading: event.isLoading));
  }
}

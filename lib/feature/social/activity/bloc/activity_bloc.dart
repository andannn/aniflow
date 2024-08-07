import 'package:aniflow/core/common/definitions/activity_filter_type.dart';
import 'package:aniflow/core/common/definitions/activity_scope_category.dart';
import 'package:aniflow/core/common/util/bloc_util.dart';
import 'package:aniflow/core/data/activity_repository.dart';
import 'package:aniflow/feature/social/activity/bloc/activity_state.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

sealed class ActivityEvent {}

class OnActivityLoadingStateChanged extends ActivityEvent {
  OnActivityLoadingStateChanged({required this.isLoading});

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

@injectable
class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  ActivityBloc(this.repository) : super(ActivityState()) {
    on<OnFilterTypeChanged>(
      (event, emit) => repository.setActivityFilterType(event.type),
    );
    on<OnActivityScopeChanged>(
      (event, _) => repository.setActivityScopeCategory(event.type),
    );
    on<_OnActivityTypeChanged>(
      (event, emit) => emit(
        state.copyWith(
          filterType: event.filterType,
          scopeCategory: event.scopeCategory,
        ),
      ),
    );
    on<OnActivityLoadingStateChanged>(
      (event, emit) => emit(state.copyWith(isLoading: event.isLoading)),
    );

    repository.getActivityTypeStream().listen((type) {
      final (filter, scope) = type;
      safeAdd(_OnActivityTypeChanged(scope, filter));
    });
  }

  final ActivityRepository repository;
}

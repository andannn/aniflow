import 'dart:async';

import 'package:aniflow/core/data/activity_repository.dart';
import 'package:bloc/bloc.dart';

sealed class ActivityItemEvent {}

class _OnActivityChangeEvent extends ActivityItemEvent {
  _OnActivityChangeEvent(this.activityStatus);

  final ActivityStatus? activityStatus;
}

class ActivityStatusBloc extends Bloc<ActivityItemEvent, ActivityStatus?> {
  ActivityStatusBloc({
    required String activityId,
    required ActivityRepository repository,
  }) : super(null) {
    on<_OnActivityChangeEvent>((event, emit) => emit(event.activityStatus));

    _subscription = repository
        .getActivityStatusStream(activityId)
        .distinct()
        .listen((status) {
      add(_OnActivityChangeEvent(status));
    });
  }

  StreamSubscription? _subscription;

  @override
  Future<void> close() {
    _subscription?.cancel();

    return super.close();
  }
}

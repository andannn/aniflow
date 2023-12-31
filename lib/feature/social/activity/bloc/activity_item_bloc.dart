import 'dart:async';

import 'package:aniflow/core/common/util/error_handler.dart';
import 'package:aniflow/core/data/activity_repository.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

sealed class ActivityItemEvent {}

class _OnActivityChangeEvent extends ActivityItemEvent {
  _OnActivityChangeEvent(this.activityStatus);

  final ActivityStatus? activityStatus;
}

class OnToggleActivityLike extends ActivityItemEvent {}

class ActivityStatusBloc extends Bloc<ActivityItemEvent, ActivityStatus?> {
  ActivityStatusBloc({
    required String activityId,
    required ActivityRepository repository,
  })  : _repository = repository,
        _activityId = activityId,
        super(null) {
    on<_OnActivityChangeEvent>((event, emit) => emit(event.activityStatus));
    on<OnToggleActivityLike>(_onToggleActivityLike);

    _subscription = repository
        .getActivityStatusStream(activityId)
        .distinct()
        .listen((status) {
      add(_OnActivityChangeEvent(status));
    });
  }

  final ActivityRepository _repository;
  final String _activityId;

  StreamSubscription? _subscription;
  CancelToken? _toggleLikeCancelToken;

  @override
  Future<void> close() {
    _subscription?.cancel();

    return super.close();
  }

  FutureOr<void> _onToggleActivityLike(
      OnToggleActivityLike event, Emitter<ActivityStatus?> emit) async {
    _toggleLikeCancelToken?.cancel();
    _toggleLikeCancelToken = CancelToken();

    LoadResult result = await _repository.toggleActivityLike(
        _activityId, _toggleLikeCancelToken!);

    if (result is LoadError) {
      ErrorHandler.handleException(exception: result.exception);
    }
  }
}

import 'dart:async';

import 'package:aniflow/core/common/message/message.dart';
import 'package:aniflow/core/common/util/bloc_util.dart';
import 'package:aniflow/core/common/util/error_handler.dart';
import 'package:aniflow/core/data/activity_repository.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

sealed class ActivityItemEvent {}

class _OnActivityChangeEvent extends ActivityItemEvent {
  _OnActivityChangeEvent(this.activityStatus);

  final ActivityStatus? activityStatus;
}

class OnToggleActivityLike extends ActivityItemEvent {}

@injectable
class ActivityStatusBloc extends Bloc<ActivityItemEvent, ActivityStatus?> {
  ActivityStatusBloc(
    this._activityRepository,
    this._messageRepository,
    @factoryParam this.activityId,
  ) : super(null) {
    on<_OnActivityChangeEvent>((event, emit) => emit(event.activityStatus));
    on<OnToggleActivityLike>(_onToggleActivityLike);

    _subscription = _activityRepository
        .getActivityStatusStream(activityId)
        .distinct()
        .listen((status) {
      safeAdd(_OnActivityChangeEvent(status));
    });
  }

  final ActivityRepository _activityRepository;
  final MessageRepository _messageRepository;
  final String activityId;

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

    LoadResult result = await _activityRepository.toggleActivityLike(
      activityId,
      _toggleLikeCancelToken!,
    );

    if (result is LoadError) {
      final message =
          await ErrorHandler.convertExceptionToMessage(result.exception);
      if (message != null) {
        _messageRepository.showMessage(message);
      }
    }
  }
}

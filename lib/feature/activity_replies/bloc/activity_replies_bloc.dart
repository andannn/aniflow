import 'package:aniflow/core/common/message/message.dart';
import 'package:aniflow/core/common/util/bloc_util.dart';
import 'package:aniflow/core/common/util/error_handler.dart';
import 'package:aniflow/core/data/activity_repository.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/model/activity_model.dart';
import 'package:aniflow/core/data/model/activity_reply_model.dart';
import 'package:aniflow/feature/activity_replies/bloc/activity_replies_state.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

sealed class ActivityRepliesEvent {}

class OnLoadingStateChanged extends ActivityRepliesEvent {
  final bool isLoading;

  OnLoadingStateChanged(this.isLoading);
}

class OnRepliesLoaded extends ActivityRepliesEvent {
  final List<ActivityReplyModel> replies;

  OnRepliesLoaded(this.replies);
}

class OnActivityLoaded extends ActivityRepliesEvent {
  final ActivityModel activity;

  OnActivityLoaded(this.activity);
}

@injectable
class ActivityRepliesBloc
    extends Bloc<ActivityRepliesEvent, ActivityRepliesState> {
  ActivityRepliesBloc(
    this._activityRepository,
    this._messageRepository,
    @factoryParam this.activityId,
  ) : super(const ActivityRepliesState()) {
    on<OnLoadingStateChanged>(
      (event, emit) => emit(state.copyWith(isLoading: event.isLoading)),
    );
    on<OnRepliesLoaded>(
      (event, emit) => emit(state.copyWith(replies: event.replies)),
    );
    on<OnActivityLoaded>(
      (event, emit) => emit(state.copyWith(activityModel: event.activity)),
    );

    loadReplies();
  }

  final ActivityRepository _activityRepository;
  final MessageRepository _messageRepository;
  final String activityId;

  Future loadReplies() async {
    final activity = await _activityRepository.getActivityModel(activityId);
    safeAdd(OnActivityLoaded(activity));

    safeAdd(OnLoadingStateChanged(true));
    final result = await _activityRepository.getActivityReplies(activityId);
    switch (result) {
      case LoadError<List<ActivityReplyModel>>():
        final message =
            await ErrorHandler.convertExceptionToMessage(result.exception);
        if (message != null) {
          _messageRepository.showMessage(message);
        }
      case LoadSuccess<List<ActivityReplyModel>>():
        safeAdd(OnRepliesLoaded(result.data));
    }
    safeAdd(OnLoadingStateChanged(false));
  }
}

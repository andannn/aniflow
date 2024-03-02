import 'package:aniflow/core/data/activity_repository.dart';
import 'package:aniflow/core/data/model/activity_reply_model.dart';
import 'package:aniflow/feature/social/activity_replies/bloc/activity_replies_state.dart';
import 'package:bloc/bloc.dart';

sealed class ActivityRepliesEvent {}

class OnLoadingStateChanged extends ActivityRepliesEvent {
  final bool isLoading;

  OnLoadingStateChanged(this.isLoading);
}

class OnRepliesLoaded extends ActivityRepliesEvent {
  final List<ActivityReplyModel> replies;

  OnRepliesLoaded(this.replies);
}

class ActivityRepliesBloc
    extends Bloc<ActivityRepliesEvent, ActivityRepliesState> {
  ActivityRepliesBloc({required this.activityId, required this.repository})
      : super(const ActivityRepliesState()) {
    on<OnLoadingStateChanged>(
      (event, emit) => emit(state.copyWith(isLoading: event.isLoading)),
    );
    on<OnRepliesLoaded>(
          (event, emit) => emit(state.copyWith(replies: event.replies)),
    );

    loadReplies();
  }

  final ActivityRepository repository;
  final String activityId;

  Future loadReplies() async {
    add(OnLoadingStateChanged(true));
    final replies = await repository.getActivityReplies(activityId);
    add(OnRepliesLoaded(replies));
    add(OnLoadingStateChanged(false));
  }
}

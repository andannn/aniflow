import 'package:aniflow/core/data/model/activity_model.dart';
import 'package:aniflow/core/data/model/activity_reply_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_replies_state.freezed.dart';

@freezed
class ActivityRepliesState with _$ActivityRepliesState {
  const factory ActivityRepliesState({
    @Default(false) bool isLoading,
    @Default([]) List<ActivityReplyModel> replies,
    ActivityModel? activityModel,
}) = _ActivityRepliesState;
}

import 'package:aniflow/core/data/notification_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_state.freezed.dart';

@freezed
class NotificationState with _$NotificationState {
  factory NotificationState({
    @Default(NotificationCategory.all) NotificationCategory category,
  }) = _NotificationState;
}

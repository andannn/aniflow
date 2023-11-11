import 'dart:async';

import 'package:aniflow/core/data/notification_repository.dart';
import 'package:aniflow/feature/notification/bloc/notification_state.dart';
import 'package:bloc/bloc.dart';

sealed class NotificationEvent {}

class OnNotificationChanged extends NotificationEvent {
  OnNotificationChanged({required this.category});

  final NotificationCategory category;
}

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationState()) {
    on<OnNotificationChanged>(_onNotificationChanged);
  }

  FutureOr<void> _onNotificationChanged(
      OnNotificationChanged event, Emitter<NotificationState> emit) {
    emit(state.copyWith(category: event.category));
  }
}

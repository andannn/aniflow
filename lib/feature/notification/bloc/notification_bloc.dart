import 'package:aniflow/core/data/notification_repository.dart';
import 'package:aniflow/feature/notification/bloc/notification_state.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

sealed class NotificationEvent {}

class OnNotificationChanged extends NotificationEvent {
  OnNotificationChanged({required this.category});

  final NotificationCategory category;
}

@Injectable()
class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationState()) {
    on<OnNotificationChanged>(
      (event, emit) => emit(state.copyWith(category: event.category)),
    );
  }
}

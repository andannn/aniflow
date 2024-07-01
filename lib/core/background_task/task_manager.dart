import 'package:aniflow/core/background_task/tasks/send_notification_task.dart';
import 'package:aniflow/core/background_task/tasks/task.dart';
import 'package:aniflow/core/data/auth_repository.dart';
import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';

mixin BackgroundTaskName {
  static const sendNotificationTaskName = 'post_platform_notifications_task_2';
}

@injectable
class BackgroundTaskFactory {
  BackgroundTaskFactory(this._authRepository);

  final AuthRepository _authRepository;

  Future<List<BackgroundTask>> createTasks() async {
    List<BackgroundTask?> tasks = await Future.wait([
      _getSendNotificationTaskOrNull(),
    ]);

    return tasks.whereNotNull().toList();
  }

  Future<BackgroundTask?> _getSendNotificationTaskOrNull() async {
    final authedUser = await _authRepository.getAuthedUser();
    final permissionStatus = await Permission.notification.status;
    if (authedUser != null && permissionStatus == PermissionStatus.granted) {
      return const SendNotificationTask();
    }

    return null;
  }
}

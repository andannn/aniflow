import 'package:aniflow/core/background_task/task.dart';
import 'package:aniflow/core/data/auth_repository.dart';
import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';

@injectable
class BackgroundTaskFactory {
  BackgroundTaskFactory(this._authRepository);

  final AuthRepository _authRepository;

  Future<List<Task>> createTasks() async {
    List<Task?> tasks = await Future.wait([
      _getSendNotificationTaskOrNull(),
    ]);

    return tasks.whereNotNull().toList();
  }

  Future<Task?> _getSendNotificationTaskOrNull() async {
    final authedUser = await _authRepository.getAuthedUser();
    final permissionStatus = await Permission.notification.status;
    if (authedUser != null && permissionStatus == PermissionStatus.granted) {
      return const SendNotificationTask();
    }

    return null;
  }
}

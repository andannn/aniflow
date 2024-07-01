import 'package:aniflow/core/background_task/task_manager.dart';
import 'package:aniflow/core/background_task/tasks/send_notification_task.dart';
import 'package:workmanager/workmanager.dart';

sealed class BackgroundTask {
  final String name;

  Duration get initialDelay => Duration.zero;

  Map<String, dynamic>? get inputData => null;

  ExistingWorkPolicy? get existingWorkPolicy => null;

  Constraints? get constraints => null;

  const BackgroundTask({required this.name});
}

abstract class PeriodicBackgroundTask extends BackgroundTask {
  const PeriodicBackgroundTask({
    required super.name,
    required this.frequency,
  });

  final Duration frequency;

  @override
  ExistingWorkPolicy? get existingWorkPolicy => ExistingWorkPolicy.keep;
}

extension TaskConverter on (String taskName, Map<String, dynamic>? inputData) {
  BackgroundTask? toTask() {
    final (taskName, _) = this;
    if (taskName == BackgroundTaskName.sendNotificationTaskName) {
      return const SendNotificationTask();
    }

    return null;
  }
}


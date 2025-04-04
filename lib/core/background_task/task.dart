import 'package:aniflow/core/background_task/task_manager.dart';
import 'package:aniflow/core/background_task/tasks/post_anilist_notification_task.dart';
import 'package:aniflow/core/background_task/tasks/sync_new_released_play_source_task.dart';
import 'package:workmanager/workmanager.dart';

sealed class BackgroundTask {
  String get name;

  Duration get initialDelay => Duration.zero;

  Map<String, dynamic>? get inputData => null;

  ExistingWorkPolicy? get existingWorkPolicy => null;

  Constraints? get constraints => null;

  const BackgroundTask();

  static const allTasks = [
    PostAnilistNotificationTask(),
    SyncNewReleasedPlaySourceTask(),
  ];
}

abstract class PeriodicBackgroundTask extends BackgroundTask {
  const PeriodicBackgroundTask({
    required this.frequency,
  });

  final Duration frequency;

  @override
  ExistingWorkPolicy? get existingWorkPolicy => ExistingWorkPolicy.keep;
}

class TaskConverter {
  TaskConverter();

  BackgroundTask? fromInputData(String taskName,
      Map<String, dynamic>? inputData) {
    if (taskName == BackgroundTaskName.sendNotificationTaskName) {
      return const PostAnilistNotificationTask();
    } else if (taskName == BackgroundTaskName.syncNewReleasedPlaySourceTaskName) {
      return const SyncNewReleasedPlaySourceTask();
    }

    return null;
  }
}


import 'package:aniflow/core/background_task/executors/post_anilist_notification_task_executor.dart';
import 'package:aniflow/core/background_task/tasks/post_anilist_notification_task.dart';
import 'package:aniflow/core/background_task/task.dart';
import 'package:get_it/get_it.dart';

abstract class Executor {
  /// execute the background task.
  /// Returns ture if the task finished successfully, false if the task failed.
  /// Note that the task will automatically retry in android.
  Future<bool> execute();

  static Executor? fromTask(BackgroundTask? task) {
    switch (task) {
      case PostAnilistNotificationTask():
        return GetIt.instance
            .get<PostAnilistNotificationExecutor>();
      default:
        return null;
    }
  }
}

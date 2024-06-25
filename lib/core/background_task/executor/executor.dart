import 'package:aniflow/core/background_task/executor/send_notification_task_executor.dart';
import 'package:aniflow/core/background_task/task.dart';
import 'package:get_it/get_it.dart';

abstract class Executor {
  Future<bool> execute();

  static Executor? convertToExecutor(Task? task) {
    switch (task) {
      case SendNotificationTask():
        return GetIt.instance.get<SendNotificationTaskExecutor>();
      default:
        return null;
    }
  }
}


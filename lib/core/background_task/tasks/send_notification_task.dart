import 'package:aniflow/core/background_task/task_manager.dart';
import 'package:aniflow/core/background_task/tasks/task.dart';
import 'package:workmanager/workmanager.dart';

class SendNotificationTask extends PeriodicBackgroundTask {
  const SendNotificationTask()
      : super(
          name: BackgroundTaskName.sendNotificationTaskName,
          frequency: const Duration(hours: 1),
        );

  @override
  Constraints? get constraints =>
      Constraints(networkType: NetworkType.connected);

  @override
  Duration get initialDelay => const Duration(seconds: 10);
}

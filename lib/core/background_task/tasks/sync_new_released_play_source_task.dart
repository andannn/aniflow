import 'package:aniflow/core/background_task/task.dart';
import 'package:aniflow/core/background_task/task_manager.dart';
import 'package:workmanager/workmanager.dart';

class SyncNewReleasedPlaySourceTask extends PeriodicBackgroundTask {
  const SyncNewReleasedPlaySourceTask()
      : super(
          frequency: const Duration(hours: 1),
        );

  @override
  Constraints? get constraints =>
      Constraints(networkType: NetworkType.unmetered);

  @override
  Duration get initialDelay => const Duration(hours: 0);

  @override
  String get name => BackgroundTaskName.syncNewReleasedPlaySourceTaskName;
}

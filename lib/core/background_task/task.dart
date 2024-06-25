mixin TaskName {
  static const sendNotificationTaskName =  'send_notification_task';
}

sealed class Task {
  final String name;

  Duration get initialDelay => Duration.zero;

  Map<String, dynamic>? get inputData => null;

  const Task({required this.name});
}

abstract class PeriodicTask extends Task {
  const PeriodicTask({
    required super.name,
    required this.frequency,
  });

  final Duration frequency;
}

class SendNotificationTask extends PeriodicTask {
  const SendNotificationTask()
      : super(
          name: TaskName.sendNotificationTaskName,
          frequency: const Duration(minutes: 15),
        );
}

extension TaskConverter on (String taskName, Map<String, dynamic>? inputData) {
  Task? toTask()  {
    final (taskName, inputData) = this;
    if (taskName == TaskName.sendNotificationTaskName) {
      return const SendNotificationTask();
    }

    return null;
  }
}

List<Task> getAllTasks() => [
      const SendNotificationTask(),
    ];

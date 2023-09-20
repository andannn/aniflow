mixin TimeUtil {
  /// Calculate minus from [seconds]
  static Duration durationFromSeconds(int seconds) {
    return DateTime.fromMillisecondsSinceEpoch(seconds * 1000)
        .difference(DateTime.fromMillisecondsSinceEpoch(0));
  }

  static DateTime timeAfterMilliseconds(int milliseconds) {
    return DateTime.fromMillisecondsSinceEpoch(
      DateTime.now().millisecondsSinceEpoch + milliseconds,
    );
  }

  static String? getFormattedDuration(Duration duration) {
    final result = <String>[];
    final days = duration.inDays;
    final hours = duration.inHours % 60;
    final minutes = duration.inMinutes % 60;

    if (days != 0) {
      result.add('$days days');
    }
    if (hours != 0) {
      result.add('$hours hours');
    }
    if (minutes != 0) {
      result.add('$minutes minutes');
    }
    return result.firstOrNull;
  }
}

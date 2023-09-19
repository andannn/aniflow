
mixin TimeUtil {
  /// Calculate minus from [milliseconds]
  int minusFromMilliseconds(int milliseconds) {
    return DateTime.fromMillisecondsSinceEpoch(milliseconds)
        .difference(DateTime.fromMillisecondsSinceEpoch(0))
        .inMinutes;
  }
}

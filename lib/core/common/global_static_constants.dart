
mixin Config {
  static const refreshIntervalInMinutes = 24 * 60;
  static const defaultAnimationDuration = Duration(milliseconds: 300);
  static const defaultCatchExtend = 300.0;

  /// default page count of anime.
  static const int defaultPerPageCount = 9;
}

var isUnitTest = false;


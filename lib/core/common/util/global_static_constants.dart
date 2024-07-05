// ignore_for_file: lines_longer_than_80_chars

mixin AfConfig {
  static const defaultAnimationDuration = Duration(milliseconds: 300);
  static const defaultCatchExtend = 300.0;

  /// default page count of anime.
  static const int defaultPerPageCount = 18;

  static const int profilePageDefaultPerPageCount = 9;
  static const int activityPageDefaultPerPageCount = 30;
  static const int notificationPageDefaultPerPageCount = 25;

  /// Detail page consts.
  static const double detailPagePreviewItemHeight = 133.0;
  static const int characterColumnCount = 3;
  static const int staffColumnCount = 2;

  static const String imageDownloadFolder = 'aniflow';
  static const int daysBeforeOfMoviesInHome = 15;
  static const int daysAfterOfMoviesInHome = 30;

  static const int maxSendNotificationCount = 3;

  static const String activityClassString = 'com.andannn.aniflow.MainActivity';
}

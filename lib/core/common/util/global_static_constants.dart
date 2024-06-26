// ignore_for_file: lines_longer_than_80_chars

mixin AfConfig {
  static const defaultAnimationDuration = Duration(milliseconds: 300);
  static const defaultCatchExtend = 300.0;

  /// default page count of anime.
  static const int defaultPerPageCount = 18;

  static const int profilePageDefaultPerPageCount = 9;
  static const int activityPageDefaultPerPageCount = 50;
  static const int notificationPageDefaultPerPageCount = 25;

  /// Detail page consts.
  static const double detailPagePreviewItemHeight = 133.0;
  static const int characterColumnCount = 3;
  static const int staffColumnCount = 2;

  static const String imageDownloadFolder = 'aniflow';
  static const int daysBeforeOfMoviesInHome = 15;
  static const int daysAfterOfMoviesInHome = 30;

  static const int maxSendNotificationCount = 3;
}

/// Only for test
var isUnitTest = false;
const String testToken =
    'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6Ijc4ZWQ1YTk5ZDFkNTU2NDBkMTRkN2E5N2I1YWMyNDc3MjIyODFhYjM2NzE4MmFiN2VjNDg2ZTJjOWQ0MTA2MDZkN2ZlOGZkYzA1YjJlOGQ2In0.eyJhdWQiOiIxNDQwOSIsImp0aSI6Ijc4ZWQ1YTk5ZDFkNTU2NDBkMTRkN2E5N2I1YWMyNDc3MjIyODFhYjM2NzE4MmFiN2VjNDg2ZTJjOWQ0MTA2MDZkN2ZlOGZkYzA1YjJlOGQ2IiwiaWF0IjoxNjk4NTY2MzU0LCJuYmYiOjE2OTg1NjYzNTQsImV4cCI6MTczMDE4ODc1NCwic3ViIjoiNjM3ODM5MyIsInNjb3BlcyI6W119.cjnTU0bSGzQnjxbAy-wkzRqiI5r2zAI_XmOX8teX0MZuceDj7qiBQQ6An-p6Ue30LYSI7V5Tw4ocChZn1bRsg6sRFCPAmE8eBbV4XBGjOhlAb9ciqMgTmVeND6bz0uWO1lr3D0fLfmQKPchrZAwb1-aVDhMkI3Ba4bC1VzxfbGPpw3IzbXjbAg1kFStENCvn3fTXTX53ndNGuPlbS6l8tfOlgYSK7dm0le4JrJAEIlm_Om4WYb6ij42sI0WK1pJY5Lzpar-K0KxaubN9poNKXa81PX65DABzywHXrEi8_D7_O_DkIVsKPjU5dAhXUEhmukFkkLDbRgn7np0i8A-wAfTrVq3tLPvUkDoqdyH105mmwXR_nwO3ZqKJtCnolUok289my02qP1yA0uSmq0nJ51ikI3CEnk_H-jCz5OcVAUhN2qNRb3fhx0fNekBBfaUuJqbHr7usgaNAWRu_vQX0LGs7daClKl1k5FBtdrsJGwSkbY13ghKH42pmBVlY-I9oS8ocznuMsVtyo7QfY6oaMv9kZBuelMto7pM28z61S__qo2jsKzr_2I5uAH3avjUY28G8M3r0r3nkkXqMu_BPn3T95LOLTCghtwx2cE4LARBpZ_1t9rYFUzDb05HeARrqWzbhOwbm9c0N5RM8guq6O1q8kAVZFNLTLjK25ycBuiw';

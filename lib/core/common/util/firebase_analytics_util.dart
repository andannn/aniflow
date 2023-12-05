// ignore_for_file: lines_longer_than_80_chars

import 'package:aniflow/core/common/util/logger.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

extension FirebaseAnalyticsExtension on FirebaseAnalytics {
  Future trackScreen(
      {required String screenName, required String screenClass}) {
    logger.d('firebase analytics track screen. screenName: $screenName screenClass: $screenClass');
    return logEvent(
      name: 'screen_view',
      parameters: {
        'firebase_screen': screenName,
        'firebase_screen_class': screenClass,
      },
    );
  }
}

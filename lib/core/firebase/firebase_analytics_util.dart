import 'package:aniflow/app/aniflow_router/ani_flow_route_path.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/firebase/firebase_event.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

extension FirebaseAnalyticsExtension on FirebaseAnalytics {
  Future trackAniFlowPath(AniFlowRoutePath path) {
    logger.d('firebase analytics track screen. path: $path');
    return logEvent(
      name: FirebaseEvent.screenTransaction.eventName,
      parameters: {
        'screen_name': path.toString(),
      },
    );
  }
}

import 'package:aniflow/app/aniflow_router/ani_flow_route_path.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/firebase/fa_event.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

extension FirebaseAnalyticsExtension on FirebaseAnalytics {
  Future logAniFlowPathChangeEvent(AniFlowRoutePath path) {
    logger.d('AniFlowPath changed event logged. path: $path');
    return logEvent(
      name: FaEvent.screenTransaction.eventName,
      parameters: {
        'screen_name': path.toString(),
      },
    );
  }

  Future logLikeActionEvent({
    required LikeContentType type,
    required String id,
    required bool isLiked,
  }) async {
    logger.d('Like state changed event logged. '
        'type: ${type.name}, id $id, isLiked $isLiked');
    return logEvent(
      name: FaEvent.likeStateChanged.eventName,
      parameters: {
        isLiked ? 'liked' : 'unliked': '${type.name}_$id',
      },
    );
  }
}

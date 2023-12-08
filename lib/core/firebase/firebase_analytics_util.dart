import 'package:aniflow/app/aniflow_router/ani_flow_route_path.dart';
import 'package:aniflow/core/common/model/media_type.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/firebase/data_size_property/data_type.dart';
import 'package:aniflow/core/firebase/fa_event.dart';
import 'package:aniflow/core/firebase/firebase_event.dart';
import 'package:aniflow/core/shared_preference/aniflow_preferences.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

extension FirebaseAnalyticsExtension on FirebaseAnalytics {
  static const _tag = 'FirebaseAnalyticsExtension';

  Future logAniFlowPathChangeEvent(AniFlowRoutePath path) {
    logger.d('$_tag AniFlowPath changed event logged. path: $path');
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
    logger.d('$_tag  Like state changed event logged. '
        'type: ${type.name}, id $id, isLiked $isLiked');
    return logEvent(
      name: FaEvent.likeStateChanged.eventName,
      parameters: {
        isLiked ? 'liked' : 'unliked': '${type.name}_$id',
      },
    );
  }

  Future setInitialUserProperty() {
    return Future.wait(
      [
        computeAndSetAppDataSizeProperty(),
        setUserMediaContentProperty(AniFlowPreferences().getCurrentMediaType()),
      ],
    );
  }

  Future computeAndSetAppDataSizeProperty() async {
    for (var type in DataType.values) {
      final size =
          await ComputeFileSizeHelper.computeSizeOfDataTypeInIsolate(type);

      final value = (size / 1000000).round();
      final name = FirebaseUserProperty.fromDataType(type).propertyName;

      logger.d('$_tag Set user data size property for analytics.'
          ' type: $name, size: ${value}_MB}');
      await setUserProperty(
        name: name,
        value: '${value}_MB',
      );
    }
  }

  Future setUserMediaContentProperty(MediaType type) async {
    logger.d('$_tag Set user media content property for analytics.'
        ' type: ${type.toJson()}');
    return setUserProperty(
      name: FirebaseUserProperty.mediaContent.propertyName,
      value: type.toJson(),
    );
  }
}

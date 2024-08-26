import 'package:aniflow/app/routing/model/ani_flow_route_path.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/firebase/analytics/data_size_property/data_type.dart';
import 'package:aniflow/core/firebase/analytics/fa_event.dart';
import 'package:aniflow/core/firebase/analytics/fa_user_property.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

extension FirebaseAnalyticsExtension on FirebaseAnalytics {
  static const _tag = 'FirebaseAnalyticsExtension';

  ///
  /// Log Event
  ///

  Future logAniFlowPathChangeEvent(AniFlowRoutePath path) {
    logger.d('$_tag AniFlowPath changed event logged. path: $path');
    return logEvent(
      name: FaEvent.screenTransaction.name,
      parameters: {
        ScreenTransactionDimension.screenName.name: path.toString(),
      },
    );
  }

  Future logLikeActionEvent({
    required LikeContentMetrics metrics,
    required String id,
    required bool isLiked,
  }) async {
    final dimension = isLiked
        ? LikeStateChangedDimension.like.name
        : LikeStateChangedDimension.unliked.name;

    logger.d('$_tag  Like state changed event logged. '
        'dimension $dimension, metrics: ${metrics.name}, id $id, ');
    return logEvent(
      name: FaEvent.likeStateChanged.name,
      parameters: {
        dimension: '${metrics.name}_$id',
      },
    );
  }

  Future logAppDataSizeEvent() async {
    for (var type in DataType.values) {
      final size =
          await ComputeFileSizeHelper.computeSizeOfDataTypeInIsolate(type);

      final dimension = switch (type) {
        DataType.userData => LogAppDataSizeDimension.userDataSize.name,
        DataType.imgCache => LogAppDataSizeDimension.imgCacheSize.name,
      };
      final metrics = '${(size / 1000000).round()}_MB';

      logger.d('$_tag Set user data size event logged.'
          ' dimension: $dimension, metrics: $metrics');
      await logEvent(
        name: FaEvent.logAppDataSize.name,
        parameters: {
          dimension: metrics,
        },
      );
    }
  }

  ///
  /// User property
  ///

  Future setInitialUserProperty() {
    return Future.wait(
      [
// TODO:
        // setUserMediaContentProperty(
        //     GetItScope.of(context).get<UserDataRepository>().mediaType),
      ],
    );
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

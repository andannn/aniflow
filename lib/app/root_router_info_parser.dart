import 'package:aniflow/app/aniflow_router/ani_flow_route_path.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:flutter/cupertino.dart';

class RootRouterInfoParser extends RouteInformationParser<AniFlowRoutePath> {
  @override
  Future<AniFlowRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = routeInformation.uri;
    final path = uri.path;

    if (path.contains('anime') || path.contains('manga')) {
      final mediaId = path.split('/')[2];
      logger.d('deep link detected: mediaID: $mediaId');
      return DetailMediaRoutePath(mediaId);
    }

    return const DiscoverRoutePath();
  }
}

import 'package:aniflow/app/nested_router/ani_flow_route_path.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:flutter/cupertino.dart';

class AniFlowRouteInfoParser extends RouteInformationParser<AniFlowRoutePath> {
  @override
  Future<AniFlowRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    logger.d('JQN routeInformation  ${routeInformation.uri}');
    return const DiscoverRoutePath();
  }
}

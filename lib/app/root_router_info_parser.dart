import 'package:aniflow/app/aniflow_router/ani_flow_route_path.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:flutter/cupertino.dart';

class RootRouterInfoParser extends RouteInformationParser<AniFlowRoutePath> {
  const RootRouterInfoParser();

  static const String _tag = 'RootRouterInfoParser';

  @override
  Future<AniFlowRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = routeInformation.uri;

    final newRoutePath = parseRoutePath(uri);

    if (newRoutePath != null) {
      return newRoutePath;
    }

    logger.d('$_tag Default route launched: DiscoverRoutePath');
    return const DiscoverRoutePath();
  }

  static AniFlowRoutePath? parseRoutePath(Uri uri) {
    final path = uri.path;

    if (path.contains('anime') || path.contains('manga')) {
      final mediaId = path.split('/')[2];
      logger.d('$_tag DetailMediaRoute deep link detected: mediaID: $mediaId');
      return DetailMediaRoutePath(mediaId);
    }

    if (path.contains('character')) {
      final characterId = path.split('/')[2];
      logger.d('$_tag DetailCharacter deep link detected: '
          'characterId: $characterId');
      return DetailCharacterPath(characterId);
    }

    if (path.contains('staff')) {
      final staffId = path.split('/')[2];
      logger.d('$_tag DetailStaffPath deep link detected: staffId: $staffId');
      return DetailStaffPath(staffId);
    }

    return null;
  }
}

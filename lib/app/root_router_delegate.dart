import 'package:aniflow/app/nested_router/ani_flow.dart';
import 'package:aniflow/app/nested_router/ani_flow_route_path.dart';
import 'package:flutter/material.dart';

class RootRouterDelegate extends RouterDelegate<AniFlowRoutePath>
    with ChangeNotifier {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: const [AniFlowPage()],
      onPopPage: _onPopPage,
    );
  }

  /// Judgment of whether need to pop current page.
  bool _onPopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }

    return true;
  }

  @override
  Future<void> setNewRoutePath(configuration) async {}

  @override
  Future<bool> popRoute() => Future.value(false);
}

import 'package:aniflow/app/aniflow_router/af_router_back_stack.dart';
import 'package:aniflow/app/aniflow_router/ani_flow.dart';
import 'package:aniflow/app/aniflow_router/ani_flow_route_path.dart';
import 'package:flutter/material.dart';

class RootRouterDelegate extends RouterDelegate<AniFlowRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AniFlowRoutePath> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  final AfRouterBackStack afRouterBackStack = AfRouterBackStack();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [AniFlowPage(afRouterBackStack: afRouterBackStack)],
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
  Future<void> setNewRoutePath(configuration) async {
    afRouterBackStack.setNewRoutePath(configuration);
  }
}

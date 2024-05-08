import 'package:aniflow/app/routing/af_router_back_stack.dart';
import 'package:aniflow/app/routing/ani_flow_route_path.dart';
import 'package:flutter/material.dart';

class RootRouterDelegate extends RouterDelegate<AniFlowRoutePath>
    with
        ChangeNotifier,
        PopNavigatorRouterDelegateMixin<AniFlowRoutePath>,
        AfRouterBackStackMixin {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  final routeObserver = RouteObserver();
  final backButtonDispatcher = RootBackButtonDispatcher();

  static BuildContext? _routerContext;

  static RootRouterDelegate get() =>
      Router.of(_routerContext!).routerDelegate as RootRouterDelegate;

  @override
  Widget build(BuildContext context) {
    _routerContext = context;
    return Navigator(
      key: navigatorKey,
      pages: stack.map((path) => path.generatePage()).toList(),
      onPopPage: _onPopPage,
      observers: [routeObserver],
    );
  }

  /// Judgment of whether need to pop current page.
  bool _onPopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }

    popBackStack();
    return true;
  }
}
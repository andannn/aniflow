import 'package:aniflow/app/aniflow_router/af_router_back_stack.dart';
import 'package:aniflow/app/aniflow_router/ani_flow_route_path.dart';
import 'package:aniflow/app/aniflow_router/top_level_navigation.dart';
import 'package:flutter/material.dart';

class AfRouterDelegate extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  AfRouterDelegate({required this.backStack}) {
    backStack.addListener(notifyListeners);
  }

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  RouteObserver routeObserver = RouteObserver();

  final AfRouterBackStack backStack;

  TopLevelNavigation get currentTopLevelNavigation =>
      backStack.currentTopLevelNavigation;

  AniFlowRoutePath get currentPath => backStack.currentPath;

  bool get isTopRouteFullScreen => backStack.isTopRouteFullScreen;

  static BuildContext? _routerContext;

  static AfRouterDelegate of() =>
      Router.of(_routerContext!).routerDelegate as AfRouterDelegate;

  @override
  Widget build(BuildContext context) {
    _routerContext = context;

    if (backStack.stack.isEmpty) {
      return const SizedBox();
    }

    return Navigator(
      key: navigatorKey,
      pages: backStack.stack.map((path) => path.generatePage()).toList(),
      onPopPage: _onPopPage,
      observers: [routeObserver],
    );
  }

  @override
  void dispose() {
    backStack.dispose();

    super.dispose();
  }

  @override
  Future<void> setNewRoutePath(configuration) async {
    throw Exception('Nested router wil not parse');
  }

  /// Judgment of whether need to pop current page.
  bool _onPopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }

    backStack.popBackStack();
    return true;
  }
}

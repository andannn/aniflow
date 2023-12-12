import 'package:aniflow/app/aniflow_router/ani_flow.dart';
import 'package:aniflow/app/aniflow_router/ani_flow_route_path.dart';
import 'package:aniflow/app/aniflow_router/ani_flow_router_delegate.dart';
import 'package:flutter/material.dart';

class RootRouterDelegate extends RouterDelegate<AniFlowRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AniFlowRoutePath> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  static BuildContext? _routerContext;

  static RootRouterDelegate of() =>
      Router.of(_routerContext!).routerDelegate as RootRouterDelegate;

  @override
  Widget build(BuildContext context) {
    _routerContext = context;
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
  Future<void> setNewRoutePath(configuration) async {
    final afRouter = AfRouterDelegate.tryGet();
    afRouter?.backStack.setNewRoutePath(configuration);
  }
}

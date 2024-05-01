import 'package:aniflow/feature/aniflow_home/top_level_navigation.dart';
import 'package:flutter/material.dart';

class AfRouterDelegate extends RouterDelegate<TopLevelRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  AfRouterDelegate();

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  RouteObserver routeObserver = RouteObserver();

  List<TopLevelRoutePath> _backStack = [const DiscoverRoutePath()];

  /// get current top level.
  TopLevelNavigation get currentTopLevelNavigation =>
      _backStack.last.topLevel;

  @override
  Widget build(BuildContext context) {
    if (_backStack.isEmpty) {
      return const SizedBox();
    }

    return Navigator(
      key: navigatorKey,
      pages: _backStack.map((path) => path.generatePage()).toList(),
      onPopPage: _onPopPage,
      observers: [routeObserver],
    );
  }

  /// Judgment of whether need to pop current page.
  bool _onPopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }

    _backStack.removeLast();
    notifyListeners();
    return true;
  }

  @override
  Future<void> setNewRoutePath(TopLevelRoutePath configuration) {
    throw UnimplementedError();
  }

  void navigateToTopLevelPage(TopLevelNavigation navigation) {
    if (navigation == TopLevelNavigation.discover) {
      _backStack = [const DiscoverRoutePath()];
    } else {
      _backStack = [const DiscoverRoutePath(), navigation.toRoutePath()];
    }

    notifyListeners();

// TODO:
//     FirebaseAnalytics.instance
//         .logAniFlowPathChangeEvent(navigation.toRoutePath());
  }
}

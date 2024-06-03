import 'package:aniflow/feature/aniflow_home/top_level_navigation.dart';
import 'package:flutter/material.dart';

class AfRouterDelegate extends RouterDelegate<TopLevelNavigation>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  AfRouterDelegate();

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();
  final GlobalKey<_TopLevelNavigatorState> _topLevelStateKey = GlobalKey();

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  /// get current top level.
  RestorableEnum<TopLevelNavigation> get _topLevelState =>
      _topLevelStateKey.currentState!.topLevel;

  TopLevelNavigation get currentTopLevelNavigation => _topLevelState.value;

  @override
  Widget build(BuildContext context) {
    return TopLevelNavigator(
      key: _topLevelStateKey,
      navigatorKey: _navigatorKey,
      onPopPage: _onPopPage,
    );
  }

  @override
  Future<void> setNewRoutePath(TopLevelNavigation configuration) {
    throw UnimplementedError();
  }

  void navigateToTopLevelPage(TopLevelNavigation navigation) {
    _topLevelState.value = navigation;
    notifyListeners();

// TODO:
//     FirebaseAnalytics.instance
//         .logAniFlowPathChangeEvent(navigation.toRoutePath());
  }

  /// Judgment of whether need to pop current page.
  bool _onPopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }

    _topLevelState.value = TopLevelNavigation.discover;
    notifyListeners();

    return true;
  }
}

class TopLevelNavigator extends StatefulWidget {
  const TopLevelNavigator({
    super.key,
    required this.navigatorKey,
    this.onPopPage,
  });

  final GlobalKey<NavigatorState> navigatorKey;
  final PopPageCallback? onPopPage;

  @override
  State<TopLevelNavigator> createState() => _TopLevelNavigatorState();
}

class _TopLevelNavigatorState extends State<TopLevelNavigator>
    with RestorationMixin {
  final topLevel = RestorableEnum<TopLevelNavigation>(
    TopLevelNavigation.discover,
    values: TopLevelNavigation.values,
  );

  Set<TopLevelNavigation> get _backStack =>
      {TopLevelNavigation.discover, topLevel.value};

  @override
  Widget build(BuildContext context) {
    if (_backStack.isEmpty) {
      return const SizedBox();
    }

    return Navigator(
      key: widget.navigatorKey,
      pages: _backStack.map((path) => path.toPage()).toList(),
      onPopPage: widget.onPopPage,
    );
  }

  @override
  String? get restorationId => 'top_level_navigator';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(topLevel, 'top_level_value');
  }
}

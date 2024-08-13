import 'package:aniflow/feature/aniflow_home/top_level_navigation.dart';
import 'package:flutter/material.dart';

class AfRouterDelegate extends RouterDelegate<TopLevelNavigation>
    with ChangeNotifier {
  AfRouterDelegate();

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();
  final GlobalKey<_TopLevelNavigatorState> _topLevelStateKey = GlobalKey();

  RestorableEnum<TopLevelNavigation>? get _topLevelState =>
      _topLevelStateKey.currentState?.topLevel;

  TopLevelNavigation get currentTopLevelNavigation =>
      _topLevelState?.value ?? TopLevelNavigation.discover;

  bool get canPop => currentTopLevelNavigation == TopLevelNavigation.discover;

  @override
  Widget build(BuildContext context) {
    return TopLevelNavigator(
      key: _topLevelStateKey,
      navigatorKey: _navigatorKey,
      onRouteChanged: _onRouteChanged,
    );
  }

  @override
  Future<void> setNewRoutePath(TopLevelNavigation configuration) {
    throw UnimplementedError();
  }

  void navigateToTopLevelPage(TopLevelNavigation navigation) {
    _topLevelState?.value = navigation;

    // FirebaseAnalytics.instance
    //     .logAniFlowPathChangeEvent(navigation.toRoutePath());
  }

  void _onRouteChanged() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      notifyListeners();
    });
  }

  void onPopPage(bool didPop, Object? result) {
    _topLevelState?.value = TopLevelNavigation.discover;
  }

  @override
  Future<bool> popRoute() {
    throw StateError('popRoute is not supported');
  }
}

class TopLevelNavigator extends StatefulWidget {
  const TopLevelNavigator({
    super.key,
    required this.navigatorKey,
    required this.onRouteChanged,
  });

  final GlobalKey<NavigatorState> navigatorKey;
  final VoidCallback onRouteChanged;

  @override
  State<TopLevelNavigator> createState() => _TopLevelNavigatorState();
}

class _TopLevelNavigatorState extends State<TopLevelNavigator>
    with RestorationMixin {
  final topLevel = _CustomRestorableEnum<TopLevelNavigation>(
    TopLevelNavigation.discover,
    values: TopLevelNavigation.values,
  );

  Set<TopLevelNavigation> get _backStack =>
      {TopLevelNavigation.discover, topLevel.value};

  @override
  void initState() {
    super.initState();
    topLevel.addListener(widget.onRouteChanged);
  }

  @override
  void dispose() {
    super.dispose();
    topLevel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_backStack.isEmpty) {
      return const SizedBox();
    }

    return Navigator(
      key: widget.navigatorKey,
      pages: _backStack.map((path) => path.toPage()).toList(),
    );
  }

  @override
  String? get restorationId => 'top_level_navigator';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(topLevel, 'top_level_value');
  }
}

class _CustomRestorableEnum<T extends Enum> extends RestorableEnum<T> {
  _CustomRestorableEnum(super.defaultValue, {required super.values});

  @override
  void initWithValue(T value) {
    super.initWithValue(value);
    notifyListeners();
  }
}

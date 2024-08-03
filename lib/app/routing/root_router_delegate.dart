import 'dart:async';
import 'dart:convert';

import 'package:aniflow/app/routing/model/af_router_back_stack.dart';
import 'package:aniflow/app/routing/model/ani_flow_route_path.dart';
import 'package:aniflow/app/routing/util/ani_flow_page_generator.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class RootRouterDelegate extends RouterDelegate<AniFlowRoutePath>
    with
        ChangeNotifier,
        PopNavigatorRouterDelegateMixin<AniFlowRoutePath>,
        AfRouterBackStackMixin {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();
  final GlobalKey<RootNavigatorWidgetState> _backStackKey = GlobalKey();

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  @override
  GlobalKey<RootNavigatorWidgetState> get backStackKey => _backStackKey;

  @override
  AniFlowRoutePath? get currentConfiguration =>
      _backStackKey.currentState?.restorableAfStack.value.last;

  final routeObserver = RouteObserver();
  final backButtonDispatcher = RootBackButtonDispatcher();

  final _pageResultStreamController = StreamController<dynamic>.broadcast();

  static BuildContext? _routerContext;

  static RootRouterDelegate get() =>
      Router.of(_routerContext!).routerDelegate as RootRouterDelegate;

  @override
  Widget build(BuildContext context) {
    _routerContext = context;
    return RootNavigatorWidget(
      key: _backStackKey,
      navigatorKey: _navigatorKey,
      onPopPage: _onPopPage,
      observers: [routeObserver],
    );
  }

  /// Judgment of whether need to pop current page.
  bool _onPopPage(Route<dynamic> route, result) {
    logger.d('onPopPage: $route, $result');
    if (!route.didPop(result)) {
      return false;
    }

    _pageResultStreamController.add(result);
    popBackStack();
    return true;
  }

  @override
  void dispose() {
    super.dispose();

    _pageResultStreamController.close();
  }

  Future<R> awaitPageResult<R>() {
    return _pageResultStreamController.stream.whereType<R>().first;
  }
}

class RootNavigatorWidget extends StatefulWidget {
  const RootNavigatorWidget({
    super.key,
    required this.navigatorKey,
    this.onPopPage,
    required this.observers,
  });

  final GlobalKey<NavigatorState> navigatorKey;
  final PopPageCallback? onPopPage;
  final List<NavigatorObserver> observers;

  @override
  State<RootNavigatorWidget> createState() => RootNavigatorWidgetState();
}

class RootNavigatorWidgetState extends State<RootNavigatorWidget>
    with RestorationMixin {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: widget.navigatorKey,
      pages:
          restorableAfStack.value.map((path) => path.generatePage()).toList(),
      onPopPage: widget.onPopPage,
      observers: widget.observers,
    );
  }

  final restorableAfStack = RestorableAfStack();

  @override
  String? get restorationId => 'root_navigator';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(restorableAfStack, 'root_navigator_stack');
  }
}

class RestorableAfStack extends RestorableValue<List<AniFlowRoutePath>> {
  @override
  List<AniFlowRoutePath> createDefaultValue() {
    return [const AniFlowHomePath()];
  }

  @override
  void didUpdateValue(List<AniFlowRoutePath>? oldValue) {
    notifyListeners();
  }

  @override
  List<AniFlowRoutePath> fromPrimitives(Object? data) {
    return (jsonDecode(data!.toString()) as List)
        .map((e) => AniFlowRoutePath.fromJson(e))
        .toList();
  }

  @override
  Object? toPrimitives() {
    return jsonEncode(value.map((e) => e.toJson()).toList());
  }
}

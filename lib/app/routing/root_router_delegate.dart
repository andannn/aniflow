import 'dart:async';
import 'dart:convert';

import 'package:aniflow/app/routing/model/af_router_back_stack.dart';
import 'package:aniflow/app/routing/model/ani_flow_route_path.dart';
import 'package:aniflow/app/routing/util/ani_flow_page_generator.dart';
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
      onDidRemovePage: _onDidRemovePage,
      observers: [routeObserver],
      onPopInvoked: _onPopInvoked,
    );
  }

  void _onDidRemovePage(Page<Object?> page) {
    popBackStack();
  }

  void _onPopInvoked(bool didPop, result) {
    _pageResultStreamController.add(result);
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
    this.onDidRemovePage,
    required this.observers,
    required this.onPopInvoked,
  });

  final GlobalKey<NavigatorState> navigatorKey;
  final DidRemovePageCallback? onDidRemovePage;
  final List<NavigatorObserver> observers;
  final PopInvokedWithResultCallback onPopInvoked;

  @override
  State<RootNavigatorWidget> createState() => RootNavigatorWidgetState();
}

class RootNavigatorWidgetState extends State<RootNavigatorWidget>
    with RestorationMixin {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: widget.navigatorKey,
      pages: restorableAfStack.value
          .map((path) => path.generatePage(onPopInvoked: widget.onPopInvoked))
          .toList(),
      onDidRemovePage: widget.onDidRemovePage,
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

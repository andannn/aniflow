import 'dart:async';
import 'dart:convert';

import 'package:aniflow/app/routing/model/ani_flow_route_path.dart';
import 'package:aniflow/app/routing/util/ani_flow_page_generator.dart';
import 'package:aniflow/core/common/definitions/media_category.dart';
import 'package:aniflow/core/firebase/analytics/firebase_analytics_util.dart';
import 'package:aniflow/feature/airing_schedule/airing_schedule.dart';
import 'package:aniflow/feature/image_preview/preview_source.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class RootRouterDelegate extends RouterDelegate<AniFlowRoutePath>
    with
        ChangeNotifier,
        PopNavigatorRouterDelegateMixin<AniFlowRoutePath>,
        _AfRouterBackStackMixin {
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
    _popBackStack();
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

mixin _AfRouterBackStackMixin
    on ChangeNotifier, RouterDelegate<AniFlowRoutePath> {
  GlobalKey<RootNavigatorWidgetState> get backStackKey;

  RestorableAfStack get _stack => backStackKey.currentState!.restorableAfStack;

  void navigateToAnimeList(MediaCategory category) {
    _pushAsSingleton(CategoryAnimeListRoutePath(category: category));
  }

  void navigateToCharacterList(String characterId) {
    _pushAsSingleton(MediaCharacterListRoutePath(id: characterId));
  }

  void navigateToStaffList(String staffId) {
    _pushAsSingleton(MediaStaffListRoutePath(id: staffId));
  }

  void navigateToDetailMedia(String animeId) {
    _pushAsSingleton(DetailMediaRoutePath(id: animeId));
  }

  void navigateToAiringSchedule({ScheduleType type = ScheduleType.bangumi}) {
    _pushAsSingleton(AiringScheduleRoutePath(type: type));
  }

  void navigateToSearch() {
    _pushAsSingleton(const SearchRoutePath());
  }

  void navigateToNotification() {
    _pushAsSingleton(const NotificationRoutePath());
  }

  void navigateToUserProfile(String userId) {
    _pushAsSingleton(UserProfileRoutePath(id: userId));
  }

  void navigateToDetailCharacter(String id) {
    _pushAsSingleton(DetailCharacterPath(id: id));
  }

  void navigateToDetailStaff(String id) {
    _pushAsSingleton(DetailStaffPath(id: id));
  }

  void navigateToDetailStudio(String id) {
    _pushAsSingleton(DetailStudioRoutePath(id: id));
  }

  void navigateToActivityRepliesPage(String id) {
    _pushAsSingleton(ActivityRepliesRoutePath(id: id));
  }

  void navigateImagePreviewPage(PreviewSource source) {
    _pushAsSingleton(ImagePreviewRoutePath(source: source));
  }

  void navigateToMediaListUpdatePage(String mediaId, String from) {
    _pushAsSingleton(MediaListUpdateRoutePath(mediaId: mediaId, from: from));
  }

  void navigateToBirthdayCharacterPage() {
    _pushAsSingleton(const BirthdayCharacterPagePath());
  }

  void navigateToSettingsPage() {
    _pushAsSingleton(const SettingsRoutePath());
  }

  void navigateToPlayer(String source) {
    _pushAsSingleton(FullScreenPlayerPath(source));
  }

  void _popBackStack() {
    _stack.value = [..._stack.value]..removeLast();
    notifyListeners();

    final topPageOrNull = _stack.value.lastOrNull;
    if (topPageOrNull != null) {
      FirebaseAnalytics.instance.logAniFlowPathChangeEvent(topPageOrNull);
    }
  }

  void _pushAsSingleton(AniFlowRoutePath path) {
    if (_stack.value.contains(path)) {
      _stack.value = [..._stack.value]..remove(path);
    }

    _stack.value = [..._stack.value, path];

    notifyListeners();

    FirebaseAnalytics.instance.logAniFlowPathChangeEvent(path);
  }

  @override
  Future<void> setNewRoutePath(AniFlowRoutePath configuration) async {
    if (_stack.value.isNotEmpty && configuration is AniFlowHomePath) {
      // when app launched by re-construction, the back stack is restored
      // and already having initial value.
      return;
    }

    _pushAsSingleton(configuration);
  }
}

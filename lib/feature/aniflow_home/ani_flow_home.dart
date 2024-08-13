import 'package:aniflow/app/di/get_it_scope.dart';
import 'package:aniflow/app/routing/root_router_delegate.dart';
import 'package:aniflow/core/common/dialog/dialog_handler.dart';
import 'package:aniflow/core/common/message/snack_bar_message_mixin.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/feature/aniflow_home/ani_flow_router_delegate.dart';
import 'package:aniflow/feature/aniflow_home/aniflow_home_bloc.dart';
import 'package:aniflow/feature/aniflow_home/aniflow_home_state.dart';
import 'package:aniflow/feature/aniflow_home/top_level_navigation.dart';
import 'package:aniflow/feature/auth/bloc/auth_bloc.dart';
import 'package:aniflow/feature/discover/discover_bloc.dart';
import 'package:aniflow/feature/media_list_update_page/media_list_update_page.dart';
import 'package:aniflow/feature/media_track/bloc/track_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AniFlowHomePage extends Page {
  const AniFlowHomePage({super.key});

  @override
  Route createRoute(BuildContext context) {
    return AniFlowRoute(settings: this);
  }
}

class AniFlowRoute extends PageRoute with MaterialRouteTransitionMixin {
  AniFlowRoute({super.settings}) : super(allowSnapshotting: false);

  @override
  Widget buildContent(BuildContext context) {
    return RootRestorationScope(
      restorationId: 'aniflow_route',
      child: BlocProvider(
        create: (context) => GetItScope.of(context).get<AniflowHomeBloc>(),
        child: const DialogEventHandler(
          child: AniFlowAppScaffold(),
        ),
      ),
    );
  }

  @override
  bool canTransitionTo(TransitionRoute nextRoute) {
    if (nextRoute is MediaListUpdateRoute) {
      return false;
    } else {
      return super.canTransitionTo(nextRoute);
    }
  }

  @override
  bool get maintainState => true;
}

class AniFlowAppScaffold extends StatefulWidget {
  const AniFlowAppScaffold({super.key});

  @override
  State<AniFlowAppScaffold> createState() => _AniFlowAppScaffoldState();
}

class _AniFlowAppScaffoldState extends State<AniFlowAppScaffold>
    with RouteAware, ShowSnackBarMixin {
  AfRouterDelegate afRouterDelegate = AfRouterDelegate();
  RouteObserver rootObserver = RootRouterDelegate.get().routeObserver;

  final rootBackButtonDispatcher =
      RootRouterDelegate.get().backButtonDispatcher;
  final childBackButtonDispatcher =
      ChildBackButtonDispatcher(RootRouterDelegate.get().backButtonDispatcher);

  var currentTopLevel = TopLevelNavigation.discover;

  @override
  void initState() {
    super.initState();

    afRouterDelegate.addListener(() {
      setState(() {
        currentTopLevel = afRouterDelegate.currentTopLevelNavigation;
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    rootObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    super.dispose();

    rootObserver.unsubscribe(this);

    afRouterDelegate.dispose();
  }

  @override
  void didPop() {
    super.didPop();
    logger.d('$runtimeType didPop');

    rootBackButtonDispatcher.takePriority();
  }

  @override
  void didPush() {
    super.didPush();
    logger.d('$runtimeType didPush');

    childBackButtonDispatcher.takePriority();
  }

  @override
  void didPopNext() {
    super.didPopNext();
    logger.d('$runtimeType didPopNext');

    childBackButtonDispatcher.takePriority();
  }

  @override
  void didPushNext() {
    super.didPushNext();
    logger.d('$runtimeType didPushNext');

    rootBackButtonDispatcher.takePriority();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AniflowHomeBloc, AniflowHomeState>(
        builder: (context, state) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GetItScope.of(context).get<DiscoverBloc>(),
          ),
          BlocProvider(
            create: (context) => GetItScope.of(context).get<TrackBloc>(),
          ),
          BlocProvider(
            create: (context) => GetItScope.of(context).get<AuthBloc>(),
          ),
        ],
        child: Scaffold(
          body: Router(
            restorationScopeId: "aniflow_home",
            routerDelegate: afRouterDelegate,
            backButtonDispatcher: childBackButtonDispatcher,
          ),
          bottomNavigationBar: _animeTrackerNavigationBar(
            navigationList: state.topLevelNavigationList,
            selected: currentTopLevel,
            onNavigateToDestination: (navigation) async {
              afRouterDelegate.navigateToTopLevelPage(navigation);
            },
          ),
        ),
      );
    });
  }

  Widget _animeTrackerNavigationBar(
      {required List<TopLevelNavigation> navigationList,
      required TopLevelNavigation selected,
      required Function(TopLevelNavigation) onNavigateToDestination}) {
    final currentIndex = navigationList.indexOf(selected);
    return NavigationBar(
      destinations: navigationList
          .map(
            (navigation) => _buildNavigationBarItem(
              navigation,
              isSelected: navigation == selected,
            ),
          )
          .toList(),
      onDestinationSelected: (index) {
        if (currentIndex != index) {
          onNavigateToDestination(navigationList[index]);
        }
      },
      selectedIndex: currentIndex,
    );
  }

  Widget _buildNavigationBarItem(TopLevelNavigation item,
      {required bool isSelected}) {
    return NavigationDestination(
      label: item.iconTextId,
      icon: Icon(item.unSelectedIcon),
      selectedIcon: Icon(item.selectedIcon),
    );
  }
}

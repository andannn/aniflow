import 'package:aniflow/app/di/get_it_scope.dart';
import 'package:aniflow/core/common/dialog/dialog_handler.dart';
import 'package:aniflow/core/common/message/snack_bar_message_mixin.dart';
import 'package:aniflow/core/common/util/screen_size_util.dart';
import 'package:aniflow/feature/aniflow_home/ani_flow_router_delegate.dart';
import 'package:aniflow/feature/aniflow_home/aniflow_home_bloc.dart';
import 'package:aniflow/feature/aniflow_home/aniflow_home_state.dart';
import 'package:aniflow/feature/aniflow_home/top_level_navigation.dart';
import 'package:aniflow/feature/auth/bloc/auth_bloc.dart';
import 'package:aniflow/feature/media_list_update_page/media_list_update_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AniFlowHomePage extends Page {
  const AniFlowHomePage({super.key, super.onPopInvoked});

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
    with ShowSnackBarMixin {
  AfRouterDelegate afRouterDelegate = AfRouterDelegate();

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
  void dispose() {
    super.dispose();

    afRouterDelegate.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AniflowHomeBloc, AniflowHomeState>(
        builder: (context, state) {
      final isPresentationMode = state.isPresentationMode;
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GetItScope.of(context).get<AuthBloc>(),
          ),
        ],
        child: LayoutBuilder(builder: (context, constrains) {
          Widget body() => Stack(
                children: [
                  PopScope(
                    canPop: afRouterDelegate.canPop,
                    onPopInvokedWithResult: (didPop, result) {
                      afRouterDelegate.onPopPage(didPop, result);
                    },
                    child: Router(
                      restorationScopeId: "aniflow_home",
                      routerDelegate: afRouterDelegate,
                    ),
                  ),
                  if (state.isPresentationMode) const PresentationCover(),
                ],
              );

          if (ScreenSizeUtil.isLargeScreen(context)) {
            return Scaffold(
              body: Row(
                children: [
                  _navigationRail(
                    navigationList: state.topLevelNavigationList,
                    selected: currentTopLevel,
                    onNavigateToDestination: (navigation) {
                      afRouterDelegate.navigateToTopLevelPage(navigation);
                    },
                  ),
                  Expanded(
                    child: Container(
                      color: Theme.of(context).colorScheme.surfaceContainer,
                      padding: const EdgeInsets.all(4),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surfaceContainer,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: body(),
                      ),
                    ),
                  )
                ],
              ),
            );
          }

          return Scaffold(
            body: body(),
            bottomNavigationBar: _navigationBar(
              navigationList: state.topLevelNavigationList,
              selected: currentTopLevel,
              onNavigateToDestination: (navigation) {
                afRouterDelegate.navigateToTopLevelPage(navigation);
              },
            ),
          );
        }),
      );
    });
  }

  NavigationRail _navigationRail({
    required List<TopLevelNavigation> navigationList,
    required TopLevelNavigation selected,
    required Function(TopLevelNavigation navigation) onNavigateToDestination,
  }) {
    final currentIndex = navigationList.indexOf(selected);
    return NavigationRail(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      elevation: 5,
      leading: const SizedBox(height: 32),
      destinations: navigationList
          .map(
            (navigation) => _buildNavigationRailItem(
              navigation,
              isSelected: navigation == selected,
            ),
          )
          .toList(),
      labelType: NavigationRailLabelType.all,
      onDestinationSelected: (index) {
        if (currentIndex != index) {
          onNavigateToDestination(navigationList[index]);
        }
      },
      selectedIndex: currentIndex,
    );
  }

  Widget _navigationBar(
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

  NavigationRailDestination _buildNavigationRailItem(TopLevelNavigation item,
      {required bool isSelected}) {
    return NavigationRailDestination(
      label: Text(item.iconTextId),
      icon: Icon(item.unSelectedIcon),
      selectedIcon: Icon(item.selectedIcon),
    );
  }
}

class PresentationCover extends StatelessWidget {
  const PresentationCover({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      color: Colors.amber.withAlpha(158),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Presentation Mode",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          FilledButton(onPressed: () {}, child: const Text("START"))
        ],
      ),
    );
  }
}

import 'package:aniflow/app/routing/root_router_delegate.dart';
import 'package:aniflow/core/common/definitions/home_sector_category.dart';
import 'package:aniflow/core/common/definitions/media_category.dart';
import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/core/design_system/widget/avatar_icon.dart';
import 'package:aniflow/core/design_system/widget/loading_indicator.dart';
import 'package:aniflow/feature/aniflow_home/auth/auth_dialog.dart';
import 'package:aniflow/feature/aniflow_home/discover/airing_schedule/today_airing_schedule.dart';
import 'package:aniflow/feature/aniflow_home/discover/birthday_characters/birthday_character.dart';
import 'package:aniflow/feature/aniflow_home/discover/discover_bloc.dart';
import 'package:aniflow/feature/aniflow_home/discover/discover_ui_state.dart';
import 'package:aniflow/feature/aniflow_home/discover/media_category_preview/media_category_preview.dart';
import 'package:aniflow/feature/aniflow_home/discover/next_to_watch/next_to_watch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiscoverPage extends Page {
  const DiscoverPage({super.key});

  @override
  Route createRoute(BuildContext context) {
    return DiscoverPageRoute(settings: this);
  }
}

class DiscoverPageRoute extends PageRoute with MaterialRouteTransitionMixin {
  DiscoverPageRoute({super.settings}) : super(allowSnapshotting: false);

  @override
  Widget buildContent(BuildContext context) {
    return const DiscoverScreen();
  }

  @override
  bool get maintainState => true;
}

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverBloc, DiscoverUiState>(
      builder: (BuildContext context, state) {
        final userData = state.userData;
        final hasUnreadNotification =
            userData != null && userData.unreadNotificationCount != 0;
        final isLoggedIn = state.isLoggedIn;
        final isLoading = state.isLoading;
        final sectors = state.sectors;
        return Scaffold(
          appBar: AppBar(
            title: Text(context.appLocal.discover),
            actions: [
              LoadingIndicator(isLoading: isLoading),
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: IconButton(
                  onPressed: () {
                    RootRouterDelegate.get().navigateToSearch();
                  },
                  icon: const Icon(Icons.search_rounded),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: IconButton(
                  onPressed: () => showAuthDialog(context),
                  icon: isLoggedIn
                      ? Stack(
                          clipBehavior: Clip.none,
                          children: [
                            buildAvatarIcon(context, userData!.avatar),
                            hasUnreadNotification
                                ? Positioned(
                                    right: -2,
                                    top: -2,
                                    child: Container(
                                      constraints: const BoxConstraints(
                                        minHeight: 20,
                                        minWidth: 20,
                                      ),
                                      decoration: const ShapeDecoration(
                                        color: Colors.red,
                                        shape: StadiumBorder(),
                                      ),
                                      child: Center(
                                        child: Text(
                                          userData.unreadNotificationCount
                                              .toString(),
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox()
                          ],
                        )
                      : const Icon(Icons.person_outline),
                ),
              )
            ],
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              await context.read<DiscoverBloc>().onPullToRefreshTriggered();
            },
            child: CustomScrollView(
              cacheExtent: AfConfig.defaultCatchExtend,
              slivers: _buildSectors(
                context: context,
                state: state,
                sectors: sectors,
              ),
            ),
          ),
        );
      },
    );
  }

  List<Widget> _buildSectors(
      {required BuildContext context,
      required DiscoverUiState state,
      required List<HomeSectorCategory> sectors}) {
    Widget buildWidgetItem(HomeSectorCategory category) => switch (category) {
          HomeSectorCategory.upNext => NextToWatchAnimeBlocProvider(
              userId: state.userData?.id,
              mediaType: state.currentMediaType,
            ),
          HomeSectorCategory.birthdayCharacters =>
            const BirthdayCharactersBlocProvider(),
          HomeSectorCategory.todaySchedule =>
            const TodayAiringScheduleBlocProvider(),
          HomeSectorCategory.currentSeasonAnime => MediaPreviewBlocProvider(
              mediaCategory: MediaCategory.currentSeasonAnime,
              userId: state.userData?.id,
              mediaType: state.currentMediaType,
            ),
          HomeSectorCategory.nextSeasonAnime => MediaPreviewBlocProvider(
              mediaCategory: MediaCategory.nextSeasonAnime,
              userId: state.userData?.id,
              mediaType: state.currentMediaType,
            ),
          HomeSectorCategory.trendingAnime => MediaPreviewBlocProvider(
              mediaCategory: MediaCategory.trendingAnime,
              userId: state.userData?.id,
              mediaType: state.currentMediaType,
            ),
          HomeSectorCategory.movieAnime => MediaPreviewBlocProvider(
              mediaCategory: MediaCategory.movieAnime,
              userId: state.userData?.id,
              mediaType: state.currentMediaType,
            ),
          HomeSectorCategory.trendingManga => MediaPreviewBlocProvider(
              mediaCategory: MediaCategory.trendingManga,
              userId: state.userData?.id,
              mediaType: state.currentMediaType,
            ),
          HomeSectorCategory.allTimePopularManga => MediaPreviewBlocProvider(
              mediaCategory: MediaCategory.allTimePopularManga,
              userId: state.userData?.id,
              mediaType: state.currentMediaType,
            ),
          HomeSectorCategory.topManhwa => MediaPreviewBlocProvider(
              mediaCategory: MediaCategory.topManhwa,
              userId: state.userData?.id,
              mediaType: state.currentMediaType,
            ),
        };
    return sectors
        .map(
          (category) => SliverToBoxAdapter(child: buildWidgetItem(category)),
        )
        .toList();
  }
}

import 'package:aniflow/app/routing/root_router_delegate.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/core/data/model/user_model.dart';
import 'package:aniflow/core/design_system/widget/af_network_image.dart';
import 'package:aniflow/feature/profile/profile_bloc.dart';
import 'package:aniflow/feature/profile/profile_state.dart';
import 'package:aniflow/feature/profile/profile_tab_category.dart';
import 'package:aniflow/feature/profile/sub_activity/profile_activity_overview.dart';
import 'package:aniflow/feature/profile/sub_activity/user_activity_paging_bloc.dart';
import 'package:aniflow/feature/profile/sub_favorite/bloc/favorite_anime_paging_bloc.dart';
import 'package:aniflow/feature/profile/sub_favorite/bloc/favorite_character_paging_bloc.dart';
import 'package:aniflow/feature/profile/sub_favorite/bloc/favorite_manga_paging_bloc.dart';
import 'package:aniflow/feature/profile/sub_favorite/bloc/favorite_staff_paging_bloc.dart';
import 'package:aniflow/feature/profile/sub_favorite/profile_favorite.dart';
import 'package:aniflow/feature/profile/sub_media_list/bloc/anime_list_paging_bloc.dart';
import 'package:aniflow/feature/profile/sub_media_list/bloc/manga_list_paging_bloc.dart';
import 'package:aniflow/feature/profile/sub_media_list/profile_media_list.dart';
import 'package:aniflow/feature/profile/sub_stats/bloc/stats_bloc.dart';
import 'package:aniflow/feature/profile/sub_stats/stats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ProfilePage extends Page {
  const ProfilePage({
    this.userId,
    super.key,
    this.isFullScreenPageRoute = false,
  });

  final String? userId;
  final bool isFullScreenPageRoute;

  @override
  Route createRoute(BuildContext context) {
    return ProfileRoute(
        settings: this,
        userId: userId,
        isFullScreenPageRoute: isFullScreenPageRoute);
  }
}

class ProfileRoute extends PageRoute with MaterialRouteTransitionMixin {
  ProfileRoute(
      {required this.userId,
      required this.isFullScreenPageRoute,
      super.settings})
      : super(allowSnapshotting: false);

  final String? userId;
  final bool isFullScreenPageRoute;

  @override
  Widget buildContent(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => GetIt.instance.get<ProfileBloc>(
              param1: userId,
            ),
        child:
            _ProfilePageContent(isFullScreenPageRoute: isFullScreenPageRoute));
  }

  @override
  bool get maintainState => true;
}

class _ProfilePageContent extends StatelessWidget {
  const _ProfilePageContent({required this.isFullScreenPageRoute});

  final bool isFullScreenPageRoute;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        final userState = state.userData;
        if (userState == null) {
          return const SizedBox();
        } else {
          final loadingStateRepository = context.read<ProfileBloc>();
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (BuildContext context) =>
                    GetIt.instance.get<FavoriteAnimePagingBloc>(
                  param1: userState.id,
                  param2: AfConfig.profilePageDefaultPerPageCount,
                )..loadingStateRepository = loadingStateRepository,
              ),
              BlocProvider(
                create: (BuildContext context) =>
                    GetIt.instance.get<FavoriteMangaPagingBloc>(
                  param1: userState.id,
                  param2: AfConfig.profilePageDefaultPerPageCount,
                )..loadingStateRepository = loadingStateRepository,
              ),
              BlocProvider(
                create: (BuildContext context) =>
                    GetIt.instance.get<FavoriteCharacterPagingBloc>(
                  param1: userState.id,
                  param2: AfConfig.profilePageDefaultPerPageCount,
                )..loadingStateRepository = loadingStateRepository,
              ),
              BlocProvider(
                create: (BuildContext context) =>
                    GetIt.instance.get<FavoriteStaffPagingBloc>(
                  param1: userState.id,
                  param2: AfConfig.profilePageDefaultPerPageCount,
                )..loadingStateRepository = loadingStateRepository,
              ),
              BlocProvider(
                create: (BuildContext context) =>
                    GetIt.instance.get<WatchingAnimeListPagingBloc>(
                  param1: userState.id,
                  param2: AfConfig.profilePageDefaultPerPageCount,
                )..loadingStateRepository = loadingStateRepository,
              ),
              BlocProvider(
                create: (BuildContext context) =>
                    GetIt.instance.get<DroppedAnimeListPagingBloc>(
                  param1: userState.id,
                  param2: AfConfig.profilePageDefaultPerPageCount,
                )..loadingStateRepository = loadingStateRepository,
              ),
              BlocProvider(
                create: (BuildContext context) =>
                    GetIt.instance.get<CompleteAnimeListPagingBloc>(
                  param1: userState.id,
                  param2: AfConfig.profilePageDefaultPerPageCount,
                )..loadingStateRepository = loadingStateRepository,
              ),
              BlocProvider(
                create: (BuildContext context) =>
                    GetIt.instance.get<ReadingMangaListPagingBloc>(
                  param1: userState.id,
                  param2: AfConfig.profilePageDefaultPerPageCount,
                )..loadingStateRepository = loadingStateRepository,
              ),
              BlocProvider(
                create: (BuildContext context) =>
                    GetIt.instance.get<DroppedMangaListPagingBloc>(
                  param1: userState.id,
                  param2: AfConfig.profilePageDefaultPerPageCount,
                )..loadingStateRepository = loadingStateRepository,
              ),
              BlocProvider(
                create: (BuildContext context) => GetIt.instance.get<StatsBloc>(
                  param1: userState.id,
                )..loadingStateRepository = loadingStateRepository,
              ),
              BlocProvider(
                create: (BuildContext context) =>
                    GetIt.instance.get<UserActivityPagingBloc>(
                  param1: userState.id,
                  param2: AfConfig.profilePageDefaultPerPageCount,
                )..loadingStateRepository = loadingStateRepository,
              ),
            ],
            child: _UserProfile(
              userState: userState,
              isFullScreenPageRoute: isFullScreenPageRoute,
            ),
          );
        }
      },
    );
  }
}

class _UserProfile extends StatefulWidget {
  const _UserProfile(
      {required this.userState, required this.isFullScreenPageRoute});

  final UserModel userState;
  final bool isFullScreenPageRoute;

  @override
  State<_UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<_UserProfile>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: ProfileTabType.values.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();

    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverPersistentHeader(
                delegate: _CustomSliverAppBarDelegate(
                  state: widget.userState,
                  isFullScreenPageRoute: widget.isFullScreenPageRoute,
                  tabController: _tabController,
                  tabs: ProfileTabType.values
                      .map((e) => Text(e.translated(context)))
                      .toList(),
                ),
                pinned: true,
                floating: true,
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: ProfileTabType.values
              .map((e) => _buildPageByProfileCategory(e))
              .toList(),
        ),
      ),
    );
  }

  Widget _buildPageByProfileCategory(ProfileTabType category) {
    switch (category) {
      case ProfileTabType.activity:
        return const ProfileActivityPage();
      case ProfileTabType.favorite:
        return const ProfileFavoriteTabPage();
      case ProfileTabType.animeList:
        return const ProfileMediaListTabPage(mediaType: MediaType.anime);
      case ProfileTabType.mangaList:
        return const ProfileMediaListTabPage(mediaType: MediaType.manga);
      case ProfileTabType.stats:
        return const ProfileStatsTabPage();
    }
  }
}

class _CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  const _CustomSliverAppBarDelegate({
    required this.state,
    required this.tabController,
    required this.tabs,
    required this.isFullScreenPageRoute,
  });

  final TabController tabController;
  final List<Widget> tabs;

  final UserModel state;
  final _maxExtent = 360.0;
  final _minExtent = 160.0;

  final bool isFullScreenPageRoute;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return _buildCustomHeader(context, shrinkOffset, state.isLoading);
      },
    );
  }

  @override
  double get maxExtent => _maxExtent;

  @override
  double get minExtent => _minExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;

  Widget _buildBackground(BuildContext context, double shrinkOffset) => Opacity(
        opacity: 1 - shrinkOffset / (_maxExtent - _minExtent),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Stack(
                children: [
                  SizedBox.expand(
                    child: AFNetworkImage(imageUrl: state.bannerImage!),
                  ),
                  Container(
                    height: 50,
                    color: Theme.of(context).colorScheme.surface.withAlpha(122),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(width: 30),
                        FractionallySizedBox(
                          heightFactor: 0.5,
                          child: AFNetworkImage(imageUrl: state.avatar),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          state.name,
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(color: Colors.white),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );

  Widget _buildBackButton(BuildContext context, double shrinkOffset) => Opacity(
        opacity: 1 - shrinkOffset / (_maxExtent - _minExtent),
        child: _HalfTransparentIconButton(
          icon: Icons.arrow_back,
          onPressed: () {
            RootRouterDelegate.get().popBackStack();
          },
        ),
      );

  Widget _buildSettingButton(BuildContext context, double shrinkOffset) =>
      Opacity(
        opacity: 1 - shrinkOffset / (_maxExtent - _minExtent),
        child: _HalfTransparentIconButton(
          icon: Icons.settings,
          onPressed: () {
            RootRouterDelegate.get().navigateToSettingsPage();
          },
        ),
      );

  Widget _buildCustomHeader(
      BuildContext context, shrinkOffset, bool isLoading) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Stack(
            fit: StackFit.expand,
            children: [
              _buildBackground(context, shrinkOffset),
              _buildAppbar(shrinkOffset),
              if (isFullScreenPageRoute)
                Positioned(
                  left: 0,
                  top: 50,
                  child: _buildBackButton(context, shrinkOffset),
                ),
              if (!isFullScreenPageRoute)
                Positioned(
                  top: 50,
                  right: 0,
                  child: _buildSettingButton(context, shrinkOffset),
                ),
            ],
          ),
        ),
        Container(
          height: 50,
          width: double.infinity,
          color: Theme.of(context).colorScheme.surface,
          child: Column(
            children: [
              Expanded(
                child: TabBar(
                  controller: tabController,
                  isScrollable: true,
                  tabs: tabs,
                ),
              ),
              AnimatedOpacity(
                opacity: isLoading ? 1 : 0,
                duration: AfConfig.defaultAnimationDuration,
                child: const LinearProgressIndicator(),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildAppbar(double shrinkOffset) => Opacity(
        opacity: shrinkOffset / (_maxExtent - _minExtent),
        child: AppBar(
          title: Text(state.name),
          automaticallyImplyLeading: isFullScreenPageRoute,
          actions: [
            if (!isFullScreenPageRoute)
              IconButton(
                onPressed: () {
                  RootRouterDelegate.get().navigateToSettingsPage();
                },
                icon: const Icon(Icons.settings),
              )
          ],
        ),
      );
}

class _HalfTransparentIconButton extends StatelessWidget {
  const _HalfTransparentIconButton({this.icon, this.onPressed});

  final IconData? icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface.withAlpha(223),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Icon(icon, color: Theme.of(context).colorScheme.onSurface),
      ),
      onPressed: onPressed,
    );
  }
}

import 'package:aniflow/core/common/model/media_type.dart';
import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/data/activity_repository.dart';
import 'package:aniflow/core/data/favorite_repository.dart';
import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/data/model/user_model.dart';
import 'package:aniflow/core/data/user_info_repository.dart';
import 'package:aniflow/core/data/user_statistics_repository.dart';
import 'package:aniflow/core/design_system/widget/af_network_image.dart';
import 'package:aniflow/feature/profile/profile_bloc.dart';
import 'package:aniflow/feature/profile/profile_state.dart';
import 'package:aniflow/feature/profile/profile_tab_category.dart';
import 'package:aniflow/feature/profile/sub_activity/UserActivityPagingBloc.dart';
import 'package:aniflow/feature/profile/sub_activity/profile_activity_overview.dart';
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

class ProfilePage extends Page {
  const ProfilePage({this.userId, super.key});

  final String? userId;

  @override
  Route createRoute(BuildContext context) {
    return ProfileRoute(settings: this, userId: userId);
  }
}

class ProfileRoute extends PageRoute with MaterialRouteTransitionMixin {
  ProfileRoute({required this.userId, super.settings})
      : super(allowSnapshotting: false);

  final String? userId;

  @override
  Widget buildContent(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => ProfileBloc(
              userId: userId,
              userInfoRepository: context.read<UserInfoRepository>(),
            ),
        child: const _ProfilePageContent());
  }

  @override
  bool get maintainState => true;
}

class _ProfilePageContent extends StatelessWidget {
  const _ProfilePageContent();

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
                create: (BuildContext context) => FavoriteAnimePagingBloc(
                  userState.id,
                  favoriteRepository: context.read<FavoriteRepository>(),
                )..loadingStateRepository = loadingStateRepository,
              ),
              BlocProvider(
                create: (BuildContext context) => FavoriteMangaPagingBloc(
                  userState.id,
                  favoriteRepository: context.read<FavoriteRepository>(),
                )..loadingStateRepository = loadingStateRepository,
              ),
              BlocProvider(
                create: (BuildContext context) => FavoriteCharacterPagingBloc(
                  userState.id,
                  favoriteRepository: context.read<FavoriteRepository>(),
                )..loadingStateRepository = loadingStateRepository,
              ),
              BlocProvider(
                create: (BuildContext context) => FavoriteStaffPagingBloc(
                  userState.id,
                  favoriteRepository: context.read<FavoriteRepository>(),
                )..loadingStateRepository = loadingStateRepository,
              ),
              BlocProvider(
                create: (BuildContext context) => WatchingAnimeListPagingBloc(
                  userState.id,
                  mediaListRepository: context.read<MediaListRepository>(),
                )..loadingStateRepository = loadingStateRepository,
              ),
              BlocProvider(
                create: (BuildContext context) => DroppedAnimeListPagingBloc(
                  userState.id,
                  mediaListRepository: context.read<MediaListRepository>(),
                )..loadingStateRepository = loadingStateRepository,
              ),
              BlocProvider(
                create: (BuildContext context) => CompleteAnimeListPagingBloc(
                  userState.id,
                  mediaListRepository: context.read<MediaListRepository>(),
                )..loadingStateRepository = loadingStateRepository,
              ),
              BlocProvider(
                create: (BuildContext context) => ReadingMangaListPagingBloc(
                  userState.id,
                  mediaListRepository: context.read<MediaListRepository>(),
                )..loadingStateRepository = loadingStateRepository,
              ),
              BlocProvider(
                create: (BuildContext context) => DroppedMangaListPagingBloc(
                  userState.id,
                  mediaListRepository: context.read<MediaListRepository>(),
                )..loadingStateRepository = loadingStateRepository,
              ),
              BlocProvider(
                create: (BuildContext context) => StatsBloc(
                  userState.id,
                  repository: context.read<UserStatisticsRepository>(),
                )..loadingStateRepository = loadingStateRepository,
              ),
              BlocProvider(
                create: (BuildContext context) => UserActivityPagingBloc(
                  userState.id,
                  activityRepository: context.read<ActivityRepository>(),
                )..loadingStateRepository = loadingStateRepository,
              ),
            ],
            child: _UserProfile(userState: userState),
          );
        }
      },
    );
  }
}

class _UserProfile extends StatefulWidget {
  const _UserProfile({required this.userState});

  final UserModel userState;

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
                  tabController: _tabController,
                  tabs: ProfileTabType.values
                      .map((e) => Text(e.getLocalString(context)))
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
  });

  final TabController tabController;
  final List<Widget> tabs;

  final UserModel state;
  final _maxExtent = 360.0;
  final _minExtent = 160.0;

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
                    color:
                        Theme.of(context).colorScheme.background.withAlpha(122),
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
            ],
          ),
        ),
        Container(
          height: 50,
          width: double.infinity,
          color: Theme.of(context).colorScheme.background,
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
          automaticallyImplyLeading: false,
        ),
      );
}

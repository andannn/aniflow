import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/data/auth_repository.dart';
import 'package:aniflow/core/data/favorite_repository.dart';
import 'package:aniflow/core/data/model/user_data_model.dart';
import 'package:aniflow/core/design_system/widget/af_network_image.dart';
import 'package:aniflow/feature/profile/boc/profile_bloc.dart';
import 'package:aniflow/feature/profile/boc/profile_state.dart';
import 'package:aniflow/feature/profile/boc/profile_tab_category.dart';
import 'package:aniflow/feature/profile/sub_favorite/bloc/profile_favorite_bloc.dart';
import 'package:aniflow/feature/profile/sub_favorite/bloc/profile_favorite_state.dart';
import 'package:aniflow/feature/profile/sub_favorite/profile_favorite.dart';
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
              authRepository: context.read<AuthRepository>(),
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
      buildWhen: (pre, current) => pre.userData != current.userData,
      builder: (context, state) {
        final userState = state.userData;
        if (userState == null) {
          return const SizedBox();
        } else {
          return MultiBlocProvider(providers: [
            BlocProvider(
              create: (BuildContext context) => ProfileFavoriteBloc(
                userState.id,
                context.read<FavoriteRepository>(),
              ),
            ),
          ], child: _UserProfile(userState: userState));
        }
      },
    );
  }
}

class _UserProfile extends StatefulWidget {
  const _UserProfile({required this.userState});

  final UserData userState;

  @override
  State<_UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<_UserProfile>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  bool get needShowLoadingIndicator => isFavoritePageLoading;
  var isFavoritePageLoading = false;

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
                  isLoading: isFavoritePageLoading,
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
      case ProfileTabType.favorite:
        return const ProfileFavoriteTabPage();
      case ProfileTabType.animeList:
      case ProfileTabType.mangaList:
      case ProfileTabType.reviews:
      case ProfileTabType.social:
        return const SizedBox();
    }
  }
}

class _CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  const _CustomSliverAppBarDelegate({
    required this.state,
    required this.tabController,
    required this.tabs,
    this.isLoading = false,
  });

  final TabController tabController;
  final List<Widget> tabs;

  final UserData state;
  final _maxExtent = 360.0;
  final _minExtent = 160.0;
  final bool isLoading;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return BlocBuilder<ProfileFavoriteBloc, ProfileFavoriteState>(
      buildWhen: (pre, current) => pre.isLoading != current.isLoading,
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
          BuildContext context, shrinkOffset, bool isLoading) =>
      Column(
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
                  duration: Config.defaultAnimationDuration,
                  child: const LinearProgressIndicator(),
                ),
              ],
            ),
          )
        ],
      );

  Widget _buildAppbar(double shrinkOffset) => Opacity(
        opacity: shrinkOffset / (_maxExtent - _minExtent),
        child: AppBar(
          title: Text(state.name),
          automaticallyImplyLeading: false,
        ),
      );
}

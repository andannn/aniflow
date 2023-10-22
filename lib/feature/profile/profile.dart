import 'package:aniflow/app/navigation/ani_flow_router.dart';
import 'package:aniflow/core/common/model/favorite_category.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/data/auth_repository.dart';
import 'package:aniflow/core/data/favorite_repository.dart';
import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/user_data_model.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/core/design_system/widget/af_network_image.dart';
import 'package:aniflow/core/design_system/widget/media_preview_item.dart';
import 'package:aniflow/core/design_system/widget/vertical_animated_scale_switcher.dart';
import 'package:aniflow/feature/common/page_loading_state.dart';
import 'package:aniflow/feature/discover/bloc/profile_tab_category.dart';
import 'package:aniflow/feature/profile/boc/profile_bloc.dart';
import 'package:aniflow/feature/profile/boc/profile_state.dart';
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
              mediaListRepository: context.read<MediaListRepository>(),
              authRepository: context.read<AuthRepository>(),
              userDataRepository: context.read<UserDataRepository>(),
              favoriteRepository: context.read<FavoriteRepository>(),
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
          return _UserProfile(userState: userState);
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
  ProfileBloc? _bloc;

  int get _currentPageIndex => _tabController.index;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    _tabController.addListener(() {
      _bloc?.add(
        OnTabViewVisible(type: ProfileTabType.values[_currentPageIndex]),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();

    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _bloc = context.read<ProfileBloc>();
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
                      .map((e) => Text(e.toString()))
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
        return const _ProfileFavoritePage();
      case ProfileTabType.myList:
        return const SizedBox();
    }
  }
}

class _ProfileFavoritePage extends StatelessWidget {
  const _ProfileFavoritePage();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      buildWhen: (pre, current) =>
          pre.favoriteDataMap != current.favoriteDataMap,
      builder: (BuildContext context, ProfileState state) {
        final favoriteMap = state.favoriteDataMap;
        return CustomScrollView(
          key: const PageStorageKey<String>('anime'),
          slivers: [
            SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            ),
            for (var type in FavoriteType.values)
              ..._buildFavoriteCategory(context, type, favoriteMap[type]!),
          ],
        );
      },
    );
  }

  List<Widget> _buildFavoriteCategory(BuildContext context, FavoriteType type,
      PagingState<List<dynamic>> state) {
    List items = [];
    if (state.data is List<MediaModel>) {
      items = state.data as List<MediaModel>;
    }
    logger.d('items ${items.length}');
    return [
      SliverToBoxAdapter(
        child: VerticalScaleSwitcher(
          visible: state is PageReady,
          child: _buildFavoriteTitle(context, type),
        ),
      ),
      SliverGrid.builder(
        itemCount: items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 3.0 / 5.0,
        ),
        itemBuilder: (context, index) {
          return _buildGridItems(context, items[index]);
        },
      ),
    ];
  }

  Widget _buildFavoriteTitle(BuildContext context, FavoriteType type) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(children: [
        Text(type.toString(), style: Theme.of(context).textTheme.titleMedium),
      ]),
    );
  }

  Widget _buildGridItems(BuildContext context, MediaModel model) {
    return MediaPreviewItem(
      model: model,
      textStyle: Theme.of(context).textTheme.labelMedium,
      onClick: () {
        AFRouterDelegate.of(context).navigateToDetailAnime(
          model.id,
        );
      },
    );
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

  final UserData state;
  final _maxExtent = 360.0;
  final _minExtent = 160.0;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
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
          color: Theme.of(context).colorScheme.background,
          child: TabBar(
            controller: tabController,
            tabs: tabs,
          ),
        )
      ],
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

  Widget _buildAppbar(double shrinkOffset) => Opacity(
        opacity: shrinkOffset / (_maxExtent - _minExtent),
        child: AppBar(
          title: Text(state.name),
          automaticallyImplyLeading: false,
        ),
      );
}

import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/data/auth_repository.dart';
import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/data/model/user_data_model.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/core/design_system/widget/af_network_image.dart';
import 'package:aniflow/feature/profile/boc/profile_bloc.dart';
import 'package:aniflow/feature/profile/boc/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverPersistentHeader(
              delegate: _CustomSliverAppBarDelegate(state: widget.userState),
              pinned: true,
            ),
            SliverPersistentHeader(
              delegate: _CustomTabBarDelegate(tabController: _tabController),
              pinned: true,
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: _buildPageByProfileCategory(),
        ),
      ),
    );
  }

  List<Widget> _buildPageByProfileCategory() {
    return [
      CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: 300,
              color: Colors.red,
            ),
          )
        ],
      ),
      CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: 300,
              color: Colors.blue,
            ),
          )
        ],
      ),
    ];
  }
}

class _CustomTabBarDelegate extends SliverPersistentHeaderDelegate {
  _CustomTabBarDelegate({required this.tabController});

  final TabController tabController;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      constraints: BoxConstraints.expand(),
      color: Theme.of(context).colorScheme.background,
      child: TabBar(
        controller: tabController,
        tabs: [Tab(text: 'profile'), Tab(text: 'overView')],
      ),
    );
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

class _CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  const _CustomSliverAppBarDelegate({required this.state});

  final UserData state;
  final _expandedHeight = 210.0;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        _buildBackground(context, shrinkOffset),
        _buildAppbar(shrinkOffset),
      ],
    );
  }

  @override
  double get maxExtent => _expandedHeight;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;

  Widget _buildBackground(BuildContext context, double shrinkOffset) => Opacity(
        opacity: 1 - shrinkOffset / _expandedHeight,
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
        opacity: shrinkOffset / _expandedHeight,
        child: AppBar(
          title: Text('AAA'),
          automaticallyImplyLeading: false,
        ),
      );
}

// ignore_for_file: lines_longer_than_80_chars

import 'package:aniflow/app/di/get_it_scope.dart';
import 'package:aniflow/app/routing/root_router_delegate.dart';
import 'package:aniflow/core/common/definitions/favorite_category.dart';
import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/core/data/model/favorite_item_model.dart';
import 'package:aniflow/core/design_system/widget/media_preview_item.dart';
import 'package:aniflow/feature/profile/sub_favorite/profile_favorite_bloc.dart';
import 'package:aniflow/feature/profile/sub_favorite/profile_favorite_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileFavoriteTabPage extends StatefulWidget {
  const ProfileFavoriteTabPage({super.key, required this.userId});

  final String userId;

  @override
  State<ProfileFavoriteTabPage> createState() => _ProfileFavoriteTabPageState();
}

class _ProfileFavoriteTabPageState extends State<ProfileFavoriteTabPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (BuildContext context) => GetItScope.of(context)
          .get<ProfileFavoriteBloc>(param1: widget.userId),
      child: const _ProfileFavoriteTabContent(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _ProfileFavoriteTabContent extends StatelessWidget {
  const _ProfileFavoriteTabContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileFavoriteBloc, ProfileFavoriteState>(
        builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: CustomScrollView(
          key: const PageStorageKey<String>('profile_favorite'),
          slivers: [
            SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            ),
            for (var item in FavoriteType.values)
              ..._buildSector(context, item, state.favoriteItems[item] ?? []),
          ],
        ),
      );
    });
  }

  List<Widget> _buildSector(BuildContext context, FavoriteType type,
      List<FavoriteItemModel> items) {
    return [
      if (items.isNotEmpty)
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            child: Row(
              children: [
                Text(
                  type.translated(context),
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          ),
        ),
      SliverGrid.builder(
        itemCount: items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 3.0 / 5.2,
        ),
        itemBuilder: (context, index) => _buildGridItems(
          context,
          model: items[index],
          onClick: () {
            final model = items[index];
            switch (type) {
              case FavoriteType.anime:
              case FavoriteType.manga:
                RootRouterDelegate.get().navigateToDetailMedia(model.id);
              case FavoriteType.character:
                RootRouterDelegate.get().navigateToDetailCharacter(model.id);
              case FavoriteType.staff:
                RootRouterDelegate.get().navigateToDetailStaff(model.id);
            }
          },
        ),
      ),
    ];
  }
}

Widget _buildGridItems(BuildContext context,
    {required FavoriteItemModel model, required VoidCallback onClick}) {
  return MediaPreviewItem(
    coverImage: model.imageUrl,
    title: model.title,
    textStyle: Theme.of(context).textTheme.labelMedium,
    onClick: onClick,
  );
}

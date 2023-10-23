import 'package:aniflow/app/navigation/ani_flow_router.dart';
import 'package:aniflow/core/common/model/favorite_category.dart';
import 'package:aniflow/core/data/model/character_model.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/media_title_modle.dart';
import 'package:aniflow/core/design_system/widget/media_preview_item.dart';
import 'package:aniflow/core/design_system/widget/vertical_animated_scale_switcher.dart';
import 'package:aniflow/feature/common/page_loading_state.dart';
import 'package:aniflow/feature/profile/sub_favorite/bloc/profile_favorite_bloc.dart';
import 'package:aniflow/feature/profile/sub_favorite/bloc/profile_favorite_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileFavoriteTabPage extends StatelessWidget {
  const ProfileFavoriteTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileFavoriteBloc, ProfileFavoriteState>(
      buildWhen: (pre, current) =>
          pre.favoriteDataMap != current.favoriteDataMap,
      builder: (BuildContext context, ProfileFavoriteState state) {
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
    List items = state.data;
    return [
      SliverToBoxAdapter(
        child: VerticalScaleSwitcher(
          visible: items.isNotEmpty,
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
          return _buildGridItems(context, type, items[index]);
        },
      ),
    ];
  }

  Widget _buildFavoriteTitle(BuildContext context, FavoriteType type) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      child: Row(children: [
        Text(
          type.getLocalString(context),
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ]),
    );
  }

  Widget _buildGridItems(
      BuildContext context, FavoriteType type, dynamic model) {
    final String coverImage;
    final String title;
    final String id;
    switch (type) {
      case FavoriteType.anime:
      case FavoriteType.manga:
        coverImage = (model as MediaModel).coverImage;
        title = model.title!.getLocalTitle(context);
        id = model.id;
      case FavoriteType.character:
        coverImage = (model as CharacterModel).image;
        title = model.nameNative;
        id = model.id;
      case FavoriteType.staff:
        coverImage = '';
        title = '';
        id = '';
    }
    return MediaPreviewItem(
      coverImage: coverImage,
      title: title,
      textStyle: Theme.of(context).textTheme.labelMedium,
      onClick: () {
        AFRouterDelegate.of(context).navigateToDetailMedia(id);
      },
    );
  }
}

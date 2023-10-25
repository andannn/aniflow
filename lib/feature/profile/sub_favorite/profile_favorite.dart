// ignore_for_file: lines_longer_than_80_chars

import 'package:aniflow/app/navigation/ani_flow_router.dart';
import 'package:aniflow/core/common/model/favorite_category.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/data/model/character_model.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/media_title_modle.dart';
import 'package:aniflow/core/data/model/staff_model.dart';
import 'package:aniflow/core/design_system/widget/media_preview_item.dart';
import 'package:aniflow/core/design_system/widget/page_bottom_state_indicator.dart';
import 'package:aniflow/core/design_system/widget/vertical_animated_scale_switcher.dart';
import 'package:aniflow/feature/common/page_loading_state.dart';
import 'package:aniflow/feature/common/paging_bloc.dart';
import 'package:aniflow/feature/profile/sub_favorite/bloc/favorite_anime_paging_bloc.dart';
import 'package:aniflow/feature/profile/sub_favorite/bloc/favorite_character_paging_bloc.dart';
import 'package:aniflow/feature/profile/sub_favorite/bloc/favorite_manga_paging_bloc.dart';
import 'package:aniflow/feature/profile/sub_favorite/bloc/favorite_staff_paging_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileFavoriteTabPage extends StatefulWidget {
  const ProfileFavoriteTabPage({super.key});

  @override
  State<ProfileFavoriteTabPage> createState() => _ProfileFavoriteTabPageState();
}

class _ProfileFavoriteTabPageState extends State<ProfileFavoriteTabPage> {
  PagingState<List<MediaModel>>? favoriteAnimeState;
  PagingState<List<MediaModel>>? favoriteMangaState;
  PagingState<List<CharacterModel>>? favoriteCharacterState;
  PagingState<List<StaffModel>>? favoriteStaffState;

  @override
  Widget build(BuildContext context) {
    favoriteAnimeState = context.watch<FavoriteAnimePagingBloc>().state;
    favoriteMangaState = context.watch<FavoriteMangaPagingBloc>().state;
    favoriteCharacterState = context.watch<FavoriteCharacterPagingBloc>().state;
    favoriteStaffState = context.watch<FavoriteStaffPagingBloc>().state;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: CustomScrollView(
        key: const PageStorageKey<String>('anime'),
        slivers: [
          SliverOverlapInjector(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          ),
          for (var type in FavoriteType.values)
            ..._buildFavoriteCategory(context, type),
          const SliverPadding(padding: EdgeInsets.only(top: 20)),
        ],
      ),
    );
  }

  List<Widget> _buildFavoriteCategory(BuildContext context, FavoriteType type) {
    final PagingState? state;
    switch (type) {
      case FavoriteType.anime:
        state = favoriteAnimeState;
      case FavoriteType.manga:
        state = favoriteMangaState;
      case FavoriteType.character:
        state = favoriteCharacterState;
      case FavoriteType.staff:
        state = favoriteStaffState;
    }

    if (state == null) return [const SizedBox()];

    List items = state.data ?? [];

    if (type == FavoriteType.anime) {
      logger.d(state.runtimeType);
    }
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
      SliverToBoxAdapter(
        child: Container(
          height: 64,
          alignment: Alignment.center,
          child: buildPageBottomWidget(
            context: context,
            pagingState: state,
            onRetryLoadPage: () {
              switch (type) {
                case FavoriteType.anime:
                  context
                      .read<FavoriteAnimePagingBloc>()
                      .add(OnRetryLoadPageEvent());
                case FavoriteType.manga:
                  context
                      .read<FavoriteMangaPagingBloc>()
                      .add(OnRetryLoadPageEvent());
                case FavoriteType.character:
                  context
                      .read<FavoriteCharacterPagingBloc>()
                      .add(OnRetryLoadPageEvent());
                case FavoriteType.staff:
                  context
                      .read<FavoriteStaffPagingBloc>()
                      .add(OnRetryLoadPageEvent());
              }
            },
            onLoadMore: () {
              switch (type) {
                case FavoriteType.anime:
                  context
                      .read<FavoriteAnimePagingBloc>()
                      .add(OnRequestLoadPageEvent());
                case FavoriteType.manga:
                  context
                      .read<FavoriteMangaPagingBloc>()
                      .add(OnRequestLoadPageEvent());
                case FavoriteType.character:
                  context
                      .read<FavoriteCharacterPagingBloc>()
                      .add(OnRequestLoadPageEvent());
                case FavoriteType.staff:
                  context
                      .read<FavoriteStaffPagingBloc>()
                      .add(OnRequestLoadPageEvent());
              }
            },
          ),
        ),
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
        coverImage = (model as StaffModel).image;
        title = model.nameNative;
        id = model.id;
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

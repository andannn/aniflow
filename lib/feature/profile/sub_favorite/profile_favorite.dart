// ignore_for_file: lines_longer_than_80_chars

import 'package:aniflow/app/aniflow_router/ani_flow_router_delegate.dart';
import 'package:aniflow/core/common/model/favorite_category.dart';
import 'package:aniflow/core/data/model/character_model.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/media_title_model.dart';
import 'package:aniflow/core/data/model/staff_character_name_model.dart';
import 'package:aniflow/core/data/model/staff_model.dart';
import 'package:aniflow/core/design_system/widget/media_preview_item.dart';
import 'package:aniflow/core/paging/page_loading_state.dart';
import 'package:aniflow/core/shared_preference/aniflow_preferences.dart';
import 'package:aniflow/feature/profile/bloc/profile_bloc.dart';
import 'package:aniflow/feature/profile/sub_favorite/bloc/favorite_anime_paging_bloc.dart';
import 'package:aniflow/feature/profile/sub_favorite/bloc/favorite_character_paging_bloc.dart';
import 'package:aniflow/feature/profile/sub_favorite/bloc/favorite_manga_paging_bloc.dart';
import 'package:aniflow/feature/profile/sub_favorite/bloc/favorite_staff_paging_bloc.dart';
import 'package:aniflow/feature/profile/title_with_items_builder.dart';
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

    PagingState? getPagingStateByType(type) {
      PagingState? state;
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

      return state;
    }

    final isLoading = favoriteAnimeState is PageLoading ||
        favoriteMangaState is PageLoading ||
        favoriteCharacterState is PageLoading ||
        favoriteStaffState is PageLoading;
    context
        .read<ProfileBloc>()
        .add(OnFavoritePageLoadingStateChanged(isLoading: isLoading));

    final isNoData = favoriteAnimeState!.data.isEmpty &&
        favoriteMangaState!.data.isEmpty &&
        favoriteCharacterState!.data.isEmpty &&
        favoriteStaffState!.data.isEmpty;
    if (isNoData) {
      return Center(
        child: Text(
          'No favorites',
          style: Theme.of(context).textTheme.headlineSmall,
          softWrap: true,
          textAlign: TextAlign.center,
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: CustomScrollView(
        key: const PageStorageKey<String>('anime'),
        slivers: [
          SliverOverlapInjector(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          ),
          for (var type in FavoriteType.values)
            ...buildTitleBarWithContent(
              context: context,
              onBuildItem: (context, item) =>
                  _buildGridItems(context, type, item),
              title: type.getLocalString(context),
              state: getPagingStateByType(type),
              onMoreClick: () {
                final userId = context.read<ProfileBloc>().state.userData?.id;
                if (userId == null) {
                  return;
                }

                AfRouterDelegate.of(context).backStack
                    .navigateToFavoritePage(type, userId);
              },
            ),
          const SliverPadding(padding: EdgeInsets.only(top: 20)),
        ],
      ),
    );
  }

  Widget _buildGridItems(
      BuildContext context, FavoriteType type, dynamic model) {
    final language =
        AniFlowPreferences().getAniListSettings().userStaffNameLanguage;
    final String coverImage;
    final String title;
    final String id;
    switch (type) {
      case FavoriteType.anime:
      case FavoriteType.manga:
        coverImage = (model as MediaModel).coverImage;
        title = model.title!.getTitle(
            AniFlowPreferences().getAniListSettings().userTitleLanguage);
        id = model.id;
      case FavoriteType.character:
        coverImage = (model as CharacterModel).image;
        title = model.name!.getNameByUserSetting(language);
        id = model.id;
      case FavoriteType.staff:
        coverImage = (model as StaffModel).image;
        title = model.name!.getNameByUserSetting(language);
        id = model.id;
    }
    return MediaPreviewItem(
      coverImage: coverImage,
      title: title,
      textStyle: Theme.of(context).textTheme.labelMedium,
      onClick: () {
        AfRouterDelegate.of(context).backStack.navigateToDetailMedia(id);
      },
    );
  }
}

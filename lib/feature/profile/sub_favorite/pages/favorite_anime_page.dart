import 'package:aniflow/app/routing/root_router_delegate.dart';
import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/design_system/widget/media_preview_item.dart';
import 'package:aniflow/core/paging/page_loading_state.dart';
import 'package:aniflow/core/paging/paging_content_widget.dart';
import 'package:aniflow/feature/profile/sub_favorite/bloc/favorite_anime_paging_bloc.dart';
import 'package:aniflow/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteAnimeListPage extends Page {
  const FavoriteAnimeListPage({super.key, required this.userId});

  final String userId;

  @override
  Route createRoute(BuildContext context) {
    return FavoriteAnimeListRoute(settings: this, userId: userId);
  }
}

class FavoriteAnimeListRoute extends PageRoute
    with MaterialRouteTransitionMixin {
  FavoriteAnimeListRoute({
    super.settings,
    required this.userId,
  }) : super(allowSnapshotting: false);
  final String userId;

  @override
  Widget buildContent(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<FavoriteAnimePagingBloc>(
        param1: userId,
        param2: AfConfig.defaultPerPageCount,
      ),
      child: const _FavoriteAnimeListPageContent(),
    );
  }

  @override
  bool get maintainState => true;
}

class _FavoriteAnimeListPageContent extends StatelessWidget {
  const _FavoriteAnimeListPageContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteAnimePagingBloc, PagingState<List<MediaModel>>>(
        builder: (context, state) {
      final pagingState = state;
      return Scaffold(
        appBar: AppBar(
          title: const Text('Favorite anime'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.maybePop(context);
            },
          ),
        ),
        body: PagingContent<MediaModel, FavoriteAnimePagingBloc>(
          pagingState: pagingState,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 3.0 / 5.2,
          ),
          onBuildItem: (context, model) => _buildListItems(context, model),
        ),
      );
    });
  }

  Widget _buildListItems(BuildContext context, MediaModel model) {
    return MediaPreviewItem(
      coverImage: model.coverImage?.large ?? '',
      title: model.title?.native ?? '',
      textStyle: Theme.of(context).textTheme.labelMedium,
      onClick: () {
        RootRouterDelegate.get().navigateToDetailMedia(model.id);
      },
    );
  }
}

import 'package:aniflow/app/aniflow_router/ani_flow_router_delegate.dart';
import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/data/model/anime_list_item_model.dart';
import 'package:aniflow/core/design_system/widget/media_preview_item.dart';
import 'package:aniflow/core/paging/page_loading_state.dart';
import 'package:aniflow/core/paging/paging_content_widget.dart';
import 'package:aniflow/feature/profile/sub_media_list/bloc/manga_list_paging_bloc.dart';
import 'package:aniflow/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReadingMangaPage extends Page {
  const ReadingMangaPage({super.key, required this.userId});

  final String userId;

  @override
  Route createRoute(BuildContext context) {
    return UserAnimeListRoute(settings: this, userId: userId);
  }
}

class UserAnimeListRoute extends PageRoute with MaterialRouteTransitionMixin {
  UserAnimeListRoute({
    super.settings,
    required this.userId,
  }) : super(allowSnapshotting: false);
  final String userId;

  @override
  Widget buildContent(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<ReadingMangaListPagingBloc>(
        param1: userId,
        param2: AfConfig.defaultPerPageCount
      ),
      child: const _ReadingMangaPageContent(),
    );
  }

  @override
  bool get maintainState => true;
}

class _ReadingMangaPageContent extends StatelessWidget {
  const _ReadingMangaPageContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadingMangaListPagingBloc,
        PagingState<List<MediaListItemModel>>>(builder: (context, state) {
      final pagingState = state;
      return Scaffold(
        appBar: AppBar(
          title: const Text('Reading manga'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.maybePop(context);
            },
          ),
        ),
        body: PagingContent<MediaListItemModel, ReadingMangaListPagingBloc>(
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

  Widget _buildListItems(BuildContext context, MediaListItemModel model) {
    return MediaPreviewItem(
      coverImage: model.animeModel!.coverImage?.large ?? '',
      title: model.animeModel!.title?.native ?? '',
      textStyle: Theme.of(context).textTheme.labelMedium,
      onClick: () {
        AfRouterDelegate.of(context).backStack
            .navigateToDetailMedia(model.animeModel!.id);
      },
    );
  }
}

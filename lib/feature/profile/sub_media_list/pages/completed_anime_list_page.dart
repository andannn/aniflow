import 'package:aniflow/app/navigation/ani_flow_router.dart';
import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/data/model/anime_list_item_model.dart';
import 'package:aniflow/core/design_system/widget/media_preview_item.dart';
import 'package:aniflow/feature/common/page_loading_state.dart';
import 'package:aniflow/feature/common/paging_content_widget.dart';
import 'package:aniflow/feature/profile/sub_media_list/bloc/anime_list_paging_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompletedAnimePage extends Page {
  const CompletedAnimePage({super.key, required this.userId});

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
      create: (context) => CompleteAnimeListPagingBloc(
        userId,
        mediaListRepository: context.read<MediaListRepository>(),
      ),
      child: const _CompletedAnimePageContent(),
    );
  }

  @override
  bool get maintainState => true;
}

class _CompletedAnimePageContent extends StatelessWidget {
  const _CompletedAnimePageContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompleteAnimeListPagingBloc,
        PagingState<List<MediaListItemModel>>>(builder: (context, state) {
      final pagingState = state;
      return Scaffold(
        appBar: AppBar(
          title: const Text('Completed anime'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.maybePop(context);
            },
          ),
        ),
        body: PagingContent<MediaListItemModel, CompleteAnimeListPagingBloc>(
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
      coverImage: model.animeModel!.coverImage,
      title: model.animeModel!.title?.native ?? '',
      textStyle: Theme.of(context).textTheme.labelMedium,
      onClick: () {
        AFRouterDelegate.of(context)
            .navigateToDetailMedia(model.animeModel!.id);
      },
    );
  }
}

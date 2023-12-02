import 'package:aniflow/app/aniflow_router/ani_flow_router_delegate.dart';
import 'package:aniflow/core/common/model/anime_category.dart';
import 'package:aniflow/core/data/auth_repository.dart';
import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/media_title_model.dart';
import 'package:aniflow/core/design_system/widget/media_preview_item.dart';
import 'package:aniflow/core/paging/page_loading_state.dart';
import 'package:aniflow/core/paging/paging_content_widget.dart';
import 'package:aniflow/core/shared_preference/aniflow_preferences.dart';
import 'package:aniflow/feature/media_page/bloc/media_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MediaListPage extends Page {
  final MediaCategory category;

  const MediaListPage({required this.category, super.key});

  @override
  Route createRoute(BuildContext context) {
    return MediaListRoute(settings: this, category: category);
  }
}

class MediaListRoute extends PageRoute with MaterialRouteTransitionMixin {
  final MediaCategory category;

  MediaListRoute({required this.category, super.settings})
      : super(allowSnapshotting: false);

  @override
  Widget buildContent(BuildContext context) {
    return BlocProvider(
      create: (context) => AnimePageBloc(
        category: category,
        aniListRepository: context.read<MediaInformationRepository>(),
        authRepository: context.read<AuthRepository>(),
        animeTrackListRepository: context.read<MediaListRepository>(),
      ),
      child: const _MediaListPageContent(),
    );
  }

  @override
  bool get maintainState => true;
}

class _MediaListPageContent extends StatelessWidget {
  const _MediaListPageContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimePageBloc, PagingState<List<MediaModel>>>(
        builder: (context, state) {
      final pagingState = state;
      return Scaffold(
        appBar: AppBar(
          title: Text(
            context
                .read<AnimePageBloc>()
                .category
                .getMediaCategoryTitle(context),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.maybePop(context);
            },
          ),
        ),
        body: PagingContent<MediaModel, AnimePageBloc>(
          pagingState: pagingState,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 3.0 / 5.2,
          ),
          onBuildItem: (context, model) => _buildGridItems(context, model),
        ),
      );
    });
  }

  Widget _buildGridItems(BuildContext context, MediaModel model) {
    return MediaPreviewItem(
      textStyle: Theme.of(context).textTheme.labelMedium,
      coverImage: model.coverImage,
      title: model.title!.getTitle(
          AniFlowPreferences().getAniListSettings().userTitleLanguage),
      isFollowing: model.isFollowing,
      onClick: () {
        AfRouterDelegate.of().backStack.navigateToDetailMedia(
          model.id,
        );
      },
    );
  }
}

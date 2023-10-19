import 'package:anime_tracker/app/local/ani_flow_localizations.dart';
import 'package:anime_tracker/app/navigation/ani_flow_router.dart';
import 'package:anime_tracker/core/common/model/anime_category.dart';
import 'package:anime_tracker/core/data/auth_repository.dart';
import 'package:anime_tracker/core/data/media_information_repository.dart';
import 'package:anime_tracker/core/data/media_list_repository.dart';
import 'package:anime_tracker/core/data/model/media_model.dart';
import 'package:anime_tracker/core/design_system/widget/media_preview_item.dart';
import 'package:anime_tracker/feature/common/page_loading_state.dart';
import 'package:anime_tracker/feature/common/paging_bloc.dart';
import 'package:anime_tracker/feature/common/paging_content_widget.dart';
import 'package:anime_tracker/feature/media_page/bloc/media_page_bloc.dart';
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
            _getAppBarTitle(context, context.read<AnimePageBloc>().category),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.maybePop(context);
            },
          ),
        ),
        body: PagingContent(
          pagingState: pagingState,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 3.0 / 5.0,
          ),
          onBuildItem: (context, model) => _buildGridItems(context, model),
          onRequestNewPage: () {
            context.read<AnimePageBloc>().add(OnRequestLoadPageEvent());
          },
          onRetryLoadPage: () {
            context.read<AnimePageBloc>().add(OnRetryLoadPageEvent());
          },
        ),
      );
    });
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

  String _getAppBarTitle(BuildContext context, MediaCategory category) {
    String title;
    switch (category) {
      case MediaCategory.currentSeason:
        title = AFLocalizations.of(context).popularThisSeasonLabel;
      case MediaCategory.nextSeason:
        title = AFLocalizations.of(context).upComingNextSeasonLabel;
      case MediaCategory.trending:
        title = AFLocalizations.of(context).trendingNowLabel;
      case MediaCategory.movie:
        title = AFLocalizations.of(context).movieLabel;
    }
    return title;
  }
}
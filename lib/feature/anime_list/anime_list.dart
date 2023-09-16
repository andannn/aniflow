import 'package:anime_tracker/app/local/anime_tracker_localizations.dart';
import 'package:anime_tracker/app/navigation/nia_router.dart';
import 'package:anime_tracker/core/data/model/short_anime_model.dart';
import 'package:anime_tracker/core/data/repository/ani_list_repository.dart';
import 'package:anime_tracker/core/designsystem/widget/anime_preview_item.dart';
import 'package:anime_tracker/feature/anime_list/bloc/anime_list_bloc.dart';
import 'package:anime_tracker/feature/anime_list/bloc/anime_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:anime_tracker/core/data/model/page_loading_state.dart';
import 'package:anime_tracker/core/designsystem/animetion/page_transaction_animetion.dart';

class AnimeListPage extends Page {
  final AnimeCategory category;

  const AnimeListPage({required this.category, super.key});

  @override
  Route createRoute(BuildContext context) {
    return AnimeListRoute(settings: this, category: category);
  }
}

class AnimeListRoute extends PageRoute with MaterialRouteTransitionMixin {
  final AnimeCategory category;

  AnimeListRoute({required this.category, super.settings});

  @override
  Widget buildContent(BuildContext context) {
    return BlocProvider(
      create: (context) => AnimeListBloc(
        category: category,
        aniListRepository: context.read<AniListRepository>(),
      ),
      child: const Scaffold(
        body: _AnimeListPageContent(),
      ),
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return getFistPageTransaction(
      animation: animation,
      child: getSecondaryPageTransaction(
        animation: secondaryAnimation,
        child: child,
      ),
    );
  }

  @override
  bool get maintainState => false;
}

class _AnimeListPageContent extends StatelessWidget {
  const _AnimeListPageContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimeListBloc, AnimeListState>(
        builder: (context, state) {
      final pagingState = state.animePagingState;
      final animeList = pagingState.data;
      final itemCount = pagingState.data.length;
      // final isLoading = pagingState is PageLoading;

      /// Need load new page only when PageReady state.
      final needDetectNewPageRequest = pagingState is PageReady;
      return CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              _getAppBarTitle(context, context.read<AnimeListBloc>().category),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.maybePop(context);
              },
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(4),
            sliver: SliverGrid.builder(
              itemCount: itemCount,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                childAspectRatio: 3.0 / 5.0,
              ),
              itemBuilder: (context, index) {
                return _buildGridItems(context, animeList[index]);
              },
            ),
          ),
          SliverVisibility(
            visible: needDetectNewPageRequest,
            // show page loading detector widget.
            sliver: const SliverToBoxAdapter(
              child: _RequestPageLoadingDetector(),
            ),
            replacementSliver: SliverToBoxAdapter(
              child: _buildPageBottomBar(context, pagingState),
            ),
          ),
        ],
      );
    });
  }

  Widget _buildGridItems(BuildContext context, ShortAnimeModel model) {
    return AnimePreviewItem(
      model: model,
      textStyle: Theme.of(context).textTheme.labelMedium,
      onClick: () {
        AnimeTrackerRouterDelegate.of(context).navigateToDetailAnime(
          model.id,
        );
      },
    );
  }

  String _getAppBarTitle(BuildContext context, AnimeCategory category) {
    String title;
    switch (category) {
      case AnimeCategory.currentSeason:
        title = ATLocalizations.of(context).popularThisSeasonLabel;
      case AnimeCategory.nextSeason:
        title = ATLocalizations.of(context).upComingNextSeasonLabel;
      case AnimeCategory.trending:
        title = ATLocalizations.of(context).trendingNowLabel;
    }
    return title;
  }

  Widget _buildPageBottomBar(BuildContext context, PagingState pagingState) {
    if (pagingState is PageLoading) {
      // Loading widget.
      return const SizedBox.square(
        dimension: 64,
        child: Align(
          alignment: Alignment.center,
          child: SizedBox.square(
            dimension: 36,
            child: CircularProgressIndicator(),
          ),
        ),
      );
    } else if (pagingState is PageLoadReachEnd) {
      // All loaded widget.
      return SizedBox(
        height: 64,
        child: Column(
          children: [
            const Divider(),
            Opacity(
              opacity: 0.5,
              child: Text(
                ATLocalizations.of(context).allPageLoaded,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      );
    } else {
      // Error widget.
      return SizedBox(
        height: 64,
        width: double.infinity,
        child: Center(
          child: TextButton.icon(
            onPressed: () {
              context.read<AnimeListBloc>().add(OnRetryLoadPageEvent());
            },
            icon: const Icon(Icons.refresh),
            label: Text(ATLocalizations.of(context).retry),
          ),
        ),
      );
    }
  }
}

class _RequestPageLoadingDetector extends StatelessWidget {
  const _RequestPageLoadingDetector();

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      onVisibilityChanged: (VisibilityInfo info) {
        final fraction = info.visibleFraction;
        if (fraction > 0.9) {
          context.read<AnimeListBloc>().add(OnRequestLoadPageEvent());
        }
      },
      key: const Key('Visibility detector key'),
      child: const SizedBox.square(dimension: 64),
    );
  }
}

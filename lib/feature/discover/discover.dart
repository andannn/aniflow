import 'package:anime_tracker/app/local/ani_flow_localizations.dart';
import 'package:anime_tracker/app/navigation/ani_flow_router.dart';
import 'package:anime_tracker/core/common/model/anime_category.dart';
import 'package:anime_tracker/core/common/model/media_type.dart';
import 'package:anime_tracker/core/common/util/global_static_constants.dart';
import 'package:anime_tracker/core/data/model/media_model.dart';
import 'package:anime_tracker/core/design_system/widget/avatar_icon.dart';
import 'package:anime_tracker/core/design_system/widget/loading_indicator.dart';
import 'package:anime_tracker/core/design_system/widget/media_preview_item.dart';
import 'package:anime_tracker/feature/auth/auth_dialog.dart';
import 'package:anime_tracker/feature/common/page_loading_state.dart';
import 'package:anime_tracker/feature/discover/bloc/discover_bloc.dart';
import 'package:anime_tracker/feature/discover/bloc/discover_ui_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiscoverPage extends Page {
  const DiscoverPage({super.key});

  @override
  Route createRoute(BuildContext context) {
    return DiscoverPageRoute(settings: this);
  }
}

class DiscoverPageRoute extends PageRoute with MaterialRouteTransitionMixin {
  DiscoverPageRoute({super.settings}) : super(allowSnapshotting: false);

  @override
  Widget buildContent(BuildContext context) {
    return const Scaffold(
      body: DiscoverScreen(),
    );
  }

  @override
  bool get maintainState => true;
}

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverBloc, DiscoverUiState>(
      builder: (BuildContext context, state) {
        final map = state.categoryMediaMap;

        final currentSeasonState = map[MediaCategory.currentSeasonAnime]!;
        final nextSeasonState = map[MediaCategory.nextSeasonAnime]!;
        final trendingState = map[MediaCategory.trendingAnime]!;
        final movieState = map[MediaCategory.movieAnime]!;

        final userData = state.userData;
        final isLoggedIn = state.isLoggedIn;
        final isLoading = state.isLoading;
        return RefreshIndicator(
          onRefresh: () async {
            await context
                .read<DiscoverBloc>()
                .reloadAllMedia(mediaType: MediaType.anime, isRefresh: true);
          },
          child: CustomScrollView(
            cacheExtent: Config.defaultCatchExtend,
            slivers: [
              SliverAppBar(
                title: Text(AFLocalizations.of(context).discover),
                pinned: true,
                actions: [
                  LoadingIndicator(isLoading: isLoading),
                  IconButton(
                    onPressed: () {
                      AFRouterDelegate.of(context).navigateToSearch();
                    },
                    icon: const Icon(Icons.search_rounded),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: IconButton(
                      onPressed: () => showAuthDialog(context),
                      icon: isLoggedIn
                          ? buildAvatarIcon(context, userData!.avatar)
                          : const Icon(Icons.person_outline),
                    ),
                  )
                ],
              ),
              SliverToBoxAdapter(
                child: _buildAnimeCategoryPreview(
                  context,
                  MediaCategory.currentSeasonAnime,
                  currentSeasonState,
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 12),
              ),
              SliverToBoxAdapter(
                child: _buildAnimeCategoryPreview(
                  context,
                  MediaCategory.nextSeasonAnime,
                  nextSeasonState,
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 12),
              ),
              SliverToBoxAdapter(
                child: _buildAnimeCategoryPreview(
                  context,
                  MediaCategory.trendingAnime,
                  trendingState,
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 24),
              ),
              SliverToBoxAdapter(
                child: _buildAnimeCategoryPreview(
                  context,
                  MediaCategory.movieAnime,
                  movieState,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAnimeCategoryPreview(
    BuildContext context,
    MediaCategory category,
    PagingState state,
  ) {
    final animeModels = state.data;
    final isLoading = state is PageLoading;
    return _AnimeCategoryPreview(
      category: category,
      animeModels: animeModels,
      isLoading: isLoading,
      onMoreClick: () {
        AFRouterDelegate.of(context).navigateToAnimeList(category);
      },
      onAnimeClick: (id) {
        AFRouterDelegate.of(context).navigateToDetailAnime(id);
      },
    );
  }
}

class _AnimeCategoryPreview extends StatelessWidget {
  const _AnimeCategoryPreview(
      {required this.category,
      required this.animeModels,
      required this.isLoading,
      this.onMoreClick,
      this.onAnimeClick});

  final MediaCategory category;
  final bool isLoading;
  final List<MediaModel> animeModels;
  final VoidCallback? onMoreClick;
  final Function(String animeId)? onAnimeClick;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _buildTitleBar(context),
      const SizedBox(height: 4),
      Container(
        constraints: const BoxConstraints(maxHeight: 280),
        child: isLoading && animeModels.isEmpty
            ? _buildLoadingDummyWidget()
            : CustomScrollView(scrollDirection: Axis.horizontal, slivers: [
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  sliver: SliverList.builder(
                    itemCount: animeModels.length,
                    itemBuilder: (BuildContext context, int index) {
                      return MediaPreviewItem(
                        width: 160,
                        textStyle: Theme.of(context).textTheme.titleSmall,
                        model: animeModels[index],
                        onClick: () =>
                            onAnimeClick?.call(animeModels[index].id),
                      );
                    },
                  ),
                ),
              ]),
      ),
    ]);
  }

  Widget _buildTitleBar(BuildContext context) {
    String title;
    switch (category) {
      case MediaCategory.currentSeasonAnime:
        title = AFLocalizations.of(context).popularThisSeasonLabel;
      case MediaCategory.nextSeasonAnime:
        title = AFLocalizations.of(context).upComingNextSeasonLabel;
      case MediaCategory.trendingAnime:
        title = AFLocalizations.of(context).trendingNowLabel;
      case MediaCategory.movieAnime:
        title = AFLocalizations.of(context).movieLabel;
      case MediaCategory.trendingManga:
        title = AFLocalizations.of(context).movieLabel;
      // TODO: Handle this case.
      case MediaCategory.allTimePopularManga:
        title = AFLocalizations.of(context).movieLabel;
      // TODO: Handle this case.
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        const Expanded(flex: 1, child: SizedBox()),
        TextButton(onPressed: onMoreClick, child: const Text('More')),
      ]),
    );
  }

  Widget _buildLoadingDummyWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 0,
            color: Theme.of(context).colorScheme.surfaceVariant,
            clipBehavior: Clip.antiAlias,
            child: const SizedBox(width: 160, height: 280),
          );
        },
      ),
    );
  }
}

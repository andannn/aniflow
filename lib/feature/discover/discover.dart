import 'package:anime_tracker/core/data/model/page_loading_state.dart';
import 'package:anime_tracker/core/data/model/shortcut_anime_model.dart';
import 'package:anime_tracker/core/data/repository/ani_list_repository.dart';
import 'package:anime_tracker/core/designsystem/widget/anime_preview_item.dart';
import 'package:anime_tracker/feature/discover/bloc/discover_bloc.dart';
import 'package:anime_tracker/feature/discover/bloc/discover_ui_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app/local/anime_tracker_localizations.dart';
import '../auth/auth_dialog.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return const DiscoverScreen();
  }
}

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverBloc, DiscoverUiState>(
      builder: (BuildContext context, state) {
        final currentSeasonState = state.currentSeasonAnimePagingState;
        final nextSeasonState = state.nextSeasonAnimePagingState;
        final trendingState = state.trendingAnimePagingState;
        return CustomScrollView(slivers: [
          SliverAppBar(
            title: Text(AnimeTrackerLocalizations.of(context).discover),
            actions: [
              IconButton(
                  onPressed: () => showAuthDialog(context),
                  icon: const Icon(Icons.person_outline))
            ],
          ),
          SliverToBoxAdapter(
            child: _buildAnimeCategoryPreview(
                AnimeCategory.currentSeason, currentSeasonState),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 12),
          ),
          SliverToBoxAdapter(
            child: _buildAnimeCategoryPreview(
                AnimeCategory.nextSeason, nextSeasonState),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 12),
          ),
          SliverToBoxAdapter(
            child: _buildAnimeCategoryPreview(
                AnimeCategory.trending, trendingState),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 24),
          ),
        ]);
      },
    );
  }

  Widget _buildAnimeCategoryPreview(AnimeCategory category, PagingState state) {
    final animeModels = state.data;
    switch (state) {
      case PageReady():
        return _AnimeCategoryPreview(
          category: category,
          animeModels: animeModels,
          isLoading: false,
          onMoreClick: () {},
        );
      default:
        return _AnimeCategoryPreview(
            category: category, animeModels: animeModels, isLoading: true);
    }
  }
}

class _AnimeCategoryPreview extends StatelessWidget {
  const _AnimeCategoryPreview(
      {super.key,
      required this.category,
      required this.animeModels,
      required this.isLoading,
      this.onMoreClick,
      this.onAnimeClick});

  final AnimeCategory category;
  final bool isLoading;
  final List<ShortcutAnimeModel> animeModels;
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
                      return AnimePreviewItem(
                        width: 160,
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
      case AnimeCategory.currentSeason:
        title = AnimeTrackerLocalizations.of(context).popularThisSeasonLabel;
      case AnimeCategory.nextSeason:
        title = AnimeTrackerLocalizations.of(context).upComingNextSeasonLabel;
      case AnimeCategory.trending:
        title = AnimeTrackerLocalizations.of(context).trendingNowLabel;
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

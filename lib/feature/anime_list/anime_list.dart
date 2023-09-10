import 'package:anime_tracker/app/local/anime_tracker_localizations.dart';
import 'package:anime_tracker/core/data/logger/logger.dart';
import 'package:anime_tracker/core/data/model/shortcut_anime_model.dart';
import 'package:anime_tracker/core/data/repository/ani_list_repository.dart';
import 'package:anime_tracker/core/designsystem/widget/anime_preview_item.dart';
import 'package:anime_tracker/feature/anime_list/bloc/anime_list_bloc.dart';
import 'package:anime_tracker/feature/anime_list/bloc/anime_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../core/data/model/page_loading_state.dart';

class AnimeListPage extends StatefulWidget {
  const AnimeListPage({super.key, required this.category});

  final AnimeCategory category;

  @override
  State<AnimeListPage> createState() => _AnimeListPageState();
}

class _AnimeListPageState extends State<AnimeListPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AnimeListBloc(
        category: widget.category,
        aniListRepository: context.read<AniListRepository>(),
      ),
      child: const Scaffold(
        body: _AnimeListPageContent(),
      ),
    );
  }
}

class _AnimeListPageContent extends StatelessWidget {
  const _AnimeListPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimeListBloc, AnimeListState>(
        builder: (context, state) {
      final pagingState = state.animePagingState;
      final animeList = pagingState.data;
      final itemCount = pagingState.data.length;
      final isLoading = pagingState is PageLoading;
      final needDetectNewPageRequest = pagingState is PageReady;
      logger.d("needDetectNewPageRequest $needDetectNewPageRequest");
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
            sliver: const SliverToBoxAdapter(
              child: _RequestLoadingDetector(),
            ),
            replacementSliver: SliverToBoxAdapter(
              child: isLoading
                  ? const Align(
                      alignment: Alignment.center,
                      child: Wrap(
                        children: [
                          SizedBox.square(
                            dimension: 64,
                            child: CircularProgressIndicator(),
                          )
                        ],
                      ),
                    )
                  : const SizedBox(),
            ),
          ),
        ],
      );
    });
  }

  Widget _buildGridItems(BuildContext context, ShortcutAnimeModel model) {
    return AnimePreviewItem(
        model: model,
        textStyle: Theme.of(context).textTheme.labelMedium,
        onClick: () {});
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
}

class _RequestLoadingDetector extends StatelessWidget {
  const _RequestLoadingDetector({super.key});

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

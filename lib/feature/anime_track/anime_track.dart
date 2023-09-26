import 'package:anime_tracker/app/navigation/ani_flow_router.dart';
import 'package:anime_tracker/core/common/global_static_constants.dart';
import 'package:anime_tracker/core/data/model/anime_list_item_model.dart';
import 'package:anime_tracker/core/design_system/widget/af_toogle_button.dart';
import 'package:anime_tracker/core/design_system/widget/anime_track_item.dart';
import 'package:anime_tracker/feature/anime_track/bloc/track_bloc.dart';
import 'package:anime_tracker/feature/anime_track/bloc/track_ui_state.dart';
import 'package:anime_tracker/feature/anime_track/bloc/user_anime_list_load_state.dart';
import 'package:flutter/material.dart';
import 'package:anime_tracker/core/design_system/animetion/page_transaction_animetion.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AnimeTrackPage extends Page {
  const AnimeTrackPage({super.key});

  @override
  Route createRoute(BuildContext context) {
    return AnimeTrackRoute(settings: this);
  }
}

class AnimeTrackRoute extends PageRoute with MaterialRouteTransitionMixin {
  AnimeTrackRoute({super.settings});

  @override
  Widget buildContent(BuildContext context) {
    return const Scaffold(
      body: _AnimeTrackPageContent(),
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
  bool get maintainState => true;
}

class _AnimeTrackPageContent extends StatelessWidget {
  const _AnimeTrackPageContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrackBloc, TrackUiState>(builder: (context, state) {
      // final isLoading = state.isLoading;

      return RefreshIndicator(
        onRefresh: () async {
          return context.read<TrackBloc>().syncUserAnimeList();
        },
        child: CustomScrollView(
          slivers: [
            _buildAppBar(context, state),
            ..._buildTrackSectionContents(context, state),
          ],
        ),
      );
    });
  }

  List<Widget> _buildTrackSectionContents(
      BuildContext context, TrackUiState state) {
    final animeLoadState = state.animeLoadState;
    if (animeLoadState is UserAnimeNoUser) {
      return [
        _buildNoUserHint(),
      ];
    } else if (animeLoadState is UserAnimeInitState) {
      return [
        _buildInitialDummyView(),
      ];
    } else {
      final animeList = (animeLoadState as UserAnimeLoaded).watchingAnimeList;
      final showReleasedOnly = state.showReleasedOnly;
      return [
        SliverToBoxAdapter(
          child: _buildFilterBarSection(context, showReleasedOnly),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => _buildAnimeListItem(context, animeList[index]),
            childCount: animeList.length,
          ),
        )
      ];
    }
  }

  Widget? _buildAnimeListItem(BuildContext context, AnimeListItemModel item) {
    return SizedBox(
      key: ValueKey('anime_track_list_item_${item.id}'),
      height: 120,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
        child: AnimeTrackItem(
          model: item,
          onMarkWatchedClick: () {
            // mark watch
          },
          onClick: () {
            AnimeTrackerRouterDelegate.of(context).navigateToDetailAnime(
              item.animeModel!.id,
            );
          },
        ),
      ),
    );
  }

  Widget _buildFilterBarSection(BuildContext context, bool showReleasedOnly) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(width: 12),
        AniFlowToggleButton(
          label: 'Released only',
          selected: showReleasedOnly,
          onClick: () {
            context.read<TrackBloc>().add(OnToggleShowFollowOnly());
          },
        ),
      ],
    );
  }

  Widget _buildAppBar(BuildContext context, TrackUiState state) => SliverAppBar(
        title: const Text('Track'),
        actions: [
          AnimatedOpacity(
            opacity: state.isLoading ? 1.0 : 0.0,
            duration: Config.defaultAnimationDuration,
            child: LoadingAnimationWidget.fourRotatingDots(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              size: 33.0,
            ),
          ),
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              icon: const Icon(Icons.schedule_rounded),
              onPressed: () {},
            ),
          ),
        ],
        pinned: true,
        automaticallyImplyLeading: false,
      );

  Widget _buildNoUserHint() {
    return const SliverToBoxAdapter(
      child: Center(
        child: Text('No user'),
      ),
    );
  }

  Widget _buildInitialDummyView() {
    return const SliverToBoxAdapter(
      child: Center(
        child: Text('Dummy'),
      ),
    );
  }
}

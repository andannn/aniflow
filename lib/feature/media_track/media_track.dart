import 'package:aniflow/app/nested_router/ani_flow_router_delegate.dart';
import 'package:aniflow/core/common/model/media_type.dart';
import 'package:aniflow/core/common/model/setting/user_title_language.dart';
import 'package:aniflow/core/data/model/anime_list_item_model.dart';
import 'package:aniflow/core/design_system/widget/af_toogle_button.dart';
import 'package:aniflow/core/design_system/widget/loading_indicator.dart';
import 'package:aniflow/core/design_system/widget/media_list_item.dart';
import 'package:aniflow/core/design_system/widget/update_media_list_bottom_sheet.dart';
import 'package:aniflow/feature/auth/bloc/auth_bloc.dart';
import 'package:aniflow/feature/media_track/bloc/track_bloc.dart';
import 'package:aniflow/feature/media_track/bloc/track_ui_state.dart';
import 'package:aniflow/feature/media_track/bloc/user_anime_list_load_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimeTrackPage extends Page {
  const AnimeTrackPage({super.key});

  @override
  Route createRoute(BuildContext context) {
    return AnimeTrackRoute(settings: this);
  }
}

class AnimeTrackRoute extends PageRoute with MaterialRouteTransitionMixin {
  AnimeTrackRoute({super.settings}) : super(allowSnapshotting: false);

  @override
  Widget buildContent(BuildContext context) {
    return const Scaffold(
      body: _AnimeTrackPageContent(),
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
      return Scaffold(
        appBar: _buildAppBar(context, state),
        body: RefreshIndicator(
          onRefresh: () async {
            return context.read<TrackBloc>().syncUserAnimeList();
          },
          child: CustomScrollView(
            slivers: [
              ..._buildTrackSectionContents(context, state),
            ],
          ),
        ),
      );
    });
  }

  List<Widget> _buildTrackSectionContents(
      BuildContext context, TrackUiState state) {
    final animeLoadState = state.animeLoadState;
    if (animeLoadState is MediaStateNoUser) {
      return [
        _buildNoUserHint(context),
      ];
    } else if (animeLoadState is MediaStateInitState) {
      return [];
    } else {
      final animeList = (animeLoadState as MediaStateLoaded).followingMediaList;

      if (animeList.isEmpty) {
        return [
          SliverFillRemaining(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(26.0),
                child: Text(
                  'No tracked Anime or Manga',
                  style: Theme.of(context).textTheme.headlineSmall,
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ];
      }

      final showReleasedOnly = state.showReleasedOnly;

      final isAnime = state.currentMediaType == MediaType.anime;
      return [
        SliverVisibility(
          visible: isAnime,
          sliver: SliverToBoxAdapter(
            child: _buildFilterBarSection(context, showReleasedOnly),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => _buildMediaListItem(context, animeList[index]),
            childCount: animeList.length,
          ),
        )
      ];
    }
  }

  Widget? _buildMediaListItem(BuildContext context, MediaListItemModel item) {
    final language =
        context.read<TrackBloc>().state.settings?.userTitleLanguage ??
            UserTitleLanguage.native;
    return Padding(
      key: ValueKey('anime_track_list_item_${item.id}'),
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
      child: MediaListItem(
        model: item,
        language: language,
        onMarkWatchedClick: () {
          context.read<TrackBloc>().add(OnAnimeMarkWatched(
              animeId: item.animeModel!.id,
              progress: item.progress! + 1,
              totalEpisode: item.animeModel!.episodes));
          // mark watch
        },
        onLongPress: () async {
          final bloc = context.read<TrackBloc>();
          final result = await showUpdateMediaListBottomSheet(
            context,
            listItemModel: item,
            media: item.animeModel!,
          );

          if (result != null) {
            bloc.add(
              OnMediaListModified(result: result, mediaId: item.animeModel!.id),
            );
          }
        },
        onClick: () {
          AFRouterDelegate.of(context).navigateToDetailMedia(
            item.animeModel!.id,
          );
        },
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

  PreferredSizeWidget _buildAppBar(BuildContext context, TrackUiState state) {
    final isAnime = state.currentMediaType == MediaType.anime;
    final isLoading = state.isLoading;
    return AppBar(
      title: const Text('Track'),
      actions: [
        LoadingIndicator(isLoading: isLoading),
        const SizedBox(width: 10),
        isAnime
            ? Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: IconButton(
                  icon: const Icon(Icons.calendar_month_rounded),
                  onPressed: () {
                    AFRouterDelegate.of(context).navigateToAiringSchedule();
                  },
                ),
              )
            : const SizedBox(),
      ],
      automaticallyImplyLeading: false,
    );
  }

  Widget _buildNoUserHint(BuildContext context) {
    return SliverFillRemaining(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Track your favorite anime or manga',
              style: Theme.of(context).textTheme.headlineSmall,
              softWrap: true,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            FilledButton.tonal(
              onPressed: () {
                context.read<AuthBloc>().add(OnLoginButtonTapped());
              },
              child: const Text('Join now'),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:aniflow/app/routing/root_router_delegate.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/setting/user_title_language.dart';
import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/core/data/model/anime_list_item_model.dart';
import 'package:aniflow/core/data/model/sorted_group_media_list_model.dart';
import 'package:aniflow/core/design_system/widget/af_toggle_button.dart';
import 'package:aniflow/core/design_system/widget/loading_indicator.dart';
import 'package:aniflow/core/design_system/widget/media_list_item.dart';
import 'package:aniflow/feature/aniflow_home/auth/bloc/auth_bloc.dart';
import 'package:aniflow/feature/aniflow_home/media_track/bloc/track_bloc.dart';
import 'package:aniflow/feature/aniflow_home/media_track/bloc/track_ui_state.dart';
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
      body: _MediaTrackPageContent(),
    );
  }

  @override
  bool get maintainState => true;
}

class _MediaTrackPageContent extends StatefulWidget {
  const _MediaTrackPageContent();

  @override
  State<_MediaTrackPageContent> createState() => _MediaTrackPageContentState();
}

class _MediaTrackPageContentState extends State<_MediaTrackPageContent> {
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
    final userData = state.userData;
    final sortedList = state.sortedGroupMediaListModel;
    if (userData == null) {
      return [
        _buildNoUserHint(context),
      ];
    } else if (sortedList == null) {
      return [];
    } else {
      if (sortedList.isEmpty == true) {
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
      final newUpdateList = sortedList.newUpdateList;
      final otherList = sortedList.otherList;
      return [
        SliverVisibility(
          visible: isAnime,
          sliver: SliverToBoxAdapter(
            child: _buildFilterBarSection(context, showReleasedOnly),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) =>
                _buildMediaListItem(context, newUpdateList[index], true),
            childCount: newUpdateList.length,
          ),
        ),
        SliverToBoxAdapter(
          child: (newUpdateList.isNotEmpty && otherList.isNotEmpty)
              ? const Divider()
              : const SizedBox(),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) =>
                _buildMediaListItem(context, otherList[index], false),
            childCount: otherList.length,
          ),
        ),
      ];
    }
  }

  Widget? _buildMediaListItem(
      BuildContext context, MediaListItemModel item, bool showNewBadge) {
    final language =
        context.read<TrackBloc>().state.settings?.userTitleLanguage ??
            UserTitleLanguage.native;

    return Padding(
      key: ValueKey('anime_track_list_item_${item.id}'),
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
      child: MediaListItem(
        model: item,
        language: language,
        showNewBadge: showNewBadge,
        onMarkWatchedClick: () {
          context.read<TrackBloc>().add(OnAnimeMarkWatched(
              animeId: item.animeModel!.id,
              progress: item.progress! + 1,
              totalEpisode: item.animeModel!.episodes));
        },
        onClick: () {
          RootRouterDelegate.get().navigateToDetailMedia(item.animeModel!.id);
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
      title: Text(context.appLocal.track),
      actions: [
        LoadingIndicator(isLoading: isLoading),
        const SizedBox(width: 10),
        isAnime
            ? Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: IconButton(
                  icon: const Icon(Icons.calendar_month_rounded),
                  onPressed: () {
                    RootRouterDelegate.get().navigateToAiringSchedule();
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
              context.appLocal.welcomHint,
              style: Theme.of(context).textTheme.headlineSmall,
              softWrap: true,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            FilledButton.tonal(
              onPressed: () {
                context.read<AuthBloc>().add(OnLoginButtonTapped());
              },
              child: Text(context.appLocal.joinNow),
            )
          ],
        ),
      ),
    );
  }
}

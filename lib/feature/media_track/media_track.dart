import 'package:aniflow/app/di/get_it_scope.dart';
import 'package:aniflow/app/routing/root_router_delegate.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/definitions/track_list_filter.dart';
import 'package:aniflow/core/common/util/bloc_util.dart';
import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/core/data/model/media_with_list_model.dart';
import 'package:aniflow/core/data/model/sorted_group_media_list_model.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/core/design_system/widget/loading_indicator.dart';
import 'package:aniflow/core/design_system/widget/media_list_item.dart';
import 'package:aniflow/feature/auth/bloc/auth_bloc.dart';
import 'package:aniflow/feature/media_list_update_page/media_list_modify_result.dart';
import 'package:aniflow/feature/media_list_update_page/media_list_update_page.dart';
import 'package:aniflow/feature/media_track/bloc/track_bloc.dart';
import 'package:aniflow/feature/media_track/bloc/track_ui_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimeTrackPage extends Page {
  const AnimeTrackPage({super.key});

  @override
  Route createRoute(BuildContext context) {
    return MediaTrackRoute(settings: this);
  }
}

class MediaTrackRoute extends PageRoute with MaterialRouteTransitionMixin {
  MediaTrackRoute({super.settings}) : super(allowSnapshotting: false);

  @override
  Widget buildContent(BuildContext context) {
    return const MediaTrackPageContent();
  }

  @override
  bool get maintainState => true;
}

class MediaTrackPageContent extends StatelessWidget {
  const MediaTrackPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TrackBloc>(
      create: (BuildContext context) => GetItScope.of(context).get<TrackBloc>(),
      child: const _MediaTrackPageContent(),
    );
  }
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
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              _buildAppBar(
                context,
                state: state,
                onSelectionChanged: (filter) {
                  context
                      .read<TrackBloc>()
                      .add(OnSelectTrackListFilter(filter));
                },
              ),
            ];
          },
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

      final newUpdateList = sortedList.newUpdateList;
      final otherList = sortedList.otherList;
      return [
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
      BuildContext context, MediaWithListModel item, bool showNewBadge) {
    final language =
        GetItScope.of(context).get<UserDataRepository>().userTitleLanguage;
    const identifier = 'track_tab';
    return Padding(
      key: ValueKey('anime_track_list_item_$item'),
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
      child: Hero(
        tag: mediaListUpdatePageHeroTagBuilder(item.mediaModel.id, identifier),
        child: MediaListItem(
          model: item,
          language: language,
          showNewBadge: showNewBadge,
          onMarkWatchedClick: () {
            context.read<TrackBloc>().add(
                  OnAnimeMarkWatched(
                    animeId: item.mediaModel.id,
                    progress: item.mediaListModel!.progress! + 1,
                    totalEpisode: item.mediaModel.episodes,
                  ),
                );
          },
          onClick: () {
            RootRouterDelegate.get().navigateToDetailMedia(item.mediaModel.id);
          },
          onLongPress: () async {
            final bloc = context.read<TrackBloc>();
            RootRouterDelegate.get()
                .navigateToMediaListUpdatePage(item.mediaModel.id, identifier);
            MediaListModifyResult? result =
                await RootRouterDelegate.get().awaitPageResult();
            if (result != null) {
              bloc.safeAdd(OnItemMediaListModified(
                  result: result, mediaId: item.mediaModel.id));
            }
          },
        ),
      ),
    );
  }

  SliverAppBar _buildAppBar(BuildContext context,
      {required TrackUiState state,
      required void Function(TrackListFilter) onSelectionChanged}) {
    final isAnime = state.currentMediaType == MediaType.anime;
    final isLoading = state.isLoading;
    return SliverAppBar(
      pinned: true,
      snap: true,
      floating: true,
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
      bottom: isAnime
          ? PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: _buildFilterSelection(
                context,
                filter: state.trackListFilter,
                onSelectionChanged: onSelectionChanged,
              ),
            )
          : const PreferredSize(
              preferredSize: Size.fromHeight(0),
              child: SizedBox(),
            ),
    );
  }

  Widget _buildFilterSelection(BuildContext context,
      {required TrackListFilter filter,
      required void Function(TrackListFilter) onSelectionChanged}) {
    ButtonSegment<TrackListFilter> buildSegment(
        {required TrackListFilter value, required String label}) {
      return ButtonSegment(
        value: value,
        label: Text(
          label,
          maxLines: 1,
          textAlign: TextAlign.center,
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SegmentedButton<TrackListFilter>(
        segments: [
          buildSegment(
            value: TrackListFilter.all,
            label: context.appLocal.all,
          ),
          buildSegment(
            value: TrackListFilter.hasNext,
            label: context.appLocal.hasNextEpisode,
          ),
          buildSegment(
            value: TrackListFilter.newAired,
            label: context.appLocal.newAired,
          ),
        ],
        selected: {filter},
        showSelectedIcon: false,
        style: const ButtonStyle(visualDensity: VisualDensity(vertical: -1)),
        onSelectionChanged: (newSelection) {
          onSelectionChanged(newSelection.first);
        },
      ),
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

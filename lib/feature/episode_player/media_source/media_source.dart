import 'package:aniflow/core/data/playable_source_repository.dart';
import 'package:aniflow/core/design_system/widget/af_html_widget.dart';
import 'package:aniflow/core/design_system/widget/af_network_image.dart';
import 'package:aniflow/feature/episode_player/player/player_area_bloc.dart';
import 'package:aniflow/feature/episode_player/util/media_source_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MediaSourceBox extends StatelessWidget {
  const MediaSourceBox({
    super.key,
    required this.currentMediaSource,
    required this.onSelectMediaSource,
    required this.playerState,
    required this.onSelectMatchedEpisode,
    required this.onGetSheetHeight,
    required this.onRetryClick,
  });

  final MediaSource currentMediaSource;
  final Function(MediaSource) onSelectMediaSource;
  final Function(MatchedEpisode) onSelectMatchedEpisode;
  final double Function() onGetSheetHeight;
  final PlayerState playerState;
  final VoidCallback onRetryClick;

  @override
  Widget build(BuildContext context) {
    final showRetryButton =
        playerState is LoadResourceError || playerState is SearchError;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                "Media source: ${currentMediaSource.nameString}",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(width: 12),
              FilledButton.tonal(
                onPressed: () async {
                  final res = await _showMediaSourceSelectBottomSheet(
                    context,
                    currentMediaSource,
                    onGetSheetHeight(),
                  );
                  if (res != null && res != currentMediaSource) {
                    onSelectMediaSource(res);
                  }
                },
                child: const Row(
                  children: [
                    Icon(Icons.cached_sharp),
                    SizedBox(width: 8),
                    Text("Change"),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            child: Card.filled(
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () {
                  _onShowMatchedEpisodes(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox.square(
                        dimension: 48,
                        child: AFNetworkImage(
                          imageUrl: currentMediaSource.iconUrl ?? "",
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildSearchState(context, playerState),
                            _buildMatchingSource(context, playerState),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      if (showRetryButton)
                        TextButton(
                            onPressed: onRetryClick, child: const Text("Retry"))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchState(BuildContext context, PlayerState playerState) {
    String state() => switch (playerState) {
          Searching() => "Searching",
          LoadingPlayResource() => "Loading resource",
          PlayingResource() => "Playing",
          SearchError() => "No Content",
          LoadResourceError() => "Can not Load resource",
          EpisodeLoaded() => throw Exception("Never reach here"),
        };

    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return AutoSizeText(
      state(),
      style: textTheme.labelSmall?.copyWith(color: colorScheme.primary),
    );
  }

  Widget _buildMatchingSource(BuildContext context, PlayerState playerState) {
    String state() => switch (playerState) {
          Searching() => "--",
          SearchError() => "--",
          EpisodeLoaded() =>
            "${playerState.currentEpisode.subjectTitle} - ${playerState.currentEpisode.episodeTitle}",
        };
    String? url() => switch (playerState) {
          EpisodeLoaded() => playerState.currentEpisode.episodeUrl,
          Searching() => null,
          SearchError() => null,
        };

    final urlLink = url();

    return urlLink != null
        ? AfHtmlWidget(html: '<a href="$urlLink">${state()}</a>')
        : AutoSizeText(
            state(),
          );
  }

  Future _onShowMatchedEpisodes(BuildContext context) async {
    MatchedEpisode? current;
    List<MatchedEpisode> episodeList = [];

    final state = playerState;
    if (state is EpisodeLoaded) {
      episodeList = state.matchedList;
      current = state.currentEpisode;
    }

    if (episodeList.isEmpty || current == null) {
      return;
    }

    final selected = await _showMatchedEpisodeSelectBottomSheet(
      context,
      current,
      episodeList,
      onGetSheetHeight(),
    );
    if (selected != null && selected != current) {
      onSelectMatchedEpisode(selected);
    }
  }
}

Future<MediaSource?> _showMediaSourceSelectBottomSheet(
    BuildContext context, MediaSource current,
    [double? sheetHeight]) async {
  Widget itemBuilder(BuildContext context, MediaSource mediaSource) {
    final isSelected = mediaSource == current;
    return ListTile(
      onTap: () {
        Navigator.pop(context, mediaSource);
      },
      title: Text(mediaSource.nameString),
      selectedTileColor: Theme.of(context).colorScheme.primaryContainer,
      selected: isSelected,
    );
  }

  final selected = await _showCustomModalBottomSheet<MediaSource>(context,
      items: MediaSource.values,
      itemBuilder: itemBuilder,
      title: 'Media Source',
      sheetHeight: sheetHeight);

  return selected;
}

Future<MatchedEpisode?> _showMatchedEpisodeSelectBottomSheet(
    BuildContext context,
    MatchedEpisode selected,
    List<MatchedEpisode> matchedList,
    [double? sheetHeight]) async {
  Widget itemBuilder(BuildContext context, MatchedEpisode ep) {
    final isSelected = ep == selected;
    return ListTile(
      onTap: () {
        Navigator.pop(context, ep);
      },
      title: Text(
        "${ep.subjectTitle} - ${ep.episodeTitle}",
      ),
      selectedTileColor: Theme.of(context).colorScheme.primaryContainer,
      selected: isSelected,
    );
  }

  final selectedEpisode = await _showCustomModalBottomSheet<MatchedEpisode>(
      context,
      items: matchedList,
      itemBuilder: itemBuilder,
      title: 'All Matched Episode',
      sheetHeight: sheetHeight);

  return selectedEpisode;
}

Future<T?> _showCustomModalBottomSheet<T>(BuildContext context,
    {required String title,
    required List<T> items,
    required Widget? Function(BuildContext context, T item) itemBuilder,
    double? sheetHeight}) async {
  final ret = await showModalBottomSheet<T>(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return SizedBox(
        height: sheetHeight,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            SliverList.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return itemBuilder(context, items[index]);
              },
            ),
          ],
        ),
      );
    },
  );

  return ret;
}

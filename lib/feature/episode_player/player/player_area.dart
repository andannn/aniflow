import 'package:aniflow/app/di/get_it_scope.dart';
import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/core/data/playable_source_repository.dart';
import 'package:aniflow/feature/episode_player/player/player_area_bloc.dart';
import 'package:aniflow/feature/episode_player/player/player_area_state.dart';
import 'package:aniflow/feature/episode_player/player/widget/playable_source_fetcher.dart';
import 'package:aniflow/feature/episode_player/player/widget/web_media_content_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlayerAreaBlocProvider extends StatelessWidget {
  const PlayerAreaBlocProvider(
      {super.key,
      required this.mediaId,
      required this.episodeNum,
      required this.source,
      required this.content});

  final String mediaId;
  final int episodeNum;
  final MediaSource source;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          GetItScope.of(context).get<PlayerAreaBloc>(
        param1: PlayerAreaParam(
          mediaId: mediaId,
          episodeNum: episodeNum,
          source: source,
        ),
      ),
      child: content,
    );
  }
}

class PlayerArea extends StatelessWidget {
  const PlayerArea({
    super.key,
    required this.onRequestToggleFullScreen,
  });

  final VoidCallback onRequestToggleFullScreen;

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final isFullScreen = orientation == Orientation.landscape;
    return BlocBuilder<PlayerAreaBloc, PlayerAreaState>(
      builder: (context, state) {
        final searchState = state.searchState;
        if (searchState == null) {
          return const Center(child: CircularProgressIndicator());
        }

        Widget hint(String text) => Center(
              child: Card.filled(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(text),
                ),
              ),
            );

        switch (searchState) {
          case Searching():
            return hint("Searching ${searchState.source.name} ...");
          case LoadingPlayResource(
              source: final source,
            ):
            return Stack(
              children: [
                PlayableSourceFetcher(
                  key: ValueKey(searchState.currentEpisode.episodeUrl),
                  webPageUri: searchState.currentEpisode.episodeUrl,
                  source: source,
                  onUrlFetched: (url) {
                    context.read<PlayerAreaBloc>().add(
                          OnPlayableResourceLoaded(url, searchState.currentEpisode),
                        );
                  },
                  onTimeOut: () {
                    context.read<PlayerAreaBloc>().add(OnFetchResourceError(
                        Exception(
                            "Load resource timeout. url: ${searchState.currentEpisode.episodeUrl}")));
                  },
                ),
                hint(
                    "Loading Playable Resource from ${searchState.source.name} ..."),
              ],
            );
          case PlayingResource():
            return PlayerWithControlPanel(
              title:
                  "${context.read<PlayerAreaBloc>().param.episodeNum} ${context.appLocal.episodes}",
              url: searchState.url,
              state: searchState.playerState,
              isFullScreen: isFullScreen,
              controller:
                  context.read<PlayerAreaBloc>().currentPlayerController!,
              onRequestToggleFullscreen: onRequestToggleFullScreen,
              onTogglePlay: () {
                context.read<PlayerAreaBloc>().add(OnTogglePlayState());
              },
              onSeekToPositionMs: (positionMs) {
                context
                    .read<PlayerAreaBloc>()
                    .add(OnSeekToPositionMs(positionMs));
              },
            );
          case SearchError():
            return hint("${searchState.exception}");
          case LoadResourceError():
            return hint("${searchState.exception}");
          case EpisodeLoaded():
            throw Exception("Never reach here");
        }
      },
    );
  }
}

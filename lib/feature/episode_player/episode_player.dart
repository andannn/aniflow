import 'package:aniflow/app/di/get_it_scope.dart';
import 'package:aniflow/core/common/message/snack_bar_message_mixin.dart';
import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/media_title_model.dart';
import 'package:aniflow/core/data/playable_source_repository.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/feature/episode_player/episode_player_bloc.dart';
import 'package:aniflow/feature/episode_player/episode_player_state.dart';
import 'package:aniflow/feature/episode_player/media_source/media_source.dart';
import 'package:aniflow/feature/episode_player/player/player_area.dart';
import 'package:aniflow/feature/episode_player/player/player_area_bloc.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EpisodePlayerPage extends Page {
  final String mediaId;
  final int episodeNum;

  const EpisodePlayerPage(
      {required this.mediaId,
      required this.episodeNum,
      super.key,
      super.onPopInvoked});

  @override
  Route createRoute(BuildContext context) {
    return EpisodePlayerRoute(
        settings: this, episodeNum: episodeNum, mediaId: mediaId);
  }
}

class EpisodePlayerRoute extends PageRoute with MaterialRouteTransitionMixin {
  EpisodePlayerRoute({
    super.settings,
    required this.mediaId,
    required this.episodeNum,
  }) : super(allowSnapshotting: false);

  final String mediaId;
  final int episodeNum;

  @override
  Widget buildContent(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          GetItScope.of(context).get<EpisodePlayerBloc>(
        param1: EpisodePlayerReq(
          mediaId: mediaId,
          episodeNum: episodeNum,
        ),
      ),
      child: const ScaffoldMessenger(
        child: _EpisodePlayerContent(),
      ),
    );
  }

  @override
  bool get maintainState => false;
}

class _EpisodePlayerContent extends StatefulWidget {
  const _EpisodePlayerContent();

  @override
  State<_EpisodePlayerContent> createState() => _EpisodePlayerContentState();
}

class _EpisodePlayerContentState extends State<_EpisodePlayerContent>
    with ShowSnackBarMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EpisodePlayerBloc, EpisodePlayerState>(
      builder: (context, state) {
        final req = context.read<EpisodePlayerBloc>().param;
        final orientation = MediaQuery.of(context).orientation;

        void onFullScreenButtonClick() async {
          if (orientation == Orientation.landscape) {
            await _setScreenOrientation(Orientation.portrait);
          } else {
            await _setScreenOrientation(Orientation.landscape);
          }
        }

        // Side effect for set ui mode and status bar color.
        if (orientation == Orientation.landscape) {
          SystemChrome.setEnabledSystemUIMode(
            SystemUiMode.immersiveSticky,
            overlays: [],
          );
        } else {
          SystemChrome.setSystemUIOverlayStyle(
            const SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.light,
            ),
          );
          SystemChrome.setEnabledSystemUIMode(
            SystemUiMode.edgeToEdge,
            overlays: SystemUiOverlay.values,
          );
        }

        final mediaTitle = state.mediaModel?.title!.getTitle(
                GetItScope.of(context)
                    .get<UserDataRepository>()
                    .userTitleLanguage) ??
            "";
        final selectedEpisodeNumber = state.selectedEpisodeNumber;
        final selectedMediaSource = state.selectedMediaSource;
        final progress = state.progress;
        final nextAiringEpisode = state.nextAiringEpisode;

        if (selectedMediaSource == null) {
          return const SizedBox();
        }

        final appBarTitle =
            "$mediaTitle - $selectedEpisodeNumber${context.appLocal.episodes}";
        return PlayerAreaBlocProvider(
          key: ValueKey(
              "player_${req.mediaId}_${selectedEpisodeNumber}_${selectedMediaSource}_key"),
          mediaId: req.mediaId,
          episodeNum: selectedEpisodeNumber,
          source: selectedMediaSource,
          content: orientation == Orientation.portrait
              ? Scaffold(
                  appBar: AppBar(title: AutoSizeText(appBarTitle, maxLines: 2)),
                  body: Column(
                    children: [
                      Container(
                        color: Colors.black,
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Center(
                            child: PlayerArea(
                              onRequestToggleFullScreen:
                                  onFullScreenButtonClick,
                            ),
                          ),
                        ),
                      ),
                      if (state.mediaModel != null)
                        Expanded(
                          child: ControlArea(
                            model: state.mediaModel!,
                            watchingProgress: progress,
                            nextAiringEpisode: nextAiringEpisode,
                            playingEpisode: selectedEpisodeNumber,
                            currentMediaSource: selectedMediaSource,
                          ),
                        )
                    ],
                  ),
                )
              : Scaffold(
                  body: Container(
                    color: Colors.black,
                    child: Center(
                      child: PlayerArea(
                        onRequestToggleFullScreen: onFullScreenButtonClick,
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
      overlays: SystemUiOverlay.values,
    );
    _setScreenOrientation(Orientation.portrait);
    super.dispose();
  }

  Future<void> _setScreenOrientation(Orientation request) async {
    if (request == Orientation.landscape) {
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    } else {
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    }
  }
}

class ControlArea extends StatelessWidget {
  const ControlArea({
    super.key,
    required this.model,
    required this.playingEpisode,
    required this.currentMediaSource,
    this.watchingProgress,
    this.nextAiringEpisode,
  });

  final MediaModel model;
  final int? watchingProgress;
  final int? nextAiringEpisode;
  final int playingEpisode;
  final MediaSource currentMediaSource;

  @override
  Widget build(BuildContext context) {
    final GlobalKey controlAreaKey = GlobalKey();
    final playerState = context.watch<PlayerAreaBloc>().state.searchState;
    return CustomScrollView(
      key: controlAreaKey,
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  "Now Playing: $playingEpisode${context.appLocal.episodes}",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(width: 8),
                FilledButton.tonal(
                  onPressed: () {
                    context.read<EpisodePlayerBloc>().add(
                          OnMarkWatchedClick(),
                        );
                  },
                  child: const Text("Mark Watched"),
                )
              ],
            ),
          ),
        ),
        SliverGrid.builder(
          itemCount: model.episodes,
          itemBuilder: (BuildContext context, int index) {
            final episode = index + 1;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: EpisodeNode(
                number: episode,
                watched:
                    watchingProgress != null && watchingProgress! >= episode,
                playing: episode == playingEpisode,
                enabled: nextAiringEpisode == null ||
                    (nextAiringEpisode != null && nextAiringEpisode! > episode),
                onItemPressed: () {
                  if (episode != playingEpisode) {
                    context.read<EpisodePlayerBloc>().add(
                          OnSelectEpisodeNumber(episode),
                        );
                  }
                },
              ),
            );
          },
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 64,
          ),
        ),
        if (playerState != null)
          SliverToBoxAdapter(
            child: MediaSourceBox(
                playerState: playerState,
                currentMediaSource: currentMediaSource,
                onSelectMatchedEpisode: (selected) {
                  context.read<PlayerAreaBloc>().add(
                        OnChangeMatchedEpisode(selected),
                      );
                },
                onSelectMediaSource: (selected) {
                  context.read<EpisodePlayerBloc>().add(
                        OnSelectMediaSource(selected),
                      );
                },
                onGetSheetHeight: () {
                  return controlAreaKey.currentContext?.size?.height ?? 0;
                }),
          )
      ],
    );
  }
}

class EpisodeNode extends StatelessWidget {
  const EpisodeNode(
      {super.key,
      required this.number,
      required this.playing,
      required this.onItemPressed,
      required this.watched,
      required this.enabled});

  final int number;
  final bool playing;
  final bool watched;
  final bool enabled;
  final VoidCallback onItemPressed;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: enabled ? 1 : 0.5,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Card.outlined(
            color: watched ? Theme.of(context).colorScheme.primary : null,
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              enableFeedback: enabled,
              onTap: () {
                if (enabled) {
                  onItemPressed();
                }
              },
              child: Center(
                child: Text(
                  number.toString(),
                  style: TextStyle(
                    color: watched
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
            ),
          ),
          if (playing)
            Positioned(
              bottom: -8,
              right: -8,
              child: Icon(
                Icons.play_circle_fill_rounded,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
        ],
      ),
    );
  }
}

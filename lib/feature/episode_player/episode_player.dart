import 'package:aniflow/app/di/get_it_scope.dart';
import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/media_title_model.dart';
import 'package:aniflow/core/data/playable_source_repository.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/feature/detail_media/build_media_basic_info.dart';
import 'package:aniflow/feature/episode_player/episode_player_bloc.dart';
import 'package:aniflow/feature/episode_player/episode_player_state.dart';
import 'package:aniflow/feature/episode_player/player/player_area.dart';
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
      child: const _EpisodePlayerContent(),
    );
  }

  @override
  bool get maintainState => false;
}

class _EpisodePlayerContent extends StatefulWidget {
  const _EpisodePlayerContent({super.key});

  @override
  State<_EpisodePlayerContent> createState() => _EpisodePlayerContentState();
}

class _EpisodePlayerContentState extends State<_EpisodePlayerContent> {
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

        if (selectedMediaSource == null) {
          return const SizedBox();
        }

        final appBarTitle =
            "$mediaTitle - ${selectedEpisodeNumber}${context.appLocal.episodes}";
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
                          child: _BasicInfo(
                            model: state.mediaModel!,
                            selected: selectedEpisodeNumber,
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

class _BasicInfo extends StatelessWidget {
  const _BasicInfo({
    super.key,
    required this.model,
    required this.selected,
  });

  final MediaModel model;
  final int selected;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  "Now Playing: $selected${context.appLocal.episodes}",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(width: 8),
                FilledButton.tonal(
                  onPressed: () {

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
                playing: episode == selected,
                onItemPressed: () {
                  if (episode != selected) {
                    context.read<EpisodePlayerBloc>().add(
                          OnSelectEpisode(episode),
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
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Play source",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
      ],
    );
  }
}

class EpisodeNode extends StatelessWidget {
  const EpisodeNode(
      {super.key,
      required this.number,
      required this.playing,
      required this.onItemPressed});

  final int number;
  final bool playing;
  final VoidCallback onItemPressed;

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      color: playing ? Theme.of(context).colorScheme.primary : null,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onItemPressed,
        child: Center(
          child: Text(
            number.toString(),
            style: TextStyle(
              color: playing
                  ? Colors.white
                  : Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}

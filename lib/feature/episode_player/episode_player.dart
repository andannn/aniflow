import 'package:aniflow/app/di/get_it_scope.dart';
import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/media_title_model.dart';
import 'package:aniflow/core/data/playable_source_repository.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
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
        final appBarTitle =
            "$mediaTitle - ${context.read<EpisodePlayerBloc>().param.episodeNum}${context.appLocal.episodes}";
        return PlayerAreaBlocProvider(
          key: ValueKey(
              "player_${req.mediaId}_${req.episodeNum}_${MediaSource.vdm10}_key"),
          mediaId: req.mediaId,
          episodeNum: req.episodeNum,
          source: MediaSource.vdm10,
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
                          child: _BasicInfo(model: state.mediaModel!),
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
  });

  final MediaModel model;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Text(
            model.title!.getTitle(
              GetItScope.of(context)
                  .get<UserDataRepository>()
                  .userTitleLanguage,
            ),
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ],
    );
  }
}

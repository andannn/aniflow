import 'dart:async';

import 'package:aniflow/app/di/get_it_scope.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/core/data/hi_animation_repository.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/core/design_system/widget/vertical_animated_scale_switcher.dart';
import 'package:aniflow/feature/detail_media/bloc/detail_media_bloc.dart';
import 'package:aniflow/feature/detail_media/bloc/detail_media_ui_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:platform_player/platform_player.dart';
import 'package:url_launcher/url_launcher.dart';

Widget buildWatchNextEpisodeArea(
    BuildContext context, DetailMediaUiState state) {
  if (!state.isHiAnimationFeatureEnabled ||
      state.detailAnimeModel?.type != MediaType.anime) {
    return const SizedBox();
  }

  return Column(
    children: [
      _buildAiringInfo(context, state.detailAnimeModel!),
      _buildNextEpisodeInfo(context, state),
    ],
  );
}

Widget _buildNextEpisodeInfo(BuildContext context, DetailMediaUiState state) {
  final episode = state.episode;
  final nextProgress = (state.mediaListItem?.progress ?? 0) + 1;
  final hasNextReleasedEpisode = state.hasNextReleasedEpisode;
  return AnimatedScaleSwitcher(
    visible: hasNextReleasedEpisode,
    builder: () => Padding(
      key: ValueKey(episode.runtimeType),
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card.filled(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text(
                context.appLocal.nextEpToWatch(nextProgress),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 12),
              switch (episode) {
                Loading<Episode>() => Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: LoadingAnimationWidget.twistingDots(
                          size: 20,
                          leftDotColor:
                          Theme.of(context).colorScheme.tertiary,
                          rightDotColor:
                          Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                Ready<Episode>() => Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        episode.state.title,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OutlinedButton(
                          onPressed: () async {
                            context.read<DetailMediaBloc>().add(
                              OnMarkWatchedClick(),
                            );
                          },
                          child: Text(context.appLocal.markWatched),
                        ),
                        FilledButton(
                          onPressed: () async {
                            final isUsingInAppPlayer =
                                GetItScope.of(context)
                                    .get<UserDataRepository>()
                                    .useInAppPlayer;
                            if (isUsingInAppPlayer) {
                              unawaited(PlatformPlayer()
                                  .navigateToPlayer(episode.state.url));
                            } else {
                              final url = Uri.parse(episode.state.url);
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url);
                              }
                            }
                          },
                          child: Text(context.appLocal.watchNow),
                        ),
                      ],
                    )
                  ],
                ),
                None<Episode>() => const SizedBox(),
                Error<Episode>() => Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        context.appLocal.cantFindThisEpisode,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(
                          color:
                          Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OutlinedButton(
                          onPressed: () async {
                            context.read<DetailMediaBloc>().add(
                              OnRetryGetHighAnimationSource(),
                            );
                          },
                          child: Text(context.appLocal.retry),
                        ),
                      ],
                    )
                  ],
                ),
              },
            ],
          ),
        ),
      ),
    ),
  );
}

Widget _buildAiringInfo(BuildContext context, MediaModel model) {
  final nextAiringEpisode = model.nextAiringEpisode;
  final airingTimeString = model.getReleasingTimeString(context);
  return AnimatedScaleSwitcher(
    visible: airingTimeString.isNotEmpty && nextAiringEpisode != null,
    builder: () => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card.filled(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            context.appLocal
                .nextAiringInfo(nextAiringEpisode!, airingTimeString),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
    ),
  );
}

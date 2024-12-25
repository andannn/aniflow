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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                context.appLocal.nextEpToWatch(nextProgress),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(width: 12),
            ],
          ),
          const SizedBox(height: 12),
          switch (episode) {
            Loading<Episode>() => Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: LoadingAnimationWidget.twistingDots(
                  size: 20,
                  leftDotColor: Theme.of(context).colorScheme.tertiary,
                  rightDotColor: Theme.of(context).colorScheme.primary,
                ),
              ),
            Ready<Episode>() => Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Text(
                      episode.state.title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  FilledButton.icon(
                    onPressed: () async {
                      final isUsingInAppPlayer = GetItScope.of(context)
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
                    label: Text(context.appLocal.watchNow),
                    icon: const Icon(Icons.play_arrow),
                  ),
                ],
              ),
            None<Episode>() => const SizedBox(),
            Error<Episode>() => Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const SizedBox(width: 24),
                  Text(
                    context.appLocal.cantFindThisEpisode,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                  ),
                  TextButton.icon(
                    icon: const Icon(Icons.refresh),
                    label: Text(context.appLocal.retry),
                    onPressed: () async {
                      context.read<DetailMediaBloc>().add(
                            OnRetryGetHighAnimationSource(),
                          );
                    },
                  )
                ],
              ),
          },
        ],
      ),
    ),
  );
}

/// Only show when no next episode, but still airing.
Widget _buildAiringInfo(BuildContext context, MediaModel model) {
  final nextAiringEpisode = model.nextAiringEpisode;
  final airingTimeString = model.getReleasingTimeString(context);

  return AnimatedScaleSwitcher(
    visible: airingTimeString.isNotEmpty && nextAiringEpisode != null,
    builder: () => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
      child: Text(
        context.appLocal.nextAiringInfo(nextAiringEpisode!, airingTimeString),
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    ),
  );
}

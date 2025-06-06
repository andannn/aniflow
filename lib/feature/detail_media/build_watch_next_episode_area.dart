import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/design_system/widget/vertical_animated_scale_switcher.dart';
import 'package:aniflow/feature/detail_media/bloc/detail_media_bloc.dart';
import 'package:aniflow/feature/detail_media/bloc/detail_media_ui_state.dart';
import 'package:flutter/material.dart';

Widget buildWatchNextEpisodeArea(
    BuildContext context, DetailMediaUiState state) {
  if (state.detailAnimeModel?.type != MediaType.anime) {
    return const SizedBox();
  }

  return Column(
    children: [
      _buildAiringInfo(context, state.detailAnimeModel!),
      const SizedBox(height: 12),
      _buildNextEpisodeInfo(context, state),
    ],
  );
}

Widget _buildNextEpisodeInfo(BuildContext context, DetailMediaUiState state) {
  final hasNextReleasedEpisode = state.hasNextReleasedEpisode;
  final nextProgress =
      hasNextReleasedEpisode ? (state.mediaListItem?.progress ?? 0) + 1 : null;
  return hasNextReleasedEpisode
      ? Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    context.appLocal.nextEpToWatch(nextProgress!),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(width: 12),
                ],
              ),
              const SizedBox(height: 12),
            ],
          ),
        )
      : const SizedBox();
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

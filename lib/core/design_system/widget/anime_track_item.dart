import 'package:anime_tracker/core/data/logger/logger.dart';
import 'package:anime_tracker/core/data/model/anime_list_item_model.dart';
import 'package:anime_tracker/core/data/model/anime_title_modle.dart';
import 'package:anime_tracker/core/data/util/anime_list_item_model_util.dart';
import 'package:anime_tracker/core/data/util/anime_model_extension.dart';
import 'package:flutter/material.dart';

import 'package:anime_tracker/core/design_system/widget/af_network_image.dart';

class AnimeTrackItem extends StatelessWidget {
  const AnimeTrackItem({required this.model, required this.onClick, super.key});

  final AnimeListItemModel model;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.onSurfaceVariant;
    final textTheme = Theme.of(context).textTheme;
    final hasNextReleasingEpisode = model.hasNextReleasingEpisode;
    logger.d(model.animeModel!);
    return Opacity(
      opacity: hasNextReleasingEpisode ? 1.0 : 0.5,
      child: Card(
        elevation: 0,
        color: Theme.of(context).colorScheme.surfaceVariant,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onClick,
          child: Stack(
            children: [
              Row(children: [
                AspectRatio(
                  aspectRatio: 3.0 / 4,
                  child: AFNetworkImage(
                    imageUrl: model.animeModel!.coverImage,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Text(
                        model.animeModel!.title!.getLocalTitle(context),
                        style:
                            textTheme.titleMedium?.copyWith(color: textColor),
                        maxLines: 2,
                        softWrap: true,
                      ),
                      const Expanded(child: SizedBox()),
                      _buildWatchingInfoLabel(context, model),
                      const Expanded(child: SizedBox()),
                      Text(
                        model.animeModel!.getAnimeInfoString(context),
                        style: textTheme.bodySmall?.copyWith(color: textColor),
                      ),
                      const SizedBox(height: 4),
                    ],
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWatchingInfoLabel(
      BuildContext context, AnimeListItemModel model) {
    final hasNextReleasingEpisode = model.hasNextReleasingEpisode;
    String label;
    if (hasNextReleasingEpisode) {
      label = 'Next Episode: EP.${model.progress! + 1}';
    } else {
      label =
          'Next Episode: EP.${model.animeModel!.nextAiringEpisode} in ${model.animeModel!.getReleasingTimeString(context)}';
    }
    return Text(
      label,
      style: Theme.of(context).textTheme.labelLarge,
    );
  }
}

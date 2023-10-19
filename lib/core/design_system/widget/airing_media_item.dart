import 'package:anime_tracker/app/local/util/anime_model_extension.dart';
import 'package:anime_tracker/core/data/model/airing_schedule_and_anime_model.dart';
import 'package:anime_tracker/core/data/model/media_title_modle.dart';
import 'package:anime_tracker/core/design_system/widget/af_network_image.dart';
import 'package:flutter/material.dart';

class AiringMediaItem extends StatelessWidget {
  const AiringMediaItem(
      {required this.model, required this.onClick, super.key});

  final AiringScheduleAndAnimeModel model;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).colorScheme.onSurfaceVariant;
    final textTheme = Theme.of(context).textTheme;
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceVariant,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onClick,
        child: Row(children: [
          AspectRatio(
            aspectRatio: 3.0 / 4,
            child: AFNetworkImage(
              imageUrl: model.animeModel.coverImage,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Text(
                  model.animeModel.title!.getLocalTitle(context),
                  style: textTheme.titleMedium?.copyWith(color: textColor),
                  maxLines: 2,
                  softWrap: true,
                ),
                const Expanded(child: SizedBox()),
                _buildWatchingInfoLabel(context, model),
                const Expanded(child: SizedBox()),
                Text(
                  model.animeModel.getAnimeInfoString(context),
                  style: textTheme.bodySmall?.copyWith(color: textColor),
                ),
                const SizedBox(height: 4),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget _buildWatchingInfoLabel(
      BuildContext context, AiringScheduleAndAnimeModel model) {
    return Text(
      'EP.${model.airingSchedule.episode}',
      style: Theme.of(context).textTheme.labelLarge,
    );
  }
}

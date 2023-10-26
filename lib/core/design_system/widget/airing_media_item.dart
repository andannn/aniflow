import 'package:aniflow/core/data/model/airing_schedule_and_anime_model.dart';
import 'package:aniflow/core/design_system/widget/media_row_item.dart';
import 'package:flutter/material.dart';

class AiringMediaItem extends StatelessWidget {
  const AiringMediaItem(
      {required this.model, required this.onClick, super.key});

  final AiringScheduleAndAnimeModel model;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceVariant,
      clipBehavior: Clip.antiAlias,
      child: MediaRowItem(
        model: model.animeModel,
        watchInfoTextColor: colorScheme.primary,
        watchingInfo: _buildWatchingInfoLabel(model),
        titleMaxLines: null,
        onClick: onClick,
      ),
    );
  }

  String _buildWatchingInfoLabel(AiringScheduleAndAnimeModel model) {
    return 'EP.${model.airingSchedule.episode}';
  }
}

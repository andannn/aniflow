// ignore_for_file: lines_longer_than_80_chars

import 'package:aniflow/app/local/util/string_resource_util.dart';
import 'package:aniflow/core/common/setting/user_title_language.dart';
import 'package:aniflow/core/data/model/anime_list_item_model.dart';
import 'package:aniflow/core/data/model/extension/media_list_item_model_extension.dart';
import 'package:aniflow/core/design_system/widget/media_row_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MediaListItem extends StatelessWidget {
  const MediaListItem({
    super.key,
    required this.model,
    this.showNewBadge = false,
    required this.onMarkWatchedClick,
    required this.onClick,
    required this.language,
  });

  final MediaListItemModel model;
  final VoidCallback onClick;
  final VoidCallback onMarkWatchedClick;
  final UserTitleLanguage language;
  final bool showNewBadge;

  @override
  Widget build(BuildContext context) {
    final hasNextReleasingEpisode = model.hasNextReleasingEpisode;
    final colorScheme = Theme.of(context).colorScheme;
    return Opacity(
      opacity: hasNextReleasingEpisode ? 1.0 : 0.7,
      child: Card.filled(
        clipBehavior: Clip.antiAlias,
        child: MarkWatchSlideWidget(
          onWatchedClick: onMarkWatchedClick,
          canSlide: hasNextReleasingEpisode,
          child: MediaRowItem(
            model: model.animeModel!,
            language: language,
            showNewBadge: showNewBadge,
            watchingInfo: _buildWatchingInfoLabel(context, model),
            titleMaxLines: null,
            watchInfoTextColor: model.hasNextReleasingEpisode
                ? colorScheme.primary
                : colorScheme.secondary,
            onClick: onClick,
          ),
        ),
      ),
    );
  }

  String _buildWatchingInfoLabel(
      BuildContext context, MediaListItemModel model) {
    final hasNextReleasingEpisode = model.hasNextReleasingEpisode;
    String label = '';
    if (hasNextReleasingEpisode) {
      label = 'Next Episode: EP.${model.progress! + 1}';
    } else {
      if (model.animeModel!.nextAiringEpisode != null) {
        label =
            'Next Episode: EP.${model.animeModel!.nextAiringEpisode} in ${model.animeModel!.getReleasingTimeString(context)}';
      }
    }
    return label;
  }
}

class MarkWatchSlideWidget extends StatelessWidget {
  const MarkWatchSlideWidget(
      {required this.onWatchedClick,
      required this.canSlide,
      required this.child,
      super.key});

  final VoidCallback onWatchedClick;
  final bool canSlide;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      enabled: canSlide,
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            onPressed: (_) {
              onWatchedClick.call();
            },
            icon: Icons.remove_red_eye_outlined,
            label: 'Mark watched',
            backgroundColor: Theme.of(context).colorScheme.inverseSurface,
            foregroundColor: Theme.of(context).colorScheme.onInverseSurface,
          ),
        ],
      ),
      child: child,
    );
  }
}

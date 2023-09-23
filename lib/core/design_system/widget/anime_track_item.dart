import 'package:anime_tracker/core/data/model/anime_list_item_model.dart';
import 'package:anime_tracker/core/data/model/anime_title_modle.dart';
import 'package:flutter/material.dart';

import 'package:anime_tracker/core/design_system/widget/af_network_image.dart';

class AnimeTrackItem extends StatelessWidget {
  const AnimeTrackItem(
      {required this.model, required this.onClick, super.key, this.textStyle});

  final AnimeListItemModel model;
  final VoidCallback onClick;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
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
              imageUrl: model.animeModel!.coverImage,
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.animeModel!.title!.getLocalTitle(context),
                  textAlign: TextAlign.center,
                  style: textStyle?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant),
                  maxLines: 2,
                  softWrap: true,
                ),
                Text(
                  model.progress!.toString(),
                  style: textStyle?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

import 'package:aniflow/app/local/util/anime_model_extension.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/media_title_modle.dart';
import 'package:aniflow/core/design_system/widget/af_network_image.dart';
import 'package:flutter/material.dart';

class SearchAnimeItem extends StatelessWidget {
  const SearchAnimeItem(
      {required this.model,
      required this.onClick,
      super.key});

  final MediaModel model;
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
              imageUrl: model.coverImage,
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
                  model.title!.getLocalTitle(context),
                  style: textTheme.titleMedium?.copyWith(color: textColor),
                  maxLines: 2,
                  softWrap: true,
                ),
                const Expanded(child: SizedBox()),
                Text(
                  model.getAnimeInfoString(context),
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
}

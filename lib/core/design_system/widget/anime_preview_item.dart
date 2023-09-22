import 'package:anime_tracker/core/data/model/anime_title_modle.dart';
import 'package:anime_tracker/core/data/model/short_anime_model.dart';
import 'package:flutter/material.dart';

import 'package:anime_tracker/core/design_system/widget/af_network_image.dart';

class AnimePreviewItem extends StatelessWidget {
  const AnimePreviewItem(
      {required this.model,
      required this.onClick,
      super.key,
      this.width,
      this.textStyle});

  final ShortAnimeModel model;
  final VoidCallback onClick;
  final double? width;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.surfaceVariant,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onClick,
        child: SizedBox(
          width: width,
          child: Column(children: [
            AspectRatio(
              aspectRatio: 3.0 / 4,
              child: AFNetworkImage(
                imageUrl: model.coverImage,
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Text(
                    model.title!.getLocalTitle(context),
                    textAlign: TextAlign.center,
                    style: textStyle?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant),
                    maxLines: 2,
                    softWrap: true,
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

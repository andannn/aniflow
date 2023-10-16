import 'package:anime_tracker/core/data/model/anime_model.dart';
import 'package:anime_tracker/core/data/model/anime_title_modle.dart';
import 'package:anime_tracker/core/design_system/widget/af_network_image.dart';
import 'package:flutter/material.dart';

class AnimePreviewItem extends StatelessWidget {
  const AnimePreviewItem(
      {required this.model,
      required this.onClick,
      super.key,
      this.width,
      this.textStyle});

  final AnimeModel model;
  final VoidCallback onClick;
  final double? width;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3.0),
        child: Stack(
          children: [
            Card(
              elevation: 0,
              color: Theme.of(context).colorScheme.surfaceVariant,
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: onClick,
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
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant),
                          maxLines: 2,
                          softWrap: true,
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
            model.isFollowing
                ? Align(
                    alignment: Alignment.topRight,
                    child: Transform.translate(
                      offset: const Offset(-2, -3),
                      child: Transform.scale(
                        scaleY: 1.3,
                        scaleX: 0.8,
                        child: Icon(
                          Icons.bookmark,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

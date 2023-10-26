import 'package:aniflow/core/design_system/widget/af_network_image.dart';
import 'package:flutter/material.dart';

class MediaPreviewItem extends StatelessWidget {
  const MediaPreviewItem(
      {required this.onClick,
      required this.coverImage,
      required this.title,
      this.isFollowing = false,
      super.key,
      this.width,
      this.textStyle});

  final VoidCallback onClick;
  final double? width;
  final TextStyle? textStyle;
  final String coverImage;
  final String title;
  final bool isFollowing;

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
                      imageUrl: coverImage,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4.0,
                        vertical: 4.0,
                      ),
                      child: Center(
                        child: Text(
                          title,
                          textAlign: TextAlign.center,
                          style: textStyle?.copyWith(
                              color:
                                  Theme.of(context).colorScheme.onSurfaceVariant),
                          maxLines: 2,
                          softWrap: true,
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
            isFollowing
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

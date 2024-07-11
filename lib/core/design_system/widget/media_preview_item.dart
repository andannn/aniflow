import 'package:aniflow/core/design_system/widget/af_network_image.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MediaPreviewItem extends StatelessWidget {
  const MediaPreviewItem({
    super.key,
    required this.onClick,
    required this.coverImage,
    required this.title,
    this.isFollowing = false,
    this.textStyle,
    this.titleVerticalPadding = 0,
    this.showTitle = true,
  });

  final VoidCallback onClick;
  final TextStyle? textStyle;
  final String coverImage;
  final String title;
  final bool isFollowing;
  final bool showTitle;
  final double titleVerticalPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Card.filled(
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: onClick,
                  child: AspectRatio(
                    aspectRatio: 3.0 / 4,
                    child: AFNetworkImage(
                      imageUrl: coverImage,
                    ),
                  ),
                ),
              ),
              showTitle
                  ? Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4.0,
                          vertical: titleVerticalPadding,
                        ),
                        child: Opacity(
                          opacity: 0.7,
                          child: AutoSizeText(
                            title,
                            textAlign: TextAlign.center,
                            style: textStyle,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
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
    );
  }
}

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

class MediaPreviewItemV2 extends StatelessWidget {
  const MediaPreviewItemV2({
    super.key,
    required this.coverImage,
    required this.title,
    required this.isFollowing,
  });

  final String coverImage;
  final String title;
  final bool isFollowing;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ShaderMask(
            blendMode: BlendMode.srcATop,
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Colors.transparent,
                  Colors.black.withAlpha(220),
                ],
                stops: const <double>[
                  0.7,
                  1,
                ],
              ).createShader(bounds);
            },
            child: AspectRatio(
              aspectRatio: 3 / 4,
              child: AFNetworkImage(
                imageUrl: coverImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 12,
          left: 12,
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
        isFollowing
            ? Align(
                alignment: Alignment.topRight,
                child: Transform.translate(
                  offset: const Offset(-8, 0),
                  child: Transform.scale(
                    scaleY: 1.3,
                    scaleX: 0.8,
                    child: Stack(
                      children: [
                        Positioned.fill(child: Icon(
                          Icons.bookmark,
                          color: Theme.of(context).colorScheme.onTertiary,
                        )),
                        Transform.scale(
                          scaleX: 0.9,
                          child: Transform.translate(
                            offset: const Offset(0, -1),
                            child: Icon(
                              Icons.bookmark,
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}

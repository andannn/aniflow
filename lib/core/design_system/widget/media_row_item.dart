// ignore_for_file: lines_longer_than_80_chars

import 'package:aniflow/core/common/setting/user_title_language.dart';
import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/media_title_model.dart';
import 'package:aniflow/core/design_system/assets/icons.dart';
import 'package:aniflow/core/design_system/widget/af_network_image.dart';
import 'package:flutter/material.dart';

class MediaRowItem extends StatelessWidget {
  const MediaRowItem({
    required this.model,
    required this.language,
    this.onClick,
    this.centerWidget,
    super.key,
    this.titleMaxLines = 2,
    this.showNewBadge = false,
    this.onLongPress,
  });

  final MediaModel model;
  final bool showNewBadge;
  final Widget? centerWidget;
  final VoidCallback? onClick;
  final VoidCallback? onLongPress;
  final int? titleMaxLines;
  final UserTitleLanguage language;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final surfaceTextColor = colorScheme.onSurfaceVariant;
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: onClick,
      onLongPress: onLongPress,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              // compile error if no set this height.
              // this height value will no take effect because we have set the IntrinsicHeight
              height: 1,
              width: 85,
              child: Card.filled(
                clipBehavior: Clip.antiAlias,
                child: AFNetworkImage(
                  imageUrl: model.coverImage?.large ?? '',
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: Text(
                          model.title?.getTitle(language) ?? '',
                          style: textTheme.titleMedium
                              ?.copyWith(color: surfaceTextColor),
                          maxLines: titleMaxLines,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 16),
                      centerWidget ?? const SizedBox(),
                          // ? Text(
                          //     centerWidget!,
                          //     style: Theme.of(context)
                          //         .textTheme
                          //         .labelLarge
                          //         ?.copyWith(color: watchInfoTextColor),
                          //   )
                      const SizedBox(height: 16),
                      Text(
                        model.getMediaInfoString(context),
                        style: textTheme.bodySmall
                            ?.copyWith(color: surfaceTextColor),
                      ),
                      const SizedBox(height: 4),
                    ],
                  ),
                  if (showNewBadge)
                    Positioned(
                      right: -8,
                      bottom: -8,
                      child: SizedBox.square(
                        dimension: 36,
                        child: Image.asset(
                          AfIcons.icNewBadge,
                          color: Colors.red,
                        ),
                      ),
                    )
                  else
                    const SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

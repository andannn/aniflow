// ignore_for_file: lines_longer_than_80_chars

import 'package:aniflow/app/local/util/anime_model_extension.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/media_title_modle.dart';
import 'package:aniflow/core/design_system/widget/af_network_image.dart';
import 'package:flutter/material.dart';

class MediaRowItem extends StatelessWidget {
  const MediaRowItem(
      {required this.model,
      required this.onClick,
      this.watchInfoTextColor,
      this.watchingInfo,
      super.key,
      this.titleMaxLines = 2});

  final MediaModel model;
  final String? watchingInfo;
  final VoidCallback onClick;
  final Color? watchInfoTextColor;
  final int? titleMaxLines;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final surfaceTextColor = colorScheme.onSurfaceVariant;
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: onClick,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              // compile error if no set this height.
              // this height value will no take effect because we have set the IntrinsicHeight
              height: 1,
              width: 85,
              child: AFNetworkImage(
                imageUrl: model.coverImage,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(
                    model.title!.getLocalTitle(context),
                    style: textTheme.titleMedium
                        ?.copyWith(color: surfaceTextColor),
                    maxLines: titleMaxLines,
                  ),
                  const SizedBox(height: 16),
                  watchingInfo != null
                      ? Text(
                          watchingInfo!,
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(color: watchInfoTextColor),
                        )
                      : const SizedBox(),
                  const SizedBox(height: 16),
                  Text(
                    model.getAnimeInfoString(context),
                    style:
                        textTheme.bodySmall?.copyWith(color: surfaceTextColor),
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

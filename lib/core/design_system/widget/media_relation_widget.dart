import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/core/data/model/media_relation_model.dart';
import 'package:aniflow/core/design_system/widget/af_network_image.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MediaRelationWidget extends StatelessWidget {
  const MediaRelationWidget(
      {required this.model, required this.onClick, super.key});

  final MediaRelationModel model;

  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final textStyle = textTheme.bodyMedium!
        .copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant);
    final labelStyle = textTheme.bodyLarge!
        .copyWith(color: Theme.of(context).colorScheme.primary);

    return Card.filled(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onClick,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            AspectRatio(
              aspectRatio: 3.0 / 4,
              child: AFNetworkImage(
                imageUrl: model.media.coverImage?.medium ?? '',
              ),
            ),
            const SizedBox(width: 8),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.type.translated(context),
                    style: labelStyle,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    constraints:
                        const BoxConstraints(maxWidth: 200, maxHeight: 50),
                    child: AutoSizeText(
                      model.media.title!.native,
                      style: textStyle,
                      maxLines: 3,
                      softWrap: true,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Text(model.media.getMediaInfoString(context),
                      style: textStyle),
                ],
              ),
            ),
            const SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}

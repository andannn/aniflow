import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/design_system/widget/af_network_image.dart';
import 'package:aniflow/feature/image_preview/util/preview_source_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MediaCover extends StatelessWidget {
  const MediaCover(
      {super.key, required this.onImageClick, required this.model});

  final GestureTapCallback onImageClick;
  final MediaModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onImageClick,
      child: Hero(
        tag: model.coverPreviewSource,
        child: Column(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
              )),
              child: AspectRatio(
                aspectRatio: 3 / 4,
                child: AFNetworkImage(
                  imageUrl: model.coverImage?.extraLarge ?? '',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

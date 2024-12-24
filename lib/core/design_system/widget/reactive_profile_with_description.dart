import 'package:aniflow/core/common/util/description_item_util.dart';
import 'package:aniflow/core/common/util/screen_size_util.dart';
import 'package:aniflow/core/design_system/widget/af_html_widget.dart';
import 'package:aniflow/core/design_system/widget/af_network_image.dart';
import 'package:aniflow/core/design_system/widget/vertical_animated_scale_switcher.dart';
import 'package:aniflow/feature/image_preview/preview_source.dart';
import 'package:flutter/material.dart';

class ReactiveProfileWithDescription extends StatelessWidget {
  const ReactiveProfileWithDescription({
    super.key,
    required this.model,
    required this.onImageTap,
    required this.previewSource,
  });

// TODO: use sealed class to define CharacterModel/StaffModel/MediaModel type
  // maybe CharacterModel/StaffModel
  final dynamic model;
  final GestureTapCallback onImageTap;
  final PreviewSource previewSource;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (ScreenSizeUtil.isLargeScreen(context)) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileImage(context),
            const SizedBox(width: 24),
            Expanded(child: _buildDescriptionSection(context)),
          ],
        );
      } else {
        return Column(
          children: [
            _buildProfileImage(context),
            const SizedBox(width: 24),
            _buildDescriptionSection(context),
          ],
        );
      }
    });
  }

  Widget _buildDescriptionSection(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final items = createDescription(model, context);
    final description = model.description ?? '';
    return AnimatedScaleSwitcher(
      visible: items.isNotEmpty || description.isNotEmpty,
      builder: () => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...items.map(
                (item) => RichText(
              text: TextSpan(
                text: item.key,
                style: textTheme.titleSmall,
                children: [
                  TextSpan(
                    text: item.value,
                    style: textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
          AfHtmlWidget(html: description)
        ],
      ),
    );
  }

  Widget _buildProfileImage(BuildContext context) {
    return InkWell(
      onTap: onImageTap,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: const ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            )),
        child: Hero(
          tag: previewSource,
          child: AFNetworkImage(
            imageUrl: model.largeImage,
          ),
        ),
      ),
    );
  }
}

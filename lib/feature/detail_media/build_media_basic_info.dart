import 'package:aniflow/core/common/util/screen_size_util.dart';
import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/trailer_model.dart';
import 'package:aniflow/core/design_system/widget/af_html_widget.dart';
import 'package:aniflow/core/design_system/widget/af_network_image.dart';
import 'package:aniflow/core/design_system/widget/genre_item.dart';
import 'package:aniflow/core/design_system/widget/info_item.dart';
import 'package:aniflow/core/design_system/widget/media_cover.dart';
import 'package:aniflow/core/design_system/widget/trailer_preview.dart';
import 'package:aniflow/core/design_system/widget/twitter_hashtag_widget.dart';
import 'package:aniflow/core/design_system/widget/vertical_animated_scale_switcher.dart';
import 'package:aniflow/feature/image_preview/util/preview_source_extensions.dart';
import 'package:flutter/material.dart';

Widget buildBannerSectionSection(BuildContext context, MediaModel model,
    {required Function() onImageClick}) {
  return AnimatedScaleSwitcher(
    visible: model.bannerImage != null && model.bannerImage!.isNotEmpty,
    builder: () => Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onImageClick,
        child: Card(
          elevation: 0,
          clipBehavior: Clip.hardEdge,
          child: Hero(
            tag: model.bannerImagePreviewSource,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AFNetworkImage(
                  height: 128,
                  placeholder: null,
                  imageUrl: model.bannerImage ?? '',
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Widget buildTrailerSection(BuildContext context,
    {required VoidCallback onTrailerClick, TrailerModel? trailerModel}) {
  if (trailerModel == null) {
    return const SizedBox();
  }

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.appLocal.trailer,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        Builder(builder: (context) {
          if (ScreenSizeUtil.isLargeScreen(context)) {
            return SizedBox(
              height: 250,
              child: TrailerPreview(
                model: trailerModel,
                onTrailerClick: onTrailerClick,
              ),
            );
          } else {
            return TrailerPreview(
              model: trailerModel,
              onTrailerClick: onTrailerClick,
            );
          }
        }),
      ],
    ),
  );
}

Widget buildTwitterHashTags(BuildContext context, MediaModel model) {
  final hashTags = model.hashtags;
  if (hashTags.isEmpty) {
    return const SizedBox();
  }

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      width: double.infinity,
      child: Wrap(
        spacing: 10,
        children: hashTags
            .map((hashtag) => TwitterHashtagWidget(hashtag: hashtag))
            .toList(),
      ),
    ),
  );
}

Widget buildAnimeInfo(BuildContext context, MediaModel model) {
  final infoString = model.getMediaInfoString(context);
  return AnimatedScaleSwitcher(
    visible: infoString.isNotEmpty,
    builder: () => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.getMediaInfoString(context),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    ),
  );
}

Widget buildReactiveMediaBasicInfoBar(
    {required BuildContext context,
    required MediaModel model,
    required Function() onImageClick}) {
  if (ScreenSizeUtil.isLargeScreen(context)) {
    return _buildDetailInfo(
      context: context,
      model: model,
      onImageClick: onImageClick,
    );
  } else {
    return _buildEqualDivisionInfoBar(
      context: context,
      model: model,
      onImageClick: onImageClick,
    );
  }
}

Widget _buildEqualDivisionInfoBar(
    {required BuildContext context,
    required MediaModel model,
    required Function() onImageClick}) {
  return IntrinsicHeight(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 1,
          child: MediaCover(onImageClick: onImageClick, model: model),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 1,
          child: Column(
            children: _buildMediaInfoWithTagArea(model),
          ),
        ),
      ],
    ),
  );
}

Widget _buildDetailInfo(
    {required BuildContext context,
    required MediaModel model,
    required Function() onImageClick}) {
  final infoString = model.getMediaInfoString(context);
  final hashTags = model.hashtags;
  final description = model.description;

  return Row(
    mainAxisSize: MainAxisSize.max,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        width: 300,
        child: MediaCover(onImageClick: onImageClick, model: model),
      ),
      const SizedBox(width: 16),
      Expanded(
        child: Column(
          children: [
            ..._buildMediaInfoWithTagArea(model),
            if (hashTags.isNotEmpty) const Divider(),
            buildTwitterHashTags(context, model),
            if (infoString.isNotEmpty) const Divider(),
            buildAnimeInfo(context, model),
            if (description != null) const Divider(),
            buildMediaDescription(
              context: context,
              description: description,
            ),
          ],
        ),
      ),
    ],
  );
}

List<Widget> _buildMediaInfoWithTagArea(MediaModel model) {
  return [
    SizedBox(
      width: double.infinity,
      child: Wrap(
        spacing: 12,
        children: [
          InfoItem(
            label: 'RATED',
            iconData: Icons.hotel_class_sharp,
            contentText: '#${model.ratedRank ?? '--'}',
          ),
          InfoItem(
            label: 'POPULAR',
            iconData: Icons.favorite_sharp,
            contentText: '#${model.popularRank ?? '--'}',
          ),
          InfoItem(
            label: 'SCORE',
            iconData: Icons.star_purple500_sharp,
            contentText:
                // ignore: lines_longer_than_80_chars
                '${model.averageScore != null ? (model.averageScore! / 10.0) : '--'}',
          ),
          InfoItem(
            label: 'FAVOURITE',
            iconData: Icons.thumb_up,
            contentText:
                // ignore: lines_longer_than_80_chars
                '${model.favourites != null ? (model.favourites) : '--'}',
          ),
        ],
      ),
    ),
    if (model.genres.isNotEmpty) const Divider(),
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: double.infinity,
        child: Wrap(
          spacing: 4,
          runSpacing: 4,
          children:
              model.genres.map((label) => GenreItem(label: label)).toList(),
        ),
      ),
    ),
  ];
}

Widget buildMediaDescription(
    {required BuildContext context, required String? description}) {
  return AnimatedScaleSwitcher(
    visible: description != null,
    builder: () => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.appLocal.animeDescription,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 12),
          description != null
              ? AfHtmlWidget(html: description)
              : const SizedBox(),
        ],
      ),
    ),
  );
}

import 'package:aniflow/core/data/model/activity_model.dart';
import 'package:aniflow/core/data/model/media_title_modle.dart';
import 'package:aniflow/core/design_system/widget/af_network_image.dart';
import 'package:aniflow/core/design_system/widget/avatar_icon.dart';
import 'package:aniflow/core/design_system/widget/short_num_label_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class ActivityItem extends StatelessWidget {
  const ActivityItem(
      {required this.model,
      super.key,
      this.onMediaClick,
      this.onUserIconClick});

  final ActivityModel model;
  final Function(String mediaId)? onMediaClick;
  final Function(String userId)? onUserIconClick;

  @override
  Widget build(BuildContext context) {
    final activity = model;
    switch (activity) {
      case ListActivityModel():
        return _buildListActivity(context, activity);
      case TextActivityModel():
        return _buildTextActivity(context, activity);
    }
  }

  Widget _buildListActivity(BuildContext context, ListActivityModel activity) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      constraints: const BoxConstraints(minHeight: 120),
      child: Card(
        elevation: 0,
        color: colorScheme.surfaceVariant,
        clipBehavior: Clip.antiAlias,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                // compile error if no set this height.
                // ignore: lines_longer_than_80_chars
                // this height value will no take effect because we have set the IntrinsicHeight
                height: 1,
                width: 85,
                child: InkWell(
                  onTap: () {
                    onMediaClick?.call(activity.media.id);
                  },
                  child: AFNetworkImage(
                    imageUrl: activity.media.coverImage,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Text(
                      model.user.name,
                      style: textTheme.labelLarge!
                          .copyWith(color: colorScheme.primary),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      // ignore: lines_longer_than_80_chars
                      '${activity.status.toString()} ${activity.progress} of ${activity.media.title!.getLocalTitle(context)}',
                      style: textTheme.bodyMedium!
                          .copyWith(color: colorScheme.onSurfaceVariant),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 40,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              onUserIconClick?.call(activity.user.id);
                            },
                            child: buildAvatarIcon(context, model.user.avatar),
                          ),
                          const Expanded(child: SizedBox()),
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: _buildReplyLikeStateSection(
                              context,
                              activity.isLiked,
                              activity.likeCount,
                              activity.replyCount,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextActivity(BuildContext context, TextActivityModel activity) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Card(
      elevation: 0,
      color: colorScheme.surfaceVariant,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      onUserIconClick?.call(activity.user.id);
                    },
                    child: buildAvatarIcon(context, model.user.avatar),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    model.user.name,
                    style: textTheme.labelLarge!.copyWith(
                      color: colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            HtmlWidget(
              activity.text,
              textStyle: textTheme.bodyMedium!
                  .copyWith(color: colorScheme.onSurfaceVariant),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: _buildReplyLikeStateSection(
                  context,
                  activity.isLiked,
                  activity.likeCount,
                  activity.replyCount,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReplyLikeStateSection(
      BuildContext context, bool isLike, int likeCount, int repliedCount) {
    final defaultColor =
        Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.8);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ShortNumLabelIconButton(
          icon: Icons.messenger_outline_rounded,
          count: repliedCount,
          color: defaultColor,
          onClick: () {},
        ),
        ShortNumLabelIconButton(
          icon: isLike ? Icons.favorite : Icons.favorite_outline,
          color: isLike ? Colors.red : defaultColor,
          count: repliedCount,
          onClick: () {},
        ),
      ],
    );
  }
}

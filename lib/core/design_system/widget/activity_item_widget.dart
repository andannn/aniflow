import 'package:aniflow/app/local/util/string_resource_util.dart';
import 'package:aniflow/core/common/util/time_util.dart';
import 'package:aniflow/core/data/model/activity_model.dart';
import 'package:aniflow/core/design_system/widget/af_html_widget.dart';
import 'package:aniflow/core/design_system/widget/af_network_image.dart';
import 'package:aniflow/core/design_system/widget/avatar_icon.dart';
import 'package:flutter/material.dart';

class ActivityItem extends StatelessWidget {
  const ActivityItem(
      {required this.model,
      required this.onBuildActivityStatusWidget,
      super.key,
      this.onMediaClick,
      this.onUserIconClick});

  final ActivityModel model;
  final Function(String mediaId)? onMediaClick;
  final Function(String userId)? onUserIconClick;
  final Widget Function(String activityId) onBuildActivityStatusWidget;

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
    final timeUntilNowDuration = DateTime.now().difference(
        DateTime.fromMillisecondsSinceEpoch(activity.createdAt * 1000));
    final timeUntilNowString =
        '${TimeUtil.getFormattedDuration(timeUntilNowDuration)} ago';
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
                    imageUrl: activity.media.coverImage?.large ?? '',
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          model.user.name,
                          style: textTheme.labelLarge!
                              .copyWith(color: colorScheme.primary),
                        ),
                        const Expanded(child: SizedBox()),
                        Opacity(
                          opacity: 0.7,
                          child: Text(
                            timeUntilNowString,
                            style: textTheme.labelSmall!,
                          ),
                        ),
                        const SizedBox(width: 16)
                      ],
                    ),
                    const SizedBox(height: 8),
                    RichText(
                      text: TextSpan(
                        style: textTheme.bodyMedium!
                            .copyWith(color: colorScheme.onSurfaceVariant),
                        children: activity.createTextSpanList(
                          context,
                          onMediaClick: () {
                            onMediaClick?.call(activity.media.id);
                          },
                        ),
                      ),
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
                            child: onBuildActivityStatusWidget(activity.id),
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
    final timeUntilNowDuration = DateTime.now().difference(
        DateTime.fromMillisecondsSinceEpoch(activity.createdAt * 1000));
    final timeUntilNowString =
        '${TimeUtil.getFormattedDuration(timeUntilNowDuration)} ago';
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
                  const Expanded(child: SizedBox()),
                  Opacity(
                    opacity: 0.7,
                    child: Text(
                      timeUntilNowString,
                      style: textTheme.labelSmall!,
                    ),
                  ),
                  const SizedBox(width: 16)
                ],
              ),
            ),
            const SizedBox(height: 8),
            AfHtmlWidget(
              html: activity.text,
              textStyle: textTheme.bodyMedium!
                  .copyWith(color: colorScheme.onSurfaceVariant),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: onBuildActivityStatusWidget(activity.id),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

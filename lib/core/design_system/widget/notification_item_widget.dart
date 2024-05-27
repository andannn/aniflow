import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/core/common/util/time_util.dart';
import 'package:aniflow/core/data/model/notification_model.dart';
import 'package:aniflow/core/design_system/widget/af_network_image.dart';
import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem(
      {required this.model,
      required this.onCoverImageClick,
      required this.onNotificationClick,
      super.key});

  final NotificationModel model;
  final VoidCallback onCoverImageClick;
  final VoidCallback onNotificationClick;

  ColorScheme _colorScheme(BuildContext context) =>
      Theme.of(context).colorScheme;

  TextStyle? _contentTextStyle(BuildContext context) => Theme.of(context)
      .textTheme
      .labelLarge!
      .copyWith(color: _colorScheme(context).onSurfaceVariant);

  @override
  Widget build(BuildContext context) {
    final notification = model;
    final textTheme = Theme.of(context).textTheme;
    final timeUntilNowDuration = DateTime.now().difference(
        DateTime.fromMillisecondsSinceEpoch(notification.createdAt * 1000));
    final timeUntilNowString =
        '${TimeUtil.getFormattedDuration(context, timeUntilNowDuration)} ago';

    Widget buildContentRow() => switch (notification) {
          AiringNotification() =>
            _buildAiringNotificationContent(context, notification),
          FollowNotification() =>
            _buildFollowNotificationContent(context, notification),
          ActivityNotification() =>
            _buildActivityNotificationContent(context, notification),
          MediaNotification() =>
            _buildMediaNotificationContent(context, notification),
          MediaDeletionNotification() =>
            Text(notification.runtimeType.toString()),
        };

    String getCoverImageUrl() => switch (notification) {
          AiringNotification() => notification.media.coverImage?.large ?? '',
          FollowNotification() => notification.user.avatar,
          ActivityNotification() => notification.user.avatar,
          MediaNotification() => notification.media.coverImage?.large ?? '',
          MediaDeletionNotification() => ''
        };

    return Card.filled(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onNotificationClick,
        child: IntrinsicHeight(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Opacity(
                    opacity: 0.7,
                    child: Text(
                      timeUntilNowString,
                      style: textTheme.labelSmall!,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    // compile error if no set this height.
                    // ignore: lines_longer_than_80_chars
                    // this height value will no take effect because we have set the IntrinsicHeight
                    height: 1,
                    width: 85,
                    child: InkWell(
                      onTap: onCoverImageClick,
                      child: AFNetworkImage(
                        imageUrl: getCoverImageUrl(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 1,
                    child: Container(
                      constraints: const BoxConstraints(minHeight: 85),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24.0),
                          child: buildContentRow(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAiringNotificationContent(
      BuildContext context, AiringNotification notification) {
    return RichText(
      text: TextSpan(
        style: _contentTextStyle(context),
        children: notification.createTextSpanList(
          context,
          onMediaTextClick: onCoverImageClick,
        ),
      ),
    );
  }

  Widget _buildFollowNotificationContent(
      BuildContext context, FollowNotification notification) {
    return RichText(
      text: TextSpan(
        style: _contentTextStyle(context),
        children: notification.createTextSpanList(
          context,
          onUserTextClick: onCoverImageClick,
        ),
      ),
    );
  }

  Widget _buildActivityNotificationContent(
      BuildContext context, ActivityNotification notification) {
    return RichText(
      text: TextSpan(
        style: _contentTextStyle(context),
        children: notification.createTextSpanList(
          context,
          onUserTextClick: onCoverImageClick,
        ),
      ),
    );
  }

  Widget _buildMediaNotificationContent(
      BuildContext context, MediaNotification notification) {
    Widget createContentText() {
      return RichText(
        text: TextSpan(
          style: _contentTextStyle(context),
          children: notification.createTextSpanList(
            context,
            onUserTextClick: onCoverImageClick,
          ),
        ),
      );
    }

    if (notification is MediaDataChangeNotification) {
      return Column(
        children: [
          createContentText(),
          _ShowReasonButton(reason: notification.reason)
        ],
      );
    } else {
      return createContentText();
    }
  }
}

class _ShowReasonButton extends StatefulWidget {
  const _ShowReasonButton({required this.reason});

  final String reason;

  @override
  State<_ShowReasonButton> createState() => _ShowReasonButtonState();
}

class _ShowReasonButtonState extends State<_ShowReasonButton> {
  var isShowing = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 8),
        isShowing
            ? Text(widget.reason, style: Theme.of(context).textTheme.labelSmall)
            : const SizedBox(),
        Row(
          children: [
            InkWell(
              customBorder: const StadiumBorder(),
              onTap: () {
                setState(() {
                  isShowing = !isShowing;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  isShowing ? 'Hide reason..' : 'Show reason..',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

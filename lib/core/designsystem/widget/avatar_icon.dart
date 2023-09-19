import 'package:flutter/cupertino.dart';

import 'package:anime_tracker/core/designsystem/widget/af_network_image.dart';

Widget buildAvatarIcon(BuildContext context, String avatarUrl) {
  return Container(
    width: 48,
    height: 48,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
    ),
    clipBehavior: Clip.hardEdge,
    child: AFNetworkImage(
      imageUrl: avatarUrl,
    ),
  );
}

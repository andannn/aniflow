import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import 'image_load_error_widget.dart';

Widget buildAvatarIcon(BuildContext context, String avatarUrl) {
  return Container(
    width: 48,
    height: 48,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
    ),
    clipBehavior: Clip.hardEdge,
    child: CachedNetworkImage(
      imageUrl: avatarUrl,
      errorWidget: buildErrorWidget,
    ),
  );
}

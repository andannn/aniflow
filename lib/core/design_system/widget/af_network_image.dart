import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class AFNetworkImage extends StatefulWidget {
  const AFNetworkImage(
      {required this.imageUrl, super.key, this.width, this.height});

  final String imageUrl;
  final double? width;
  final double? height;

  @override
  State<AFNetworkImage> createState() => _AFNetworkImageState();
}

class _AFNetworkImageState extends State<AFNetworkImage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        int? cacheWidthInPixel;
        final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
        if (constraints.hasBoundedWidth) {
          cacheWidthInPixel = (constraints.maxWidth * devicePixelRatio).toInt();
        }
        return CachedNetworkImage(
          imageUrl: widget.imageUrl,
          width: widget.width,
          height: widget.height,
          memCacheWidth: cacheWidthInPixel,
          fit: BoxFit.cover,
          errorWidget: _buildErrorWidget,
          placeholder: buildPlaceHolderWidget,
          cacheManager: CustomCacheManager(),
        );
      },
    );
  }

  Widget _buildErrorWidget(BuildContext context, String url, Object error) {
    return Container(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
    );
  }

  Widget buildPlaceHolderWidget(BuildContext context, String url) {
    return Container(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
    );
  }
}

class CustomCacheManager extends CacheManager with ImageCacheManager {
  static const key = 'customCachedImageData';

  static final CustomCacheManager _instance = CustomCacheManager._();

  factory CustomCacheManager() {
    return _instance;
  }

  CustomCacheManager._() : super(Config(key));
}

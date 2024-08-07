import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class AFNetworkImage extends StatelessWidget {
  const AFNetworkImage(
      {required this.imageUrl,
      super.key,
      this.width,
      this.height,
      this.fit = BoxFit.cover});

  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
// TODO: set memCacheWidth will cause image flicker when using Hero animation.
//      int? cacheWidthInPixel;
//      final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
//      if (constraints.hasBoundedWidth) {
//        cacheWidthInPixel = (constraints.maxWidth * devicePixelRatio).toInt();
//      }
        return CachedNetworkImage(
          imageUrl: imageUrl,
          width: width,
          height: height,
//        memCacheWidth: cacheWidthInPixel,
          fit: fit,
          errorWidget: _buildErrorWidget,
          placeholder: _buildPlaceHolderWidget,
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

  Widget _buildPlaceHolderWidget(BuildContext context, String url) {
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

import 'package:anime_tracker/core/designsystem/widget/image_load_error_widget.dart';
import 'package:anime_tracker/core/designsystem/widget/image_load_initial_widget.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import 'package:anime_tracker/core/common/global_static_constants.dart';

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
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Config.defaultAnimationDuration,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ExtendedImage.network(
      widget.imageUrl,
      width: widget.width,
      height: widget.height,
      fit: BoxFit.cover,
      clearMemoryCacheWhenDispose: true,
      loadStateChanged: (ExtendedImageState state) {
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            _controller.reset();
            return buildImageInitialWidget(context);
          case LoadState.completed:
            _controller.forward();
            return FadeTransition(
              opacity: _controller,
              child: state.completedWidget,
            );
          case LoadState.failed:
            _controller.reset();
            return buildErrorWidget(context);
        }
      },
    );
  }
}
import 'package:aniflow/app/routing/root_router_delegate.dart';
import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/design_system/widget/af_network_image.dart';
import 'package:aniflow/core/design_system/widget/popup_menu_anchor.dart';
import 'package:aniflow/core/design_system/widget/vertical_animated_scale_switcher.dart';
import 'package:aniflow/feature/image_preview/preview_source.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:platform_downloader/platform_downloader.dart';

class ImagePreviewPage extends Page {
  final PreviewSource source;

  const ImagePreviewPage({required this.source, super.key, super.onPopInvoked});

  @override
  Route createRoute(BuildContext context) {
    return ImagePreviewRoute(settings: this, source: source);
  }
}

class ImagePreviewRoute extends PageRoute with MaterialRouteTransitionMixin {
  ImagePreviewRoute({
    super.settings,
    required this.source,
  }) : super(allowSnapshotting: false);

  final PreviewSource source;

  @override
  Widget buildContent(BuildContext context) {
    return _ImagePreviewContentWidget(source);
  }

  @override
  bool get maintainState => false;
}

class _ImagePreviewContentWidget extends StatefulWidget {
  const _ImagePreviewContentWidget(this.source);

  final PreviewSource source;

  @override
  State<_ImagePreviewContentWidget> createState() =>
      _ImagePreviewContentWidgetState();
}

class _ImagePreviewContentWidgetState
    extends State<_ImagePreviewContentWidget> {
  var _isImmersiveMode = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: _onImageCLick,
              child: Container(
                color: Colors.transparent,
                child: Center(
                  child: Hero(
                    tag: widget.source,
                    child: CachedNetworkImage(
                      imageUrl: widget.source.imageUrl,
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                      cacheManager: CustomCacheManager(),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 12,
            top: 48,
            child: AnimatedFadeSwitcher(
              visible: !_isImmersiveMode,
              builder: () => IconButton(
                onPressed: () {
                  RootRouterDelegate.get().popRoute();
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ),
          ),
          Positioned(
            right: 12,
            top: 48,
            child: AnimatedFadeSwitcher(
              visible: !_isImmersiveMode,
              builder: () => PopupMenuAnchor(
                menuItems: const ['Save'],
                builder: (context, controller, child) {
                  return IconButton(
                    onPressed: () {
                      if (controller.isOpen) {
                        controller.close();
                      } else {
                        controller.open();
                      }
                    },
                    icon: const Icon(Icons.more_horiz),
                  );
                },
                menuItemBuilder: (context, item) {
                  return MenuItemButton(
                    child: Container(
                      constraints: const BoxConstraints(minWidth: 120),
                      child: Text(item),
                    ),
                    onPressed: () {
                      if (item == 'Save') {
                        PlatformDownloader().downloadImageToExternalStorage(
                            widget.source.imageUrl,
                            AfConfig.imageDownloadFolder,
                            widget.source.savedFileTitle);
                      }
                    },
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onImageCLick() {
    setState(() {
      _isImmersiveMode = !_isImmersiveMode;

      if (_isImmersiveMode) {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      } else {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      }
    });
  }
}

import 'package:aniflow/app/routing/root_router_delegate.dart';
import 'package:aniflow/app/routing/root_router_info_parser.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/design_system/widget/af_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:fwfh_cached_network_image/fwfh_cached_network_image.dart';

class AfHtmlWidget extends StatelessWidget {
  const AfHtmlWidget({super.key, required this.html, this.textStyle});

  static const String _tag = 'AfHtmlWidget';

  final String html;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return HtmlWidget(
      html,
      textStyle: textStyle,
      factoryBuilder: () => CustomWidgetFactory(),
      onTapUrl: (uri) {
        final newRouteOrNull =
            RootRouterInfoParser.parseRoutePath(Uri.parse(uri));

        if (newRouteOrNull != null) {
          logger.d('$_tag url handled by app navigator. $newRouteOrNull');
          RootRouterDelegate.of().setNewRoutePath(newRouteOrNull);
          return true;
        }

        return false;
      },
    );
  }
}

class CustomWidgetFactory extends WidgetFactory with CachedNetworkImageFactory {
  @override
  CacheManager get cacheManager => CustomCacheManager();
}

import 'dart:async';

import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/data/playable_source_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';


class PlayableSourceFetcher extends StatefulWidget {
  const PlayableSourceFetcher(
      {super.key,
        required this.webPageUri,
        required this.source,
        required this.onUrlFetched, required this.onTimeOut});

  final String webPageUri;
  final MediaSource source;
  final Function(String url) onUrlFetched;
  final Function() onTimeOut;

  @override
  State<PlayableSourceFetcher> createState() => _PlayableSourceFetcherState();
}

class _PlayableSourceFetcherState extends State<PlayableSourceFetcher> {

  late Timer timer;
  @override
  void initState() {
    timer = Timer(const Duration(seconds: 30), () {
      widget.onTimeOut();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchConfig = widget.source.toConfig();
    return IgnorePointer(
      child: Opacity(
        opacity: 0,
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: WebUri(widget.webPageUri),
          ),
          onLoadResource: (controller, resource) {
            final matchedNested = RegExp(searchConfig.matcher.matchNestedUrl)
                .firstMatch(resource.url?.rawValue ?? "") !=
                null;
            logger.d("resource matchedNested $matchedNested ${resource.url} ");
            if (matchedNested) {
              controller.loadUrl(urlRequest: URLRequest(url: resource.url));

              return;
            }

            final videoUrlMatched = RegExp(searchConfig.matcher.matchVideoUrl)
                .firstMatch(resource.url?.rawValue ?? "") !=
                null;
            logger
                .d("resource videoUrlMatched $videoUrlMatched ${resource.url}");
            if (videoUrlMatched) {
              widget.onUrlFetched(resource.url!.rawValue);
            }
          },
        ),
      ),
    );
  }
}

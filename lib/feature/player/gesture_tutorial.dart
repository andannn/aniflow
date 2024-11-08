import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayerPage extends Page {
  const FullScreenPlayerPage(
      {super.key, super.onPopInvoked, required this.source});

  final String source;

  @override
  Route createRoute(BuildContext context) {
    return FullScreenPlayerRoute(settings: this, source: source);
  }
}

class FullScreenPlayerRoute extends PageRoute
    with MaterialRouteTransitionMixin {
  FullScreenPlayerRoute({super.settings, required this.source})
      : super(allowSnapshotting: false);

  final String source;

  @override
  Widget buildContent(BuildContext context) {
    return ScaffoldMessenger(
      child: _FullScreenPlayer(
        title: "TODO:",
        datasource: source,
      ),
    );
  }

  @override
  bool get maintainState => true;
}

class _FullScreenPlayer extends StatelessWidget {
  const _FullScreenPlayer(
      {super.key, required this.title, required this.datasource});

  final String title;
  final String datasource;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Card.filled(
          clipBehavior: Clip.antiAlias,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: SizedBox(
            width: 300,
            height: 400,
            child: _AssetVideo(dataSource: datasource),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: Theme
                .of(context)
                .textTheme
                .bodyLarge,
          ),
        ),
      ],
    );
  }
}

class _AssetVideo extends StatefulWidget {
  const _AssetVideo({required this.dataSource});

  final String dataSource;

  @override
  _AssetVideoState createState() => _AssetVideoState();
}

class _AssetVideoState extends State<_AssetVideo> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.networkUrl(Uri.parse(widget.dataSource));

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(false);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: SizedBox(
        width: _controller.value.size.width,
        height: _controller.value.size.height,
        child: VideoPlayer(_controller),
      ),
    );
  }
}

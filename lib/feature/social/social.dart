import 'package:aniflow/feature/social/activity/activity.dart';
import 'package:flutter/material.dart';

class SocialPage extends Page {
  const SocialPage({super.key});

  @override
  Route createRoute(BuildContext context) {
    return SocialRoute(settings: this);
  }
}

class SocialRoute extends PageRoute with MaterialRouteTransitionMixin {
  SocialRoute({super.settings}): super(allowSnapshotting: false);

  @override
  Widget buildContent(BuildContext context) {
    return const Scaffold(
      body: _SocialPageContent(),
    );
  }

  @override
  bool get maintainState => true;
}

class _SocialPageContent extends StatelessWidget {
  const _SocialPageContent();

  @override
  Widget build(BuildContext context) {
    return const ActivityPage();
  }
}

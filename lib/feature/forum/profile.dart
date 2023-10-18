import 'package:anime_tracker/core/design_system/widget/comming_soon.dart';
import 'package:flutter/material.dart';

class ForumPage extends Page {
  const ForumPage({super.key});

  @override
  Route createRoute(BuildContext context) {
    return ProfileRoute(settings: this);
  }
}

class ProfileRoute extends PageRoute with MaterialRouteTransitionMixin {
  ProfileRoute({super.settings}): super(allowSnapshotting: false);

  @override
  Widget buildContent(BuildContext context) {
    return const Scaffold(
      body: _ForumPageContent(),
    );
  }

  @override
  bool get maintainState => true;
}

class _ForumPageContent extends StatelessWidget {
  const _ForumPageContent();

  @override
  Widget build(BuildContext context) {
    return const ComingSoonPage();
  }
}

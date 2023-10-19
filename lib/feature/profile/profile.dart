import 'package:aniflow/core/design_system/widget/comming_soon.dart';
import 'package:flutter/material.dart';

class ProfilePage extends Page {
  const ProfilePage({super.key});

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
      body: _ProfilePageContent(),
    );
  }

  @override
  bool get maintainState => true;
}

class _ProfilePageContent extends StatelessWidget {
  const _ProfilePageContent();

  @override
  Widget build(BuildContext context) {
    return const ComingSoonPage();
  }
}

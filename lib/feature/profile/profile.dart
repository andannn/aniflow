import 'package:flutter/material.dart';
import 'package:anime_tracker/core/designsystem/animetion/page_transaction_animetion.dart';

class ProfilePage extends Page {
  const ProfilePage({super.key});

  @override
  Route createRoute(BuildContext context) {
    return ProfileRoute(settings: this);
  }
}

class ProfileRoute extends PageRoute with MaterialRouteTransitionMixin {
  ProfileRoute({super.settings});

  @override
  Widget buildContent(BuildContext context) {
    return const Scaffold(
      body: _ProfilePageContent(),
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return getFistPageTransaction(
      animation: animation,
      child: getSecondaryPageTransaction(
        animation: secondaryAnimation,
        child: child,
      ),
    );
  }

  @override
  bool get maintainState => true;
}

class _ProfilePageContent extends StatelessWidget {
  const _ProfilePageContent();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

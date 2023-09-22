import 'package:anime_tracker/core/design_system/widget/comming_soon.dart';
import 'package:flutter/material.dart';
import 'package:anime_tracker/core/design_system/animetion/page_transaction_animetion.dart';

class AnimeTrackPage extends Page {
  const AnimeTrackPage({super.key});

  @override
  Route createRoute(BuildContext context) {
    return AnimeTrackRoute(settings: this);
  }
}

class AnimeTrackRoute extends PageRoute with MaterialRouteTransitionMixin {
  AnimeTrackRoute({super.settings});

  @override
  Widget buildContent(BuildContext context) {
    return const Scaffold(
      body: _AnimeTrackPageContent(),
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

class _AnimeTrackPageContent extends StatelessWidget {
  const _AnimeTrackPageContent();

  @override
  Widget build(BuildContext context) {
    return const ComingSoonPage();
  }
}

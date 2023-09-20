import 'package:anime_tracker/core/designsystem/widget/comming_soon.dart';
import 'package:flutter/material.dart';
import 'package:anime_tracker/core/designsystem/animetion/page_transaction_animetion.dart';

class AnimeSearchPage extends Page {
  const AnimeSearchPage({super.key});

  @override
  Route createRoute(BuildContext context) {
    return AnimeSearchRoute(settings: this);
  }
}

class AnimeSearchRoute extends PageRoute with MaterialRouteTransitionMixin {
  AnimeSearchRoute({super.settings});

  @override
  Widget buildContent(BuildContext context) {
    return const Scaffold(
      body: _AnimeSearchPageContent(),
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

class _AnimeSearchPageContent extends StatelessWidget {
  const _AnimeSearchPageContent();

  @override
  Widget build(BuildContext context) {
    return const ComingSoonPage();
  }
}

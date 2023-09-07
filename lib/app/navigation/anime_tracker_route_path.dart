import 'package:anime_tracker/app/navigation/top_level_navigation.dart';
import 'package:flutter/material.dart';

sealed class AnimeTrackerRoutePath {}

abstract class TopLevelRoutePath extends AnimeTrackerRoutePath {
  final TopLevelNavigation topLevel;

  TopLevelRoutePath(this.topLevel);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TopLevelRoutePath &&
          runtimeType == other.runtimeType &&
          topLevel == other.topLevel;

  @override
  int get hashCode => topLevel.hashCode;
}

class ForYouRoutePath extends TopLevelRoutePath {
  ForYouRoutePath() : super(TopLevelNavigation.forYou);
}

class BookMarkedRoutePath extends TopLevelRoutePath {
  BookMarkedRoutePath() : super(TopLevelNavigation.bookMark);
}

class InterestsRoutePath extends TopLevelRoutePath {
  InterestsRoutePath() : super(TopLevelNavigation.interests);
}

class TopicRoutePath extends AnimeTrackerRoutePath {
  TopicRoutePath(this.topicId);
  final String topicId;
}

extension AnimeTrackerRoutePathEx on AnimeTrackerRoutePath {
  Page generatePage() {
    // if (this is ForYouRoutePath) {
    //   return forYouPage;
    // } else if (this is BookMarkedRoutePath) {
    //   return bookMarkedPage;
    // } else if (this is InterestsRoutePath) {
    //   return interestsPage;
    // } else if (this is TopicRoutePath) {
    //   return createTopicPage((this as TopicRoutePath).topicId);
    // }else {
      return const MaterialPage(child: SizedBox());
    // }
  }
}
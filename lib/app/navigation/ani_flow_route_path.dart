import 'package:aniflow/app/navigation/top_level_navigation.dart';
import 'package:aniflow/core/common/model/anime_category.dart';
import 'package:aniflow/feature/airing_schedule/airing_schedule.dart';
import 'package:aniflow/feature/anime_search/media_search.dart';
import 'package:aniflow/feature/character_page/character_page.dart';
import 'package:aniflow/feature/detail_media/detail_media.dart';
import 'package:aniflow/feature/discover/discover.dart';
import 'package:aniflow/feature/forum/profile.dart';
import 'package:aniflow/feature/media_page/media_page.dart';
import 'package:aniflow/feature/media_track/media_track.dart';
import 'package:aniflow/feature/profile/profile.dart';
import 'package:aniflow/feature/staff_page/staff_page.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

sealed class AniFlowRoutePath extends Equatable {
  const AniFlowRoutePath({this.isFullScreen = false});

  final bool isFullScreen;

  @override
  List<Object?> get props => [];
}

abstract class TopLevelRoutePath extends AniFlowRoutePath {
  final TopLevelNavigation topLevel;

  const TopLevelRoutePath(this.topLevel);

  @override
  List<Object?> get props => [topLevel];
}

class DiscoverRoutePath extends TopLevelRoutePath {
  const DiscoverRoutePath() : super(TopLevelNavigation.discover);
}

class TrackRoutePath extends TopLevelRoutePath {
  const TrackRoutePath() : super(TopLevelNavigation.track);
}

class ForumRoutePath extends TopLevelRoutePath {
  const ForumRoutePath() : super(TopLevelNavigation.forum);
}

class ProfileRoutePath extends TopLevelRoutePath {
  const ProfileRoutePath() : super(TopLevelNavigation.profile);
}

class SearchRoutePath extends AniFlowRoutePath {
  const SearchRoutePath() : super(isFullScreen: true);
}

class AnimeListRoutePath extends AniFlowRoutePath {
  const AnimeListRoutePath(this.category) : super(isFullScreen: true);

  final MediaCategory category;

  @override
  List<Object?> get props => [category];
}

class CharacterListRoutePath extends AniFlowRoutePath {
  const CharacterListRoutePath(this.characterId) : super(isFullScreen: true);

  final String characterId;

  @override
  List<Object?> get props => [characterId];
}

class StaffListRoutePath extends AniFlowRoutePath {
  const StaffListRoutePath(this.staffId) : super(isFullScreen: true);

  final String staffId;

  @override
  List<Object?> get props => [staffId];
}

class DetailAnimeRoutePath extends AniFlowRoutePath {
  const DetailAnimeRoutePath(this.animeId) : super(isFullScreen: true);

  final String animeId;

  @override
  List<Object?> get props => [animeId];
}

class AiringScheduleRoutePath extends AniFlowRoutePath {
  const AiringScheduleRoutePath() : super(isFullScreen: true);
}

extension AniFlowRoutePathEx on AniFlowRoutePath {
  Page generatePage() {
    switch (this) {
      case DiscoverRoutePath(topLevel: final _):
        return const DiscoverPage(key: ValueKey('DiscoverPage'));
      case AnimeListRoutePath(category: final category):
        return MediaListPage(
          key: ValueKey('AnimeListPage_$category'),
          category: category,
        );
      case CharacterListRoutePath(characterId: final animeId):
        return CharacterListPage(
          key: ValueKey('CharacterListPage_$animeId'),
          animeId: animeId,
        );
      case StaffListRoutePath(staffId: final animeId):
        return StaffListPage(
          key: ValueKey('StaffListPage_$animeId'),
          animeId: animeId,
        );
      case DetailAnimeRoutePath(animeId: final animeId):
        return DetailAnimePage(
          key: ValueKey('DetailAnimeRoute_$animeId'),
          animeId: animeId,
        );
      case TrackRoutePath(topLevel: final _):
        return const AnimeTrackPage(key: ValueKey('AnimeTrackPage'));
      case ForumRoutePath(topLevel: final _):
        return const ForumPage(key: ValueKey('ForumPage'));
      case ProfileRoutePath(topLevel: final _):
        return const ProfilePage(key: ValueKey('ProfilePage'));
      case AiringScheduleRoutePath():
        return const AiringSchedule(key: ValueKey('AiringSchedule'));
      case SearchRoutePath():
        return const SearchPage(key: ValueKey('SearchPage'));
      default:
        return const MaterialPage(child: SizedBox());
    }
  }
}

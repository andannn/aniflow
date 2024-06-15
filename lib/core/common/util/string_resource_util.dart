import 'dart:convert';

import 'package:aniflow/core/common/definitions/activity_filter_type.dart';
import 'package:aniflow/core/common/definitions/anime_season.dart';
import 'package:aniflow/core/common/definitions/anime_source.dart';
import 'package:aniflow/core/common/definitions/character_role.dart';
import 'package:aniflow/core/common/definitions/favorite_category.dart';
import 'package:aniflow/core/common/definitions/media_category.dart';
import 'package:aniflow/core/common/definitions/media_format.dart';
import 'package:aniflow/core/common/definitions/media_list_status.dart';
import 'package:aniflow/core/common/definitions/media_relation.dart';
import 'package:aniflow/core/common/definitions/media_sort.dart';
import 'package:aniflow/core/common/definitions/media_status.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/definitions/staff_language.dart';
import 'package:aniflow/core/common/setting/user_title_language.dart';
import 'package:aniflow/core/common/util/time_util.dart';
import 'package:aniflow/core/data/model/activity_model.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/media_title_model.dart';
import 'package:aniflow/core/data/model/notification_model.dart';
import 'package:aniflow/core/data/notification_repository.dart';
import 'package:aniflow/feature/profile/profile_tab_category.dart';
import 'package:aniflow/feature/search/bloc/search_type.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension BuildContextEx on BuildContext {
  AppLocalizations get appLocal => AppLocalizations.of(this)!;

  MaterialLocalizations get materialLocal => MaterialLocalizations.of(this);
}

extension AnimeSourceEx on AnimeSource {
  String translated(BuildContext context) => switch (this) {
        AnimeSource.original => context.appLocal.originalAnimation,
        AnimeSource.manga => context.appLocal.mangaAnimation,
        AnimeSource.lightNovel => context.appLocal.lightNovelAnimation,
        AnimeSource.visualNovel => context.appLocal.visualNovelAnimation,
        AnimeSource.videoGame => context.appLocal.videoGameAnimation,
        AnimeSource.other => context.appLocal.otherAnimation,
      };
}

extension AnimeSeasonEx on AnimeSeason {
  String translated(BuildContext context) => switch (this) {
        AnimeSeason.winter => context.appLocal.winter,
        AnimeSeason.spring => context.appLocal.spring,
        AnimeSeason.summer => context.appLocal.summer,
        AnimeSeason.fall => context.appLocal.autumn,
      };
}

extension AnimeStatusEx on MediaStatus {
  String translated(BuildContext context) => switch (this) {
        MediaStatus.releasing => context.appLocal.animeReleasing,
        MediaStatus.finished => context.appLocal.animeFinished,
        MediaStatus.notYetReleased => context.appLocal.animeNotYetReleased,
        MediaStatus.cancelled => context.appLocal.cancelled,
        MediaStatus.hiatus => context.appLocal.hiatus,
      };
}

extension CharacterRoleEx on CharacterRole {
  String translated(BuildContext context) => switch (this) {
        CharacterRole.main => context.appLocal.mainCharacter,
        CharacterRole.supporting => context.appLocal.supportingCharacter,
        CharacterRole.background => context.appLocal.backgroundCharacter,
      };
}

extension ActivityFilterTypeEx on ActivityFilterType {
  String translated(BuildContext context) => switch (this) {
        ActivityFilterType.all => context.appLocal.all,
        ActivityFilterType.text => context.appLocal.text,
        ActivityFilterType.list => context.appLocal.list,
      };
}

extension NotificationCategoryEx on NotificationCategory {
  String translated(BuildContext context) => switch (this) {
        NotificationCategory.all => context.appLocal.all,
        NotificationCategory.airing => context.appLocal.airing,
        NotificationCategory.activity => context.appLocal.activity,
        NotificationCategory.follows => context.appLocal.follows,
        NotificationCategory.media => context.appLocal.media,
      };
}

extension StaffLanguageEx on StaffLanguage {
  String translated(BuildContext context) => switch (this) {
        StaffLanguage.japanese => context.appLocal.japanese,
        StaffLanguage.english => context.appLocal.english,
        StaffLanguage.korean => context.appLocal.korean,
        StaffLanguage.french => context.appLocal.french,
        StaffLanguage.german => context.appLocal.german,
        StaffLanguage.italian => context.appLocal.italian,
        StaffLanguage.spanish => context.appLocal.spanish,
        StaffLanguage.portuguese => context.appLocal.portuguese,
        StaffLanguage.hebrew => context.appLocal.hebrew,
        StaffLanguage.hungarian => context.appLocal.hungarian,
      };
}

extension MediaSortEx on MediaSort {
  String translated(BuildContext context) => switch (this) {
        MediaSort.trending => context.appLocal.trending,
        MediaSort.newest => context.appLocal.newest,
        MediaSort.oldest => context.appLocal.oldest,
        MediaSort.averageScore => context.appLocal.averageScore,
        MediaSort.favorite => context.appLocal.favorite,
        MediaSort.popularity => context.appLocal.popularity,
      };
}

extension SearchTypeEx on SearchType {
  String translated(BuildContext context) => switch (this) {
        SearchType.anime => context.appLocal.animeLabel,
        SearchType.manga => context.appLocal.mangaLabel,
        SearchType.character => context.appLocal.characters,
        SearchType.staff => context.appLocal.staff,
        SearchType.studio => context.appLocal.studio,
        SearchType.user => context.appLocal.user,
      };
}

extension MediaRelationEx on MediaRelation {
  String translated(BuildContext context) => switch (this) {
        MediaRelation.adaption => context.appLocal.adaption,
        MediaRelation.preQuel => context.appLocal.preQuel,
        MediaRelation.sequel => context.appLocal.sequel,
        MediaRelation.parent => context.appLocal.sideStory,
        MediaRelation.sideStory => context.appLocal.sideStory,
        MediaRelation.character => context.appLocal.sharedCharacter,
        MediaRelation.summary => context.appLocal.summaryVersion,
        MediaRelation.alternative => context.appLocal.alternative,
        MediaRelation.spinOff => context.appLocal.spinOff,
        MediaRelation.other => context.appLocal.other,
        MediaRelation.source => context.appLocal.other,
        MediaRelation.compilation => context.appLocal.other,
        MediaRelation.contains => context.appLocal.other,
      };
}

extension ProfileTabTypeEx on ProfileTabType {
  String translated(BuildContext context) => switch (this) {
        ProfileTabType.activity => context.appLocal.activity,
        ProfileTabType.favorite => context.appLocal.favorite,
        ProfileTabType.animeList => context.appLocal.animeList,
        ProfileTabType.mangaList => context.appLocal.mangaList,
        ProfileTabType.stats => context.appLocal.stats,
      };
}

extension MediaCategoryEx on MediaCategory {
  String translated(BuildContext context) => switch (this) {
        MediaCategory.currentSeasonAnime =>
          context.appLocal.popularThisSeasonLabel,
        MediaCategory.nextSeasonAnime =>
          context.appLocal.upComingNextSeasonLabel,
        MediaCategory.trendingAnime => context.appLocal.trendingNowLabel,
        MediaCategory.movieAnime => context.appLocal.movieLabel,
        MediaCategory.trendingManga => context.appLocal.trendingNowLabel,
        MediaCategory.allTimePopularManga => context.appLocal.allTimePopular,
        MediaCategory.topManhwa => context.appLocal.topManhwa,
      };
}

extension FavoriteTypeEx on FavoriteType {
  String translated(BuildContext context) => switch (this) {
        FavoriteType.anime => context.appLocal.animeLabel,
        FavoriteType.manga => context.appLocal.mangaAnimation,
        FavoriteType.character => context.appLocal.characters,
        FavoriteType.staff => context.appLocal.staff,
      };
}

extension MediaListStatusEx on MediaListStatus {
  String translated(BuildContext context) => switch (this) {
        MediaListStatus.current => context.appLocal.current,
        MediaListStatus.completed => context.appLocal.completed,
        MediaListStatus.dropped => context.appLocal.dropped,
        MediaListStatus.paused => context.appLocal.paused,
        MediaListStatus.planning => context.appLocal.planning,
      };
}

extension MediaFormatEx on MediaFormat {
  String translated(BuildContext context) => switch (this) {
        MediaFormat.tv => context.appLocal.animeLabel,
        MediaFormat.tvShort => 'Short Anime',
        MediaFormat.movie => 'Movie',
        MediaFormat.special => 'DVD Special',
        MediaFormat.ova => 'OVA',
        MediaFormat.ona => 'ONA',
        MediaFormat.music => 'Music',
        MediaFormat.manga => context.appLocal.mangaLabel,
        MediaFormat.novel => 'Novel',
        MediaFormat.oneShot => 'One Shot',
      };
}

extension AnimeModelEx on MediaModel {
  String getMediaInfoString(BuildContext context) {
    final itemList = <String>[];
    if (format != null) {
      String extra = '';
      if (type == MediaType.anime && source != null) {
        extra = '(${source!.translated(context)})';
      }

      itemList.add('${format!.translated(context)}$extra');
    }

    if (seasonYear != null && season != null) {
      itemList.add('$seasonYear${season!.translated(context)}');
    }

    if (episodes != null &&
        episodes != 0 &&
        (format == MediaFormat.manga ||
            format == MediaFormat.tv ||
            format == MediaFormat.ova ||
            format == MediaFormat.ona)) {
      itemList.add('$episodes${context.appLocal.episodes}');
    }

    if (status != null) {
      itemList.add(status!.translated(context));
    }

    final result = itemList.join(' · ');
    return result.isEmpty ? '----' : result;
  }

  String getReleasingTimeString(BuildContext context) {
    if (nextAiringEpisode == null || timeUntilAiring == null) {
      return '';
    }
    final airingTimeString = TimeUtil.getFormattedDuration(
        context, TimeUtil.durationFromSeconds(timeUntilAiring!));
    if (airingTimeString == null) {
      return '';
    }
    return airingTimeString;
  }
}

extension AiringNotificationEx on AiringNotification {
  List<TextSpan> createTextSpanList(BuildContext buildContext,
      {required VoidCallback onMediaTextClick}) {
    final List contextList = jsonDecode(context);
    final colorScheme = Theme.of(buildContext).colorScheme;
    return [
      TextSpan(text: '${contextList[0]} $episode ${contextList[1]}'),
      TextSpan(
        text: media.title?.native,
        style: TextStyle(color: colorScheme.tertiary),
        recognizer: TapGestureRecognizer()..onTap = onMediaTextClick,
      ),
      TextSpan(text: contextList[2]),
    ];
  }
}

extension FollowNotificationEx on FollowNotification {
  List<TextSpan> createTextSpanList(BuildContext buildContext,
      {required VoidCallback onUserTextClick}) {
    final colorScheme = Theme.of(buildContext).colorScheme;
    return [
      TextSpan(
        text: user.name,
        style: TextStyle(color: colorScheme.tertiary),
        recognizer: TapGestureRecognizer()..onTap = onUserTextClick,
      ),
      TextSpan(text: context),
    ];
  }
}

extension ActivityNotificationEx on ActivityNotification {
  List<TextSpan> createTextSpanList(BuildContext buildContext,
      {required VoidCallback onUserTextClick}) {
    final colorScheme = Theme.of(buildContext).colorScheme;
    return [
      TextSpan(
        text: user.name,
        style: TextStyle(color: colorScheme.tertiary),
        recognizer: TapGestureRecognizer()..onTap = onUserTextClick,
      ),
      TextSpan(text: context),
    ];
  }
}

extension MediaNotificationEx on MediaNotification {
  List<TextSpan> createTextSpanList(BuildContext buildContext,
      {required VoidCallback onUserTextClick}) {
    final colorScheme = Theme.of(buildContext).colorScheme;
    return [
      TextSpan(
        text: media.title?.native,
        style: TextStyle(color: colorScheme.tertiary),
        recognizer: TapGestureRecognizer()..onTap = onUserTextClick,
      ),
      TextSpan(text: context),
    ];
  }
}

extension ListActivityModelEx on ListActivityModel {
  List<TextSpan> createTextSpanList(
      BuildContext buildContext, UserTitleLanguage userTitleLanguage,
      {required VoidCallback onMediaClick}) {
    final colorScheme = Theme.of(buildContext).colorScheme;
    return [
      TextSpan(text: '${status.toString()} $progress of '),
      TextSpan(
        text: media!.title!.getTitle(userTitleLanguage),
        style: TextStyle(color: colorScheme.tertiary),
        recognizer: TapGestureRecognizer()..onTap = onMediaClick,
      ),
    ];
  }
}

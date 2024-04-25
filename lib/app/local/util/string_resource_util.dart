import 'dart:convert';

import 'package:aniflow/app/local/ani_flow_localizations.dart';
import 'package:aniflow/core/common/definitions/activity_filter_type.dart';
import 'package:aniflow/core/common/definitions/anime_season.dart';
import 'package:aniflow/core/common/definitions/anime_source.dart';
import 'package:aniflow/core/common/definitions/character_role.dart';
import 'package:aniflow/core/common/definitions/media_status.dart';
import 'package:aniflow/core/common/definitions/staff_language.dart';
import 'package:aniflow/core/common/setting/user_title_language.dart';
import 'package:aniflow/core/common/util/time_util.dart';
import 'package:aniflow/core/data/model/activity_model.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/media_title_model.dart';
import 'package:aniflow/core/data/model/notification_model.dart';
import 'package:aniflow/core/data/notification_repository.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

extension AnimeSourceEx on AnimeSource {
  String getAnimeSourceString(BuildContext context) {
    switch (this) {
      case AnimeSource.original:
        return AFLocalizations.of(context).originalAnimation;
      case AnimeSource.manga:
        return AFLocalizations.of(context).mangaAnimation;
      case AnimeSource.lightNovel:
        return AFLocalizations.of(context).lightNovelAnimation;
      case AnimeSource.visualNovel:
        return AFLocalizations.of(context).visualNovelAnimation;
      case AnimeSource.videoGame:
        return AFLocalizations.of(context).videoGameAnimation;
      case AnimeSource.other:
        return AFLocalizations.of(context).otherAnimation;
    }
  }
}

extension AnimeSeasonEx on AnimeSeason {
  String getAnimeSeasonString(BuildContext context) {
    switch (this) {
      case AnimeSeason.winter:
        return AFLocalizations.of(context).winter;
      case AnimeSeason.spring:
        return AFLocalizations.of(context).spring;
      case AnimeSeason.summer:
        return AFLocalizations.of(context).summer;
      case AnimeSeason.fall:
        return AFLocalizations.of(context).fail;
    }
  }
}

extension AnimeStatusEx on MediaStatus {
  String getAnimeStatusString(BuildContext context) {
    switch (this) {
      case MediaStatus.releasing:
        return AFLocalizations.of(context).animeReleasing;
      case MediaStatus.finished:
        return AFLocalizations.of(context).animeFinished;
      case MediaStatus.notYetReleased:
        return AFLocalizations.of(context).animeNotYetReleased;
      case MediaStatus.cancelled:
        return 'Canceled';
      case MediaStatus.hiatus:
        return 'Hiatus';
    }
  }
}

extension CharacterRoleEx on CharacterRole {
  String getCharacterRoleString(BuildContext context) {
    switch (this) {
      case CharacterRole.main:
        return AFLocalizations.of(context).mainCharacter;
      case CharacterRole.supporting:
        return AFLocalizations.of(context).supportingCharacter;
      case CharacterRole.background:
        return AFLocalizations.of(context).backgroundCharacter;
    }
  }
}

extension AnimeModelEx on MediaModel {
  String getAnimeInfoString(BuildContext context) {
    final itemList = <String>[];
    if (seasonYear != null && season != null) {
      itemList.add('$seasonYear${season!.getAnimeSeasonString(context)}');
    }

    if (episodes != null) {
      itemList.add('$episodes${AFLocalizations.of(context).episodes}');
    }

    if (source != null) {
      itemList.add(source!.getAnimeSourceString(context));
    }

    if (status != null) {
      itemList.add(status!.getAnimeStatusString(context));
    }

    final result = itemList.join(' · ');
    return result.isEmpty ? '----' : result;
  }

  String getReleasingTimeString(BuildContext context) {
    if (nextAiringEpisode == null || timeUntilAiring == null) {
      return '';
    }
    final airingTimeString = TimeUtil.getFormattedDuration(
        TimeUtil.durationFromSeconds(timeUntilAiring!));
    if (airingTimeString == null) {
      return '';
    }
    return airingTimeString;
  }
}

extension ActivityFilterTypeEx on ActivityFilterType {
  String label(BuildContext context) => switch (this) {
        ActivityFilterType.all => 'All',
        ActivityFilterType.text => 'Text',
        ActivityFilterType.list => 'List',
      };
}

extension NotificationCategoryEx on NotificationCategory {
  String label(BuildContext context) => switch (this) {
        NotificationCategory.all => 'All',
        NotificationCategory.airing => 'Airing',
        NotificationCategory.activity => 'Activity',
        NotificationCategory.follows => 'Follows',
        NotificationCategory.media => 'Media',
      };
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

extension StaffLanguageEx on StaffLanguage {
  String label(BuildContext context) => switch (this) {
        StaffLanguage.japanese => 'Japanese',
        StaffLanguage.english => 'English',
        StaffLanguage.korean => 'Korean',
        StaffLanguage.french => 'French',
        StaffLanguage.german => 'German',
        StaffLanguage.italian => 'Italian',
        StaffLanguage.spanish => 'Spanish',
        StaffLanguage.portuguese => 'Portuguese',
        StaffLanguage.hebrew => 'Hebrew',
        StaffLanguage.hungarian => 'Hungarian',
      };
}

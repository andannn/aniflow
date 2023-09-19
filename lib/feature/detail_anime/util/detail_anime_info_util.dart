import 'package:anime_tracker/app/local/anime_tracker_localizations.dart';
import 'package:anime_tracker/core/data/model/anime_source.dart';
import 'package:anime_tracker/core/data/model/detail_anime_model.dart';
import 'package:anime_tracker/core/data/repository/ani_list_repository.dart';
import 'package:flutter/material.dart';

extension AnimeSourceEx on AnimeSource {
  String getAnimeSourceString(BuildContext context) {
    switch (this) {
      case AnimeSource.original:
        return ATLocalizations.of(context).originalAnimation;
      case AnimeSource.manga:
        return ATLocalizations.of(context).mangaAnimation;
      case AnimeSource.lightNovel:
        return ATLocalizations.of(context).lightNovelAnimation;
      case AnimeSource.visualNovel:
        return ATLocalizations.of(context).visualNovelAnimation;
      case AnimeSource.videoGame:
        return ATLocalizations.of(context).videoGameAnimation;
      case AnimeSource.other:
        return ATLocalizations.of(context).otherAnimation;
    }
  }
}

extension AnimeSeasonEx on AnimeSeason {
  String getAnimeSeasonString(BuildContext context) {
    switch (this) {
      case AnimeSeason.winter:
        return ATLocalizations.of(context).winter;
      case AnimeSeason.spring:
        return ATLocalizations.of(context).spring;
      case AnimeSeason.summer:
        return ATLocalizations.of(context).summer;
      case AnimeSeason.fall:
        return ATLocalizations.of(context).fail;
    }
  }
}

extension AnimeStatusEx on AnimeStatus {
  String getAnimeStatusString(BuildContext context) {
    switch (this) {
      case AnimeStatus.releasing:
        return ATLocalizations.of(context).animeReleasing;
      case AnimeStatus.finished:
        return ATLocalizations.of(context).animeFinished;
      case AnimeStatus.notYetReleased:
        return ATLocalizations.of(context).animeNotYetReleased;
    }
  }
}

extension CharacterRoleEx on CharacterRole {
  String getCharacterRoleString(BuildContext context) {
    switch (this) {
      case CharacterRole.main:
        return ATLocalizations.of(context).mainCharacter;
      case CharacterRole.supporting:
        return ATLocalizations.of(context).supportingCharacter;
      case CharacterRole.background:
        return ATLocalizations.of(context).backgroundCharacter;
    }
  }
}

extension DetailAnimeModelEx on DetailAnimeModel {
  String getAnimeInfoString(BuildContext context) {
    final itemList = <String>[];
    if (seasonYear != null && season != null) {
      itemList.add('$seasonYear${season!.getAnimeSeasonString(context)}');
    }

    if (episodes != null) {
      itemList.add('$episodes${ATLocalizations.of(context).episodes}');
    }

    if (source != null) {
      itemList.add(source!.getAnimeSourceString(context));
    }

    if (status != null) {
      itemList.add(status!.getAnimeStatusString(context));
    }

    return itemList.join(' · ');
  }
}

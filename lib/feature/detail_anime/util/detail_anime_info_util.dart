import 'package:anime_tracker/app/local/ani_flow_localizations.dart';
import 'package:anime_tracker/core/data/model/anime_source.dart';
import 'package:anime_tracker/core/data/model/detail_anime_model.dart';
import 'package:anime_tracker/core/data/repository/ani_list_repository.dart';
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

extension AnimeStatusEx on AnimeStatus {
  String getAnimeStatusString(BuildContext context) {
    switch (this) {
      case AnimeStatus.releasing:
        return AFLocalizations.of(context).animeReleasing;
      case AnimeStatus.finished:
        return AFLocalizations.of(context).animeFinished;
      case AnimeStatus.notYetReleased:
        return AFLocalizations.of(context).animeNotYetReleased;
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

extension DetailAnimeModelEx on DetailAnimeModel {
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

    return itemList.join(' · ');
  }
}

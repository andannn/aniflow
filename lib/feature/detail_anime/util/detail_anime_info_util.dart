import 'package:anime_tracker/app/local/anime_tracker_localizations.dart';
import 'package:anime_tracker/core/data/model/anime_source.dart';
import 'package:anime_tracker/core/data/model/detail_anime_model.dart';
import 'package:anime_tracker/core/data/repository/ani_list_repository.dart';
import 'package:flutter/material.dart';

extension AnimeSourceEx on AnimeSource {
  String getAnimeSourceString(BuildContext context) {
    switch (this) {
      case AnimeSource.original:
        return 'Original';
      case AnimeSource.manga:
        return 'Manga';
      case AnimeSource.lightNovel:
        return 'Light novel';
      case AnimeSource.visualNovel:
        return 'Visual Novel';
      case AnimeSource.videoGame:
        return 'Video game';
      case AnimeSource.other:
        return 'Other';
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

extension DetailAnimeModelEx on DetailAnimeModel {
  String getAnimeInfoString(BuildContext context) {
    if (seasonYear == null || season == null || episodes == null) {
      return '';
    }

    return '$seasonYear${season!.getAnimeSeasonString(context)} · ${source.getAnimeSourceString(context)} · $episodes-episodes';
  }
}

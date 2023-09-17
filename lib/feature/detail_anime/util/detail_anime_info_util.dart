import 'dart:ui';

import 'package:anime_tracker/core/data/model/anime_source.dart';
import 'package:anime_tracker/core/data/model/detail_anime_model.dart';

extension AnimeSourceEx on AnimeSource {
  String getAnimeSourceString(Locale locale) {
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

extension DetailAnimeModelEx on DetailAnimeModel {
  String getAnimeInfoString(Locale locale) {
    if (seasonYear == null || season == null || episodes == null) {
      return '';
    }

    return '$seasonYear · $season · ${source.getAnimeSourceString(locale)} · $episodes-episodes';
  }
}

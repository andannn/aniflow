import 'package:flutter/material.dart';

abstract class AnimeTrackerLocalizations {
  String get trendingNowLabel;
  String get popularThisSeasonLabel;
  String get upComingNextSeasonLabel;
  String get discover;

  static AnimeTrackerLocalizations of(BuildContext context) {
    return Localizations.of<AnimeTrackerLocalizations>(
        context, AnimeTrackerLocalizations)!;
  }
}

class EnAnimeTrackerLocalizations extends AnimeTrackerLocalizations {
  @override
  String get trendingNowLabel => 'Trending now';

  @override
  String get upComingNextSeasonLabel => 'Upcoming next season';

  @override
  String get popularThisSeasonLabel => 'Popular this season';

  @override
  String get discover => 'Discover';
}

class JaAnimeTrackerLocalizations extends AnimeTrackerLocalizations {
  @override
  String get trendingNowLabel => 'トレンド';

  @override
  String get upComingNextSeasonLabel => '次のシーズンのアニメ';

  @override
  String get popularThisSeasonLabel => '今シーズンの人気アニメ';

  @override
  String get discover => 'お探し';
}

class CNAnimeTrackerLocalizations extends AnimeTrackerLocalizations {
  @override
  String get trendingNowLabel => '趋势';

  @override
  String get upComingNextSeasonLabel => '下期动画';

  @override
  String get popularThisSeasonLabel => '本期动画';

  @override
  String get discover => '探索';
}

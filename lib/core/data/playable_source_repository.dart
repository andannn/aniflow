import 'dart:ui';

import 'package:aniflow/app/di/env.dart';
import 'package:aniflow/core/data/hi_animation_repository.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/network/playable_web_source.dart';
import 'package:aniflow/core/network/web_source/search_config.dart';
import 'package:aniflow/core/network/web_source/subject_matcher.dart';
import 'package:aniflow/core/network/web_source/util.dart';
import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

enum MediaSource {
  vdm10,
  qdm8,
}

@LazySingleton(env: [AfEnvironment.mobile, AfEnvironment.desktop])
class PlayableSourceRepository {
  final PlayableWebSource source;

  PlayableSourceRepository(this.source);

  Future<LoadResult<List<Episode>>> searchPlaySource(MediaSource mediaSource,
      String animeId, String title, Locale locale, int episodeNum,
      [CancelToken? cancelToken]) async {
    try {
      final subjectList = await source.fetch(
        config: mediaSource.toConfig(),
        searchRequest: _toSearchRequest(title, locale, episodeNum),
      );

      final result = subjectList
          .map((e) => e.episodes)
          .flattened
          .where((episode) => episode.episodeNum == episodeNum)
          .map((e) => Episode(e.link, e.name))
          .toList();
      return LoadSuccess(data: result);
    } on Exception catch (e) {
      return LoadError(e);
    }
  }

}

SearchRequest _toSearchRequest(String title, Locale locale, int episodeNum) {
  final searchTitle = SearchTitle(title, title.split(" ").toSet(), locale);
  final season = parseSeasonNumFromTitle(title);
  return SearchRequest(title: searchTitle, season: season, episode: episodeNum);
}

List<RegExp> _seasonNumPatterns = [
  RegExp(".*第s*(?<num>\\d+)s*クール"),
  RegExp(".*第s*(?<num>\\d+)s*期"),
  RegExp(".*(?<num>\\d+)(?<suffix>st|nd|rd|th).*"),
  RegExp(".*Act.(?<num>\\d+)"),
  RegExp(".*Season\\s+(?<num>\\d+).*"),
  RegExp("(?<title>.+?)(?<num>[０-９]+)"),
  RegExp("(?<title>.+?)(?<num>[ⅰ-ⅸⅹⅺⅻⅠ-ⅫⅬⅭⅮⅯ]+)"),
];

@visibleForTesting
int? parseSeasonNumFromTitle(String title) {
  for (var pattern in _seasonNumPatterns) {
    final result = pattern.tryMatchNumber(title);
    if (result != -1) {
      return result;
    }
  }

  return null;
}

extension on RegExp {
  int tryMatchNumber(String title) {
    final result = firstMatch(title);
    if (result != null) {
      final num = result.namedGroup("num");
      if (num == null) return -1;
      return int.tryParse(num) ?? numberMapping[num] ?? -1;
    } else {
      return -1;
    }
  }
}

@visibleForTesting
extension MediaSourceEx on MediaSource {
  SearchConfig toConfig() {
    switch (this) {
      case MediaSource.vdm10:
        return SearchConfig(
          baseUrl: "https://www.vdm10.com",
          searchUrl:
              "https://www.vdm10.com/search/-------------.html?wd={keyword}",
          matcher: Vdm10Macher(),
          validLocal: [
            const Locale("zh"),
            const Locale("ja"),
          ],
        );
      case MediaSource.qdm8:
        return SearchConfig(
          baseUrl: "https://www.qdm8.com",
          searchUrl: "https://www.qdm88.com/search/{keyword}-------------.html",
          matcher: Qdm8Macher(),
          validLocal: [
            const Locale("zh"),
            const Locale("ja"),
          ],
        );
    }
  }
}

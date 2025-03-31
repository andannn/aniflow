import 'dart:convert';

import 'package:aniflow/app/di/env.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/mappers/subject_with_episodes_mapper.dart';
import 'package:aniflow/core/data/model/episode_model.dart';
import 'package:aniflow/core/data/model/search_result_model.dart';
import 'package:aniflow/core/data/model/subject_with_episodes_model.dart';
import 'package:aniflow/core/database/aniflow_database.dart';
import 'package:aniflow/core/database/dao/search_result_cache_dao.dart';
import 'package:aniflow/core/network/model/search_title.dart';
import 'package:aniflow/core/network/playable_web_source.dart';
import 'package:aniflow/core/network/web_source/search_config.dart';
import 'package:aniflow/core/network/web_source/subject_matcher.dart';
import 'package:aniflow/core/network/web_source/util.dart';
import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:string_similarity/string_similarity.dart';

enum MediaSource {
  vdm10,
  qdm8;

  String get jsonString {
    switch (this) {
      case MediaSource.vdm10:
        return "vdm10";
      case MediaSource.qdm8:
        return "qdm8";
    }
  }

  static MediaSource fromJson(String source) {
    switch (source) {
      case "vdm10":
        return MediaSource.vdm10;
      case "qdm8":
        return MediaSource.qdm8;
    }
    throw Exception("unknown source: $source");
  }
}

const _tag = "PlayableSourceRepository";

class MatchedEpisode extends Equatable {
  final String subjectTitle;
  final String subjectUrl;
  final String episodeUrl;
  final String episodeTitle;

  const MatchedEpisode(
      this.subjectTitle, this.subjectUrl, this.episodeUrl, this.episodeTitle);

  @override
  List<Object?> get props =>
      [subjectTitle, subjectUrl, episodeUrl, episodeTitle];
}

@LazySingleton(env: [AfEnvironment.mobile, AfEnvironment.desktop])
class PlayableSourceRepository {
  final PlayableWebSource source;
  final SearchResultCacheDao cacheDao;

  PlayableSourceRepository(this.source, this.cacheDao);

  Future<LoadResult<List<MatchedEpisode>>> searchPlaySource(
      MediaSource mediaSource,
      String animeId,
      String title,
      Locale locale,
      int episodeNum,
      [CancelToken? cancelToken]) async {
    try {
      // First: get cache and try to match.
      final cache =
          (await cacheDao.getCache(animeId, mediaSource.jsonString))?.cache;
      try {
        if (cache != null) {
          final result = SearchResultModel.fromJson(jsonDecode(cache));
          final ret =
              await _tryMatch(result.subjects, episodeNum, result.title);
          return LoadSuccess(data: ret);
        }
      } on Exception catch (e) {
        // ignore error when load from cache.
        logger.e("$_tag match content from cache error: $e");
      }

      // Second: search from web.
      final (subjectList, searchTitle) = await source.fetch(
        config: mediaSource.toConfig(),
        searchRequest: _toSearchRequest(title, locale, episodeNum),
        cancelToken: cancelToken
      );
      final searchedSubjects = subjectList.map((e) => e.toModel()).toList();

      // Third: save the search cache.
      await cacheDao.saveCache([
        SearchResultEntity(
          mediaId: animeId,
          mediaSource: mediaSource.jsonString,
          cache: jsonEncode(
            SearchResultModel(subjects: searchedSubjects, title: searchTitle),
          ),
        )
      ]);

      final ret = await _tryMatch(searchedSubjects, episodeNum, searchTitle);
      return LoadSuccess(data: ret);
    } on Exception catch (e) {
      return LoadError(e);
    }
  }

  Future<List<MatchedEpisode>> _tryMatch(
      List<SubjectWithEpisodesModel> searchedSubjects,
      int episodeNum,
      SearchTitle searchTitle) async {
    final filtered = _filterMatched(
      searchedSubjects,
      episodeNum,
    );
    logger.d("$_tag after filtered $filtered");

    if (filtered.isEmpty) {
      throw Exception(
        "not found content with title: ${searchTitle.keyword.firstOrNull}",
      );
    }

    final mapped = filtered
        .expand(
          (element) => element.episodes.map(
            (ep) => SubjectWithEpisodesModel(
              title: element.title,
              originalPageUrl: element.originalPageUrl,
              episodes: [ep],
            ),
          ),
        )
        .map(
          (subject) => MatchedEpisode(
            subject.title,
            subject.originalPageUrl,
            subject.episodes.first.url,
            subject.episodes.first.title,
          ),
        )
        .toList();
    final bestMatch = searchTitle.fullText.bestMatch(
      mapped.map((e) => e.subjectTitle).toList(),
    );

    final episodeWithMatchRatting =
        Map.fromIterables(mapped, bestMatch.ratings).entries;

    final sorted = episodeWithMatchRatting.sortedByCompare(
      (entry) => entry.value.rating ?? 0,
      (a, b) => b.compareTo(a),
    );

    return sorted.map((e) => e.key).toList();
  }

  List<SubjectWithEpisodesModel> _filterMatched(
      List<SubjectWithEpisodesModel> from, int episodeNum) {
    bool epMatched(EpisodeModel element) {
      return element.episodeNum == episodeNum;
    }

    return from
        .map(
          (subject) => SubjectWithEpisodesModel(
            title: subject.title,
            originalPageUrl: subject.originalPageUrl,
            episodes: subject.episodes.where(epMatched).toList(),
          ),
        )
        .whereNot((e) => e.episodes.isEmpty)
        .toList();
  }
}

SearchRequest _toSearchRequest(String title, Locale locale, int episodeNum) {
  final searchTitle = SearchTitle(
      fullText: title, keyword: title.split(" ").toSet(), locale: locale);
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
          iconUrl: "",
          searchUrl:
              "https://www.vdm10.com/search/-------------.html?wd={keyword}",
          matcher: Vdm10Macher(),
          validLocal: [
            const Locale("zh"),
          ],
        );
      case MediaSource.qdm8:
        return SearchConfig(
          baseUrl: "https://www.qdm8.com",
          iconUrl: "https://www.qdm88.com/qdm8.png",
          searchUrl: "https://www.qdm88.com/search/{keyword}-------------.html",
          matcher: Qdm8Macher(),
          validLocal: [
            const Locale("zh"),
          ],
        );
    }
  }
}

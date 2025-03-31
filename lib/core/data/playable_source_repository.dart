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
import 'package:aniflow/core/network/model/search_request.dart';
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
      final searchRequest = _toSearchRequest(title, locale, episodeNum);
      logger.e("$_tag start search with request: $searchRequest");
      // First: get cache and try to match.
      final cache =
          (await cacheDao.getCache(animeId, mediaSource.jsonString))?.cache;
      try {
        if (cache != null) {
          final result = SearchResultModel.fromJson(jsonDecode(cache));
          final ret = await _tryMatch(
            result.subjects,
            episodeNum,
            searchRequest,
            result.title,
          );
          return LoadSuccess(data: ret);
        }
      } on Exception catch (e) {
        // ignore error when load from cache.
        logger.e("$_tag match content from cache error: $e");
      }

      // Second: search from web.
      Future<List<MatchedEpisode>> searchWithRequest(SearchRequest r) async {
        final (subjectList, searchTitle) = await source.fetch(
            config: mediaSource.toConfig(),
            searchRequest: r,
            cancelToken: cancelToken);
        final searchedSubjects = subjectList.map((e) => e.toModel()).toList();

        // throw exception when no subject found.
        final ret = await _tryMatch(
          searchedSubjects,
          episodeNum,
          r,
          searchTitle,
        );

        // save the search cache.
        await cacheDao.saveCache([
          SearchResultEntity(
            mediaId: animeId,
            mediaSource: mediaSource.jsonString,
            cache: jsonEncode(
              SearchResultModel(subjects: searchedSubjects, title: searchTitle),
            ),
          )
        ]);
        return ret;
      }

      try {
        final ret = await searchWithRequest(
            searchRequest.copyWith(useFirstKeyword: false));
        return LoadSuccess(data: ret);
      } catch (e) {
        // ignore error when search with full title.
        logger.e("$_tag match content with full title error: $e");
      }

      // finally, search content with first keyword.
      // return error when no subject found.
      final ret = await searchWithRequest(
          searchRequest.copyWith(useFirstKeyword: true));
      return LoadSuccess(data: ret);
    } on Exception catch (e) {
      return LoadError(e);
    }
  }

  Future<List<MatchedEpisode>> _tryMatch(
      List<SubjectWithEpisodesModel> searchedSubjects,
      int episodeNum,
      SearchRequest searchRequest,
      SearchTitle searchTitle) async {
    logger.d("$_tag before filtered $searchedSubjects");
    final filtered = _filterMatched(
      searchedSubjects,
      episodeNum,
      searchRequest.season,
    );
    logger.d("$_tag after filtered $filtered");

    if (filtered.isEmpty) {
      throw Exception(
        "not found content with title:\n"
        "${searchRequest.useFirstKeyword ? searchRequest.title.keyword.first : searchRequest.title.fullText}",
      );
    }

    final mapped = filtered
        .expand(
          (element) => element.episodes.map(
            (ep) => SubjectWithEpisodesModel(
              title: element.title,
              originalPageUrl: element.originalPageUrl,
              seasonNum: element.seasonNum,
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
    List<SubjectWithEpisodesModel> from,
    int episodeNum,
    int seasonNum,
  ) {
    bool epMatched(EpisodeModel element) {
      return element.episodeNum == episodeNum;
    }

    return from
        .where((subject) => subject.seasonNum == seasonNum)
        .map(
          (subject) => SubjectWithEpisodesModel(
            title: subject.title,
            seasonNum: subject.seasonNum,
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
  final season = parseSeasonNumFromTitle(title) ?? 1;
  return SearchRequest(title: searchTitle, season: season, episode: episodeNum);
}

List<RegExp> _seasonNumPatterns = [
  RegExp('.*第\\s*(?<num>\\d+)\\s*クール'),
  RegExp('.*第\\s*(?<num>.+)\\s*クール'),
  RegExp('.*第\\s*(?<num>\\d+)\\s*期'),
  RegExp('.*第\\s*(?<num>.+)\\s*期'),
  RegExp('.*(?<num>\\d+)(?<suffix>st|nd|rd|th).*'),
  RegExp('.*Act.(?<num>\\d+)'),
  RegExp('.*Season\\s+(?<num>\\d+).*'),
  RegExp('(?<title>.+?)(?<num>[０-９]+)'),
  RegExp('(?<title>.+?)(?<num>[ⅰ-ⅸⅹⅺⅻⅠ-ⅫⅬⅭⅮⅯ]+)'),
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

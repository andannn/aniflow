import 'package:aniflow/app/di/env.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/mappers/subject_with_episodes_mapper.dart';
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
  qdm8,
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

class SubjectWithEpisodesModel extends Equatable {
  final String title;
  final String originalPageUrl;
  final List<EpisodeModel> episodes;

  const SubjectWithEpisodesModel(
      {required this.title,
      required this.originalPageUrl,
      required this.episodes});

  @override
  List<Object?> get props => [title, originalPageUrl, episodes];
}

class EpisodeModel extends Equatable {
  final String url;
  final String title;
  final int episodeNum;

  const EpisodeModel(this.url, this.title, this.episodeNum);

  @override
  List<Object?> get props => [url, title, episodeNum];
}

@LazySingleton(env: [AfEnvironment.mobile, AfEnvironment.desktop])
class PlayableSourceRepository {
  final PlayableWebSource source;

  PlayableSourceRepository(this.source);

  Future<LoadResult<List<MatchedEpisode>>> searchPlaySource(
      MediaSource mediaSource,
      String animeId,
      String title,
      Locale locale,
      int episodeNum,
      [CancelToken? cancelToken]) async {
    try {
      final (subjectList, searchTitle) = await source.fetch(
        config: mediaSource.toConfig(),
        searchRequest: _toSearchRequest(title, locale, episodeNum),
      );

      logger.d("$_tag fetch success $subjectList");
// TODO: save cache.

      final filtered = _filterMatched(
        subjectList.map((e) => e.toModel()).toList(),
        episodeNum,
      );
      logger.d("$_tag after filtered $filtered");

      if (filtered.isEmpty) {
        return LoadError(
          Exception(
            "not found content with title: ${searchTitle.keyword.firstOrNull}",
          ),
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

      final ret = sorted.map((e) => e.key).toList();
      return LoadSuccess(data: ret);
    } on Exception catch (e) {
      return LoadError(e);
    }
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

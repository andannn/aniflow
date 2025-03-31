import 'dart:ui';

import 'package:aniflow/core/network/model/bangumi_subject_dto.dart';
import 'package:aniflow/core/network/model/search_request.dart';
import 'package:aniflow/core/network/model/search_title.dart';
import 'package:aniflow/core/network/web_source/search_config.dart';
import 'package:aniflow/core/network/web_source/subject_matcher.dart';
import 'package:aniflow/core/network/web_source/subject_with_episodes.dart';
import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:html/parser.dart';
import 'package:injectable/injectable.dart';
import 'package:string_similarity/string_similarity.dart';

@lazySingleton
class PlayableWebSource {
  final Dio dio;

  PlayableWebSource(this.dio);

  Future<(List<SubjectWithEpisodes>, SearchTitle)> fetch(
      {required SearchConfig config,
      required SearchRequest searchRequest,
      CancelToken? cancelToken}) async {
    final validSearchTitle = await _getValidTitle(
      searchRequest.title,
      config,
      cancelToken,
    );
    if (validSearchTitle == null) {
      throw Exception("no valid locale found");
    }

    final searchedSubjects = await dio.searchSubject(
        config: config,
        title: searchRequest.useFirstKeyword
            ? validSearchTitle.keyword.first
            : validSearchTitle.fullText,
        cancelToken: cancelToken);

    final validSubjects = searchedSubjects.where(
      (e) => searchRequest.season == 1 || e.season == searchRequest.season,
    );

    final ret = <SubjectWithEpisodes>[];
    for (var e in validSubjects) {
      final episodes = await dio.getEpisodes(
        url: e.link,
        config: config,
        cancelToken: cancelToken,
      );
      ret.add(SubjectWithEpisodes(subject: e, episodes: episodes));
    }

    return (ret, validSearchTitle);
  }

  Future<SearchTitle?> _getValidTitle(SearchTitle title, SearchConfig config,
      [CancelToken? cancelToken]) async {
    final isValid = config.validLocal.contains(title.locale);
    SearchTitle? validSearchTitle;
    if (isValid) {
      validSearchTitle = title;
    } else {
      List<SearchTitle?> convertedTitleOrNull = await Future.wait(
        config.validLocal.map((validLocal) async {
          final converted =
              await dio.convertKeyword(validLocal, title.fullText, cancelToken);
          if (converted != null) {
            return SearchTitle(
              fullText: converted,
              keyword: converted.split(RegExp(r'[ ,!@?#~・·～:：]+')).toSet(),
              locale: validLocal,
            );
          } else {
            return null;
          }
        }),
      );
      validSearchTitle = convertedTitleOrNull.nonNulls.firstOrNull;
    }

    return validSearchTitle;
  }
}

extension DioExtension on Dio {
  Future<List<SearchedSubjectInfo>> searchSubject({
    required SearchConfig config,
    required String title,
    CancelToken? cancelToken,
  }) async {
    final result = await get(combineUrl(config.searchUrl, title));
    final document = parse(result.data);

    return document
        .querySelectorAll(config.matcher.subjectMatchSelector)
        .map(
          (e) => config.matcher.matchSearchedSubject(e, config),
        )
        .toList();
  }

  Future<List<EpisodeInfo>> getEpisodes({
    required String url,
    required SearchConfig config,
    CancelToken? cancelToken,
  }) async {
    final result = await get(url, cancelToken: cancelToken);
    final document = parse(result.data);
    final episodeGroup =
        document.querySelectorAll(config.matcher.episodeListMatchSelector);
    if (episodeGroup.isEmpty) {
      return [];
    }

    return episodeGroup
        .map((ep) => config.matcher.matchEpisodes(ep, config))
        .toList();
  }

  Future<String?> convertKeyword(Locale toLocal, String title,
      [CancelToken? cancelToken]) async {
    if (toLocal.languageCode.contains('zh')) {
      String? converted;
      try {
        final result = await get(
          'https://api.bgm.tv/search/subject/$title',
          queryParameters: {'type': 2, 'responseGroup': 'small'},
          cancelToken: cancelToken,
        );

        final subjects = (result.data['list'] as List)
            .map((e) => BangumiSubjectDto.fromJson(e))
            .toList();

        final jpNameList = subjects.map((e) => e.name).toList();

        final bestMatch = title.bestMatch(jpNameList);
        final bestMatchedSubject = subjects[bestMatch.bestMatchIndex];
        converted = bestMatchedSubject.nameCn;
      } catch (e) {}

      return converted;
    }

    return null;
  }

  String combineUrl(String searchUrl, String keyword) {
    return searchUrl.replaceAll("{keyword}", keyword);
  }
}

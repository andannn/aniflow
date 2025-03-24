import 'dart:ui';

import 'package:aniflow/core/network/web_source/search_config.dart';
import 'package:aniflow/core/network/web_source/subject_matcher.dart';
import 'package:aniflow/core/network/web_source/subject_with_episodes.dart';
import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:html/parser.dart';

class PlayableWebSource {
  final Dio dio;

  PlayableWebSource(this.dio);

  Future<List<SubjectWithEpisodes>> fetch(
      {required SearchConfig config,
      required SearchRequest searchRequest}) async {
    final validSearchTitle = await _getValidTitle(searchRequest.title, config);
    if (validSearchTitle == null) {
      throw Exception("no valid local found");
    }

    final searchedSubjects = await dio.searchSubject(
      config: config,
      title: searchRequest.useFirstKeyword
          ? validSearchTitle.keyword.first
          : validSearchTitle.fullText,
    );

    final validSubjects = searchedSubjects.where((e) =>
        searchRequest.season == null || e.season == searchRequest.season);

    final ret = <SubjectWithEpisodes>[];
    for (var e in validSubjects) {
      final episodes = await dio.getEpisodes(url: e.link, config: config);
      ret.add(SubjectWithEpisodes(subject: e, episodes: episodes));
    }

    return ret;
  }

  Future<SearchTitle?> _getValidTitle(
      SearchTitle title, SearchConfig config) async {
    final isValid = config.validLocal.contains(title.locale);
    SearchTitle? validSearchTitle;
    if (isValid) {
      validSearchTitle = title;
    } else {
      List<SearchTitle?> convertedTitleOrNull = await Future.wait(
        config.validLocal.map((validLocal) async {
          final converted =
              await dio.convertKeyword(validLocal, title.fullText);
          if (converted != null) {
            return SearchTitle(
              converted,
              converted.split(" ").toSet(),
              validLocal,
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

class SearchTitle extends Equatable {
  final String fullText;
  final Set<String> keyword;
  final Locale locale;

  const SearchTitle(this.fullText, this.keyword, this.locale);

  @override
  List<Object?> get props => [fullText, keyword, locale];
}

class SearchRequest extends Equatable {
  final SearchTitle title;
  final int? season;
  final int episode;
  final bool useFirstKeyword;

  const SearchRequest({
    required this.title,
    this.season,
    required this.episode,
    this.useFirstKeyword = true,
  });

  @override
  List<Object?> get props => [title, season, episode];
}

extension DioExtension on Dio {
  Future<List<SearchedSubjectInfo>> searchSubject({
    required SearchConfig config,
    required String title,
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
  }) async {
    final result = await get(url);
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

  Future<String?> convertKeyword(Locale toLocal, String keyword) async {
    if (toLocal.languageCode.contains('zh')) {
      String? converted;
      try {
        final result = await get(
          'https://api.bgm.tv/search/subject/$keyword',
          queryParameters: {'type': 2, 'responseGroup': 'small'},
        );
        converted = result.data['list'].first["name_cn"];
      } catch (e) {}

      return converted;
    }

    return null;
  }

  String combineUrl(String searchUrl, String keyword) {
    return searchUrl.replaceAll("{keyword}", keyword);
  }
}

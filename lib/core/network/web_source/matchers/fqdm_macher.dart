
part of '../subject_matcher.dart';

class FqdmMatcher extends SubjectMatcher {
  @override
  String get episodeListMatchSelector => "#panel1 > .module-play-list > div > a";

  @override
  EpisodeInfo matchEpisodes(Element element, SearchConfig config) {
    final title = element.querySelector("span")?.text ?? "Title";
    return EpisodeInfo(
      name: title,
      link: _getFullLink(
        config.baseUrl,
        element.attributes["href"] ?? "",
      ),
      episodeNum: findEpisodeNum(title),
    );
  }

  @override
  SearchedSubjectInfo matchSearchedSubject(
          Element element, SearchConfig config) =>
      _matchWithATag(element, config);

  @override
  String get subjectMatchSelector =>
      ".module-card-item.module-item > .module-card-item-info > .module-card-item-title > a";
}

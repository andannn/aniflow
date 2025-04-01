part of '../subject_matcher.dart';

class McydhMacher extends SubjectMatcher {
  @override
  String get episodeListMatchSelector =>
      ".box-width.cor5 > .anthology.wow.fadeInUp.animated > .anthology-list.top20.select-a > div > div > ul > li > a";

  @override
  EpisodeInfo matchEpisodes(Element element, SearchConfig config) =>
      _matchEpisodes(element, config);

  @override
  SearchedSubjectInfo matchSearchedSubject(
      Element element, SearchConfig config) {
    final link =
        element.querySelector(".left.public-list-bj > a")?.attributes["href"] ??
            "";
    final name = element
            .querySelector(".right.rel.flex-auto > div > .thumb-txt.cor4.hide")
            ?.text ??
        "";

    return SearchedSubjectInfo(
        name: name,
        link: _getFullLink(config.baseUrl, link),
        season: findSeason(name));
  }

  @override
  String get subjectMatchSelector => ".row-9 > .row-right > div";
}

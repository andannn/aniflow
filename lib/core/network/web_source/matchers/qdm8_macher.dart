part of '../subject_matcher.dart';

class Qdm8Macher extends SubjectMatcher {
  @override
  String get subjectMatchSelector => "#searchList > li > div.detail > h4 > a";

  @override
  SearchedSubjectInfo matchSearchedSubject(
      Element element, SearchConfig config) =>
      _matchWithATag(element, config);

  @override
  String get episodeListMatchSelector =>
      "body > div.container > div > div.col-md-wide-7.col-xs-1.padding-0 > div:nth-child(4) > div > div.tab-content.myui-panel_bd > div";

  @override
  EpisodeInfo matchEpisodes(Element element, SearchConfig config) {
    print(element.outerHtml);
    return EpisodeInfo(name: "name", link: "link", episodeNum: 1);
  }
}
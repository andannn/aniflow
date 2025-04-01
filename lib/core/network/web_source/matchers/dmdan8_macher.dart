part of '../subject_matcher.dart';

class Dmdan8Macher extends SubjectMatcher {
  @override
  String get episodeListMatchSelector => "#playlist1 > ul > li > a";

  @override
  EpisodeInfo matchEpisodes(Element element, SearchConfig config) =>
      _matchEpisodes(element, config);

  @override
  SearchedSubjectInfo matchSearchedSubject(
          Element element, SearchConfig config) =>
      _matchWithATag(element, config);

  @override
  String get subjectMatchSelector =>
      ".stui-pannel-box > .stui-pannel_bd > ul > li > .detail > .title > a";
}

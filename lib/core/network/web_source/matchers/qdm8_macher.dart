part of '../subject_matcher.dart';

class Qdm8Macher extends SubjectMatcher {
  @override
  String get subjectMatchSelector => "#searchList > li > div.detail > h4 > a";

  @override
  SearchedSubjectInfo matchSearchedSubject(
          Element element, SearchConfig config) =>
      _matchWithATag(element, config);

  @override
  String get episodeListMatchSelector => "#playlist1 > ul > li > a";

  @override
  EpisodeInfo matchEpisodes(Element element, SearchConfig config) =>
      _matchEpisodes(element, config);
}

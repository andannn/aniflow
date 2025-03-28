part of '../subject_matcher.dart';

class Vdm10Macher extends SubjectMatcher {
  @override
  String get subjectMatchSelector =>
      "body > div.sear_box > div.sear_con > div> div > div > div.result_title > a";

  @override
  String get episodeListMatchSelector => ".con_c2_list > li > a";

  @override
  SearchedSubjectInfo matchSearchedSubject(
          Element element, SearchConfig config) =>
      _matchWithATag(element, config);

  @override
  EpisodeInfo matchEpisodes(Element element, SearchConfig config) =>
      _matchEpisodes(element, config);
}

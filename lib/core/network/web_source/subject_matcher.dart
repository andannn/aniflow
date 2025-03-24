import 'package:aniflow/core/network/web_source/search_config.dart';
import 'package:aniflow/core/network/web_source/util.dart';
import 'package:equatable/equatable.dart';
import 'package:html/dom.dart';

part 'matchers/qdm8_macher.dart';

part 'matchers/vdm10_macher.dart';

class EpisodeInfo extends Equatable {
  final String name;
  final String link;
  final int episodeNum;

  const EpisodeInfo({
    required this.episodeNum,
    required this.name,
    required this.link,
  });

  @override
  List<Object?> get props => [name, link, episodeNum];
}

class SearchedSubjectInfo extends Equatable {
  final String name;
  final String link;
  final int? season;

  const SearchedSubjectInfo({
    required this.name,
    required this.link,
    required this.season,
  });

  @override
  List<Object?> get props => [name, link, season];
}

abstract class SubjectMatcher {
  String get subjectMatchSelector;

  String get episodeListMatchSelector;

  String get seasonMatchRegex => "第s*(?<num>.+)s*季";

  String get episodeMatchRegex => "第s*(?<num>.+)s*[话集]";

  SearchedSubjectInfo matchSearchedSubject(
      Element element, SearchConfig config);

  EpisodeInfo matchEpisodes(Element element, SearchConfig config);
}


String _getFullLink(String baseUrl, String link) {
  if (link.startsWith("http")) {
    return link;
  }

  return Uri.parse(baseUrl).resolve(link).toString();
}

extension on SubjectMatcher {
  int findEpisodeNum(String name) {
    final result = RegExp(episodeMatchRegex).firstMatch(name);
    if (result != null) {
      return int.tryParse(result.namedGroup("num") ?? "-1") ?? -1;
    } else {
      return -1;
    }
  }

  int? findSeason(String name) {
    final result = RegExp(seasonMatchRegex).firstMatch(name);
    if (result != null) {
      return _convertToNumber(result.namedGroup("num") ?? "") ?? -1;
    } else {
      return -1;
    }
  }

  SearchedSubjectInfo _matchWithATag(Element element, SearchConfig config) =>
      SearchedSubjectInfo(
          name: element.text,
          link: _getFullLink(config.baseUrl, element.attributes['href']!),
          season: findSeason(element.text)
      );
}

int? _convertToNumber(String num) {
  return numberMapping[num];
}

import 'package:aniflow/core/data/playable_source_repository.dart';
import 'package:aniflow/core/network/web_source/subject_matcher.dart';
import 'package:aniflow/core/network/web_source/subject_with_episodes.dart';

extension SubjectWithEpisodesMapper on SubjectWithEpisodes {
  SubjectWithEpisodesModel toModel() {
    return SubjectWithEpisodesModel(
      title: subject.name,
      originalPageUrl: subject.link,
      episodes: episodes.map((e) => e.toModel()).toList(),
    );
  }
}

extension on EpisodeInfo {
  EpisodeModel toModel() {
    return EpisodeModel(link, name, episodeNum);
  }
}

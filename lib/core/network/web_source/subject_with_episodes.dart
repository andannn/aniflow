
import 'package:aniflow/core/network/web_source/subject_matcher.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'subject_with_episodes.freezed.dart';

@freezed
class SubjectWithEpisodes with _$SubjectWithEpisodes {
  const factory SubjectWithEpisodes({
    required SearchedSubjectInfo subject,
    @Default([]) List<EpisodeInfo> episodes,
  }) = _SubjectWithEpisodes;
}


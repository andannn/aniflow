import 'package:aniflow/core/data/model/episode_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'subject_with_episodes_model.freezed.dart';

part 'subject_with_episodes_model.g.dart';

@freezed
class SubjectWithEpisodesModel with _$SubjectWithEpisodesModel {
  const factory SubjectWithEpisodesModel({
    required String title,
    required String originalPageUrl,
    required List<EpisodeModel> episodes,
}) = _SubjectWithEpisodesModel;

  factory SubjectWithEpisodesModel.fromJson(Map<String, dynamic> json) =>
      _$SubjectWithEpisodesModelFromJson(json);

}
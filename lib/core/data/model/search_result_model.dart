import 'package:aniflow/core/data/model/subject_with_episodes_model.dart';
import 'package:aniflow/core/network/model/search_title.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_result_model.freezed.dart';
part 'search_result_model.g.dart';

@freezed
class SearchResultModel with _$SearchResultModel {
  const factory SearchResultModel({
    required List<SubjectWithEpisodesModel> subjects,
    required SearchTitle title,
}) = _SearchResultModel;

  factory SearchResultModel.fromJson(Map<String, dynamic> json) =>
      _$SearchResultModelFromJson(json);
}
import 'package:aniflow/core/network/model/search_title.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_request.freezed.dart';

@freezed
class SearchRequest with _$SearchRequest {
  const factory SearchRequest({
    required SearchTitle title,
    required int season,
    required int episode,
    @Default(false) bool useFirstKeyword,
}) = _SearchRequest;
}

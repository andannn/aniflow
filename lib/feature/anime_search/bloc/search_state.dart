import 'package:aniflow/feature/anime_search/bloc/search_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    String? keyword,
    @Default(SearchType.anime) SearchType selectedSearchType,
  }) = _SearchState;
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_ui_state.freezed.dart';

@freezed
class HomeUiState with _$HomeUiState {
  factory HomeUiState({
    @Default('') String isShowSuggestionBoard,
  }) = _HomeUiState;
}

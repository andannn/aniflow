import 'package:aniflow/core/common/model/staff_language.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_page_model.freezed.dart';

@freezed
class CharacterPageState with _$CharacterPageState {
  factory CharacterPageState({
    @Default(StaffLanguage.japanese) StaffLanguage language,
  }) = _CharacterPageState;
}

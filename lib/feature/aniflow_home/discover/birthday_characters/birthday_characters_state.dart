import 'package:aniflow/core/data/model/character_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'birthday_characters_state.freezed.dart';

@freezed
class BirthdayCharactersState with _$BirthdayCharactersState {
  const factory BirthdayCharactersState({
    @Default([]) List<CharacterModel> data,
  }) = _BirthdayCharactersState;
}

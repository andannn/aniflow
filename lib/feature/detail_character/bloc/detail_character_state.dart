import 'package:aniflow/core/data/model/character_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_character_state.freezed.dart';

@freezed
class DetailCharacterState with _$DetailCharacterState {
  factory DetailCharacterState({
    @Default(false) bool isLoading,
    CharacterModel? characterModel,
  }) = _DetailCharacterState;
}

import 'dart:async';

import 'package:aniflow/core/data/character_repository.dart';
import 'package:aniflow/core/data/model/character_model.dart';
import 'package:aniflow/feature/aniflow_home/discover/birthday_characters/birthday_characters_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

sealed class BirthdayCharactersEvent {}

class _OnBirthdayCharacterChanged extends BirthdayCharactersEvent {
  final List<CharacterModel> models;

  _OnBirthdayCharacterChanged(this.models);
}

@injectable
class BirthdayCharactersBloc
    extends Bloc<BirthdayCharactersEvent, BirthdayCharactersState> {
  BirthdayCharactersBloc(
    this._characterRepository,
  ) : super(const BirthdayCharactersState()) {
    on<_OnBirthdayCharacterChanged>(
      (event, emit) => emit(
        state.copyWith(data: event.models),
      ),
    );
    _sub =
        _characterRepository.getBirthdayCharactersStream(12).listen((models) {
      add(_OnBirthdayCharacterChanged(models));
    });
  }

  final CharacterRepository _characterRepository;

  StreamSubscription? _sub;

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }
}

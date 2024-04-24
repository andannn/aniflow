import 'dart:async';

import 'package:aniflow/core/common/definitions/staff_language.dart';
import 'package:aniflow/core/data/aniflow_preferences_repository.dart';
import 'package:aniflow/feature/character_page/bloc/character_page_model.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

sealed class CharacterPageEvent {}

class OnStaffLanguageChanged extends CharacterPageEvent {
  OnStaffLanguageChanged({required this.staffLanguage});

  final StaffLanguage staffLanguage;
}

@injectable
class CharacterPageBloc extends Bloc<CharacterPageEvent, CharacterPageState> {
  CharacterPageBloc(
    AfPreferencesRepository preferences,
  ) : super(
          CharacterPageState(
              userStaffNameLanguage: preferences.userData.userStaffNameLanguage),
        ) {
    on<OnStaffLanguageChanged>(_onStaffLanguageChanged);
  }

  FutureOr<void> _onStaffLanguageChanged(
    OnStaffLanguageChanged event,
    Emitter<CharacterPageState> emit,
  ) {
    emit(state.copyWith(language: event.staffLanguage));
  }
}

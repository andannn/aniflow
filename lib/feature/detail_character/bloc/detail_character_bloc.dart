import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/core/data/model/character_model.dart';
import 'package:aniflow/feature/detail_character/bloc/detail_character_state.dart';
import 'package:bloc/bloc.dart';

sealed class DetailCharacterEvent {}

class _OnDetailCharacterInfoChanged extends DetailCharacterEvent {
  _OnDetailCharacterInfoChanged({required this.model});

  final CharacterModel model;
}

class DetailCharacterBloc
    extends Bloc<DetailCharacterEvent, DetailCharacterState> {
  DetailCharacterBloc(
    String characterId,
    MediaInformationRepository mediaRepository,
  ) : super(DetailCharacterState()) {
    on<_OnDetailCharacterInfoChanged>(
      (event, emit) => emit(state.copyWith(characterModel: event.model)),
    );

    mediaRepository
        .getDetailCharacterStream(characterId)
        .distinct()
        .listen((model) {
      add(_OnDetailCharacterInfoChanged(model: model));
    });
  }
}

import 'dart:async';

import 'package:aniflow/core/common/util/error_handler.dart';
import 'package:aniflow/core/data/favorite_repository.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/core/data/model/character_model.dart';
import 'package:aniflow/feature/detail_character/bloc/detail_character_state.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

sealed class DetailCharacterEvent {}

class _OnDetailCharacterInfoChanged extends DetailCharacterEvent {
  _OnDetailCharacterInfoChanged({required this.model});

  final CharacterModel model;
}

class _OnLoadingChanged extends DetailCharacterEvent {
  _OnLoadingChanged({required this.isLoading});

  final bool isLoading;
}

class OnToggleLike extends DetailCharacterEvent {}

class DetailCharacterBloc
    extends Bloc<DetailCharacterEvent, DetailCharacterState> {
  DetailCharacterBloc({
    required this.characterId,
    required this.mediaRepository,
    required this.favoriteRepository,
  }) : super(DetailCharacterState()) {
    on<_OnDetailCharacterInfoChanged>(
      (event, emit) => emit(state.copyWith(characterModel: event.model)),
    );
    on<_OnLoadingChanged>(
      (event, emit) => emit(state.copyWith(isLoading: event.isLoading)),
    );
    on<OnToggleLike>((event, _) async {
      _toggleLikeCancelToken?.cancel();
      _toggleLikeCancelToken = CancelToken();
      await favoriteRepository.toggleFavoriteCharacter(
        characterId,
        _toggleLikeCancelToken!,
      );
    });

    _detailCharacterSub = mediaRepository
        .getDetailCharacterStream(characterId)
        .distinct()
        .listen((model) {
      add(_OnDetailCharacterInfoChanged(model: model));
    });

    _init();
  }

  final MediaInformationRepository mediaRepository;
  final FavoriteRepository favoriteRepository;
  final String characterId;
  StreamSubscription? _detailCharacterSub;
  final _contentFetchCancelToken = CancelToken();
  CancelToken? _toggleLikeCancelToken;

  @override
  Future<void> close() {
    _detailCharacterSub?.cancel();
    _contentFetchCancelToken.cancel();
    _toggleLikeCancelToken?.cancel();

    return super.close();
  }

  void _init() async {
    add(_OnLoadingChanged(isLoading: true));
    final result = await mediaRepository.startFetchDetailCharacterInfo(
      id: characterId,
      token: _contentFetchCancelToken,
    );

    if (result is LoadError) {
      ErrorHandler.handleException(exception: result.exception);
    }
    add(_OnLoadingChanged(isLoading: false));
  }
}

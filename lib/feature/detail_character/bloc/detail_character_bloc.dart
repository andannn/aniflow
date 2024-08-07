import 'dart:async';

import 'package:aniflow/core/common/util/bloc_util.dart';
import 'package:aniflow/core/common/util/error_handler.dart';
import 'package:aniflow/core/data/favorite_repository.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/core/data/message_repository.dart';
import 'package:aniflow/core/data/model/character_model.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/feature/detail_character/bloc/detail_character_state.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

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

@injectable
class DetailCharacterBloc
    extends Bloc<DetailCharacterEvent, DetailCharacterState>
    with AutoCancelMixin {
  DetailCharacterBloc(
    @factoryParam this._characterId,
    this._mediaRepository,
    this._messageRepository,
    this._favoriteRepository,
    UserDataRepository preferences,
  ) : super(DetailCharacterState(
          userStaffNameLanguage: preferences.userStaffNameLanguage,
          userTitleLanguage: preferences.userTitleLanguage,
        )) {
    on<_OnDetailCharacterInfoChanged>(
      (event, emit) => emit(state.copyWith(characterModel: event.model)),
    );
    on<_OnLoadingChanged>(
      (event, emit) => emit(state.copyWith(isLoading: event.isLoading)),
    );
    on<OnToggleLike>((event, _) async {
      _toggleLikeCancelToken?.cancel();
      _toggleLikeCancelToken = CancelToken();
      await _favoriteRepository.toggleFavoriteCharacter(
        _characterId,
        _toggleLikeCancelToken!,
      );
    });

    autoCancel(
      () => _mediaRepository
          .getDetailCharacterStream(_characterId)
          .distinct()
          .listen((model) {
        safeAdd(_OnDetailCharacterInfoChanged(model: model));
      }),
    );

    _init();
  }

  final MediaInformationRepository _mediaRepository;
  final FavoriteRepository _favoriteRepository;
  final MessageRepository _messageRepository;
  final String _characterId;

  final _contentFetchCancelToken = CancelToken();
  CancelToken? _toggleLikeCancelToken;

  @override
  Future<void> close() {
    _contentFetchCancelToken.cancel();
    _toggleLikeCancelToken?.cancel();

    return super.close();
  }

  void _init() async {
    safeAdd(_OnLoadingChanged(isLoading: true));
    final result = await _mediaRepository.startFetchDetailCharacterInfo(
      id: _characterId,
      token: _contentFetchCancelToken,
    );

    if (result is LoadError) {
      final message =
          await ErrorHandler.convertExceptionToMessage(result.exception);
      if (message != null) {
        _messageRepository.showMessage(message);
      }
    }
    safeAdd(_OnLoadingChanged(isLoading: false));
  }
}

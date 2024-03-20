import 'dart:async';

import 'package:aniflow/core/common/util/error_handler.dart';
import 'package:aniflow/core/data/favorite_repository.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/core/data/model/studio_model.dart';
import 'package:aniflow/feature/detail_studio/bloc/detail_studio_state.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

sealed class DetailStudioEvent {}

class _OnDetailStudioInfoChanged extends DetailStudioEvent {
  _OnDetailStudioInfoChanged({required this.model});

  final StudioModel? model;
}

class _OnLoadingChanged extends DetailStudioEvent {
  _OnLoadingChanged({required this.isLoading});

  final bool isLoading;
}

class OnToggleLike extends DetailStudioEvent {}

@injectable
class DetailStudioBloc extends Bloc<DetailStudioEvent, DetailStudioState> {
  DetailStudioBloc(
    @factoryParam this.studioId,
    this._mediaRepository,
    this._favoriteRepository,
  ) : super(DetailStudioState()) {
    on<_OnDetailStudioInfoChanged>(
      (event, emit) => emit(state.copyWith(studioModel: event.model)),
    );
    on<_OnLoadingChanged>(
      (event, emit) => emit(state.copyWith(isLoading: event.isLoading)),
    );
    on<OnToggleLike>(_onToggleLike);

    _detailStudioSub =
        _mediaRepository.getStudioStream(studioId).distinct().listen((model) {
      add(_OnDetailStudioInfoChanged(model: model));
    });

    _init();
  }

  final MediaInformationRepository _mediaRepository;
  final FavoriteRepository _favoriteRepository;
  final String studioId;
  StreamSubscription? _detailStudioSub;
  final _contentFetchCancelToken = CancelToken();
  CancelToken? _toggleLikeCancelToken;

  @override
  Future<void> close() {
    _detailStudioSub?.cancel();
    _contentFetchCancelToken.cancel();
    _toggleLikeCancelToken?.cancel();

    return super.close();
  }

  void _init() async {
    add(_OnLoadingChanged(isLoading: true));
    final result = await _mediaRepository.startFetchDetailStudioInfo(
      id: studioId,
      token: _contentFetchCancelToken,
    );

    if (result is LoadError) {
      ErrorHandler.handleException(exception: result.exception);
    }
    add(_OnLoadingChanged(isLoading: false));
  }

  FutureOr<void> _onToggleLike(
      OnToggleLike event, Emitter<DetailStudioState> emit) async {
    _toggleLikeCancelToken?.cancel();
    _toggleLikeCancelToken = CancelToken();
    final result = await _favoriteRepository.toggleFavoriteStudio(
      studioId,
      _toggleLikeCancelToken!,
    );

    if (result is LoadError) {
      ErrorHandler.handleException(exception: result.exception);
    }
  }
}

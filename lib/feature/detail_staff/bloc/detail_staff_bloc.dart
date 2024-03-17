import 'dart:async';

import 'package:aniflow/core/common/definitions/media_sort.dart';
import 'package:aniflow/core/common/util/error_handler.dart';
import 'package:aniflow/core/data/favorite_repository.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/core/data/model/staff_model.dart';
import 'package:aniflow/feature/detail_staff/bloc/detail_staff_state.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

sealed class DetailStaffEvent {}

class _OnDetailStaffInfoChanged extends DetailStaffEvent {
  _OnDetailStaffInfoChanged({required this.model});

  final StaffModel? model;
}

class OnMediaSortChanged extends DetailStaffEvent {
  OnMediaSortChanged({required this.mediaSort});

  final MediaSort mediaSort;
}

class _OnLoadingChanged extends DetailStaffEvent {
  _OnLoadingChanged({required this.isLoading});

  final bool isLoading;
}

class OnToggleLike extends DetailStaffEvent {}

class DetailStaffBloc extends Bloc<DetailStaffEvent, DetailStaffState> {
  DetailStaffBloc({
    required this.staffId,
    required this.mediaRepository,
    required this.favoriteRepository,
  }) : super(DetailStaffState()) {
    on<_OnDetailStaffInfoChanged>(
      (event, emit) => emit(state.copyWith(staffModel: event.model)),
    );
    on<_OnLoadingChanged>(
      (event, emit) => emit(state.copyWith(isLoading: event.isLoading)),
    );
    on<OnToggleLike>(_onToggleLike);
    on<OnMediaSortChanged>(
      (event, emit) => emit(state.copyWith(mediaSort: event.mediaSort)),
    );

    _detailStaffSub = mediaRepository
        .getDetailStaffStream(staffId)
        .distinct()
        .listen((model) {
      add(_OnDetailStaffInfoChanged(model: model));
    });

    _init();
  }

  final MediaInformationRepository mediaRepository;
  final FavoriteRepository favoriteRepository;
  final String staffId;
  StreamSubscription? _detailStaffSub;
  final _contentFetchCancelToken = CancelToken();
  CancelToken? _toggleLikeCancelToken;

  @override
  Future<void> close() {
    _detailStaffSub?.cancel();
    _contentFetchCancelToken.cancel();
    _toggleLikeCancelToken?.cancel();

    return super.close();
  }

  void _init() async {
    add(_OnLoadingChanged(isLoading: true));
    final result = await mediaRepository.startFetchDetailStaffInfo(
      id: staffId,
      token: _contentFetchCancelToken,
    );

    if (result is LoadError) {
      ErrorHandler.handleException(exception: result.exception);
    }
    add(_OnLoadingChanged(isLoading: false));
  }

  FutureOr<void> _onToggleLike(
      OnToggleLike event, Emitter<DetailStaffState> emit) async {
    _toggleLikeCancelToken?.cancel();
    _toggleLikeCancelToken = CancelToken();
    final result = await favoriteRepository.toggleFavoriteStaff(
      staffId,
      _toggleLikeCancelToken!,
    );

    if (result is LoadError) {
      ErrorHandler.handleException(exception: result.exception);
    }
  }
}

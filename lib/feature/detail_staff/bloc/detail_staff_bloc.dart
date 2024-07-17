import 'dart:async';

import 'package:aniflow/core/common/definitions/media_sort.dart';
import 'package:aniflow/core/common/message/message.dart';
import 'package:aniflow/core/common/util/bloc_util.dart';
import 'package:aniflow/core/data/favorite_repository.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/core/data/model/staff_model.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/feature/detail_staff/bloc/detail_staff_state.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

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

@injectable
class DetailStaffBloc extends Bloc<DetailStaffEvent, DetailStaffState>
    with AutoCancelMixin {
  DetailStaffBloc(
    @factoryParam this.staffId,
    this._mediaRepository,
    this._messageRepository,
    this._favoriteRepository,
    UserDataRepository preferences,
  ) : super(DetailStaffState(
          userStaffNameLanguage: preferences.userStaffNameLanguage,
        )) {
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

    autoCancel(
      () => _mediaRepository
          .getDetailStaffStream(staffId)
          .distinct()
          .listen((model) {
        safeAdd(_OnDetailStaffInfoChanged(model: model));
      }),
    );

    _init();
  }

  final MediaInformationRepository _mediaRepository;
  final FavoriteRepository _favoriteRepository;
  final MessageRepository _messageRepository;
  final String staffId;
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
    final result = await _mediaRepository.startFetchDetailStaffInfo(
      id: staffId,
      token: _contentFetchCancelToken,
    );

    if (result is LoadError) {
      _messageRepository.handleException(result.exception);
    }
    safeAdd(_OnLoadingChanged(isLoading: false));
  }

  FutureOr<void> _onToggleLike(
      OnToggleLike event, Emitter<DetailStaffState> emit) async {
    _toggleLikeCancelToken?.cancel();
    _toggleLikeCancelToken = CancelToken();
    final result = await _favoriteRepository.toggleFavoriteStaff(
      staffId,
      _toggleLikeCancelToken!,
    );

    if (result is LoadError) {
      _messageRepository.handleException(result.exception);
    }
  }
}

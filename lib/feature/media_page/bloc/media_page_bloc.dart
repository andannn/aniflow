import 'dart:async';

import 'package:aniflow/core/common/definitions/media_category.dart';
import 'package:aniflow/core/common/definitions/media_list_status.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/setting/user_title_language.dart';
import 'package:aniflow/core/common/util/bloc_util.dart';
import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/data/auth_repository.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/core/paging/page_loading_state.dart';
import 'package:aniflow/core/paging/paging_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

class _OnTrackingAnimeIdsChanged<T> extends PagingEvent<T> {
  final Set<String> ids;

  _OnTrackingAnimeIdsChanged({required this.ids});
}

extension on PagingState<List<MediaModel>> {
  PagingState<List<MediaModel>> copyWithTrackedIds(Set<String> ids) {
    return updateWith(
      (animeList) => animeList
          .map((e) => e.copyWith(isFollowing: ids.contains(e.id)))
          .toList(),
    );
  }
}

@injectable
class AnimePageBloc extends PagingBloc<MediaModel> {
  AnimePageBloc(
    @factoryParam this.category,
    this._mediaInfoRepository,
    this._animeTrackListRepository,
    this._authRepository,
    this._preferences,
  ) : super(const PageInit(data: [])) {
    on<_OnTrackingAnimeIdsChanged<MediaModel>>(_onTrackingAnimeIdsChanged);

    _init();
  }

  final MediaCategory category;
  final MediaInformationRepository _mediaInfoRepository;
  final MediaListRepository _animeTrackListRepository;
  final AuthRepository _authRepository;
  final UserDataRepository _preferences;

  StreamSubscription? _trackingIdsStream;
  Set<String> _ids = {};

  UserTitleLanguage get userTitleLanguage =>
      _preferences.userData.userTitleLanguage;

  void _init() async {
    final userData = await _authRepository.getAuthedUserStream().first;
    if (userData != null) {
      _trackingIdsStream = _animeTrackListRepository
          .getMediaIdsOfUserStream(
            userId: userData.id,
            status: [MediaListStatus.planning, MediaListStatus.current],
//TODO:
            type: MediaType.anime,
          )
          .distinct()
          .listen((ids) {
        safeAdd(_OnTrackingAnimeIdsChanged(ids: ids));
      });
    }
  }

  @override
  Future<void> close() {
    _trackingIdsStream?.cancel();

    return super.close();
  }

  @override
  Future<LoadResult<List<MediaModel>>> loadPage({
    required int page,
    bool isRefresh = false,
    CancelToken? cancelToken,
  }) {
    return _mediaInfoRepository.loadMediaPageByCategory(
      category: category,
      loadType: isRefresh
          ? const Refresh()
          : Append(page: page, perPage: AfConfig.defaultPerPageCount),
      token: cancelToken,
    );
  }

  @override
  void onEmitNewPagingState(PagingState<List<MediaModel>> state,
      Emitter<PagingState<List<MediaModel>>> emit) {
    super.onEmitNewPagingState(state.copyWithTrackedIds(_ids), emit);
  }

  FutureOr<void> _onTrackingAnimeIdsChanged(_OnTrackingAnimeIdsChanged event,
      Emitter<PagingState<List<MediaModel>>> emit) {
    _ids = event.ids;
    emit(state.copyWithTrackedIds(event.ids));
  }
}

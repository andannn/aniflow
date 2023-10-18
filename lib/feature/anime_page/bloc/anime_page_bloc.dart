import 'dart:async';

import 'package:anime_tracker/core/common/model/anime_category.dart';
import 'package:anime_tracker/core/common/util/global_static_constants.dart';
import 'package:anime_tracker/core/data/ani_list_repository.dart';
import 'package:anime_tracker/core/data/auth_repository.dart';
import 'package:anime_tracker/core/data/load_result.dart';
import 'package:anime_tracker/core/data/media_information_repository.dart';
import 'package:anime_tracker/core/data/model/anime_model.dart';
import 'package:anime_tracker/feature/common/page_loading_state.dart';
import 'package:anime_tracker/feature/common/paging_bloc.dart';
import 'package:bloc/bloc.dart';

class _OnTrackingAnimeIdsChanged<T> extends PagingEvent<T> {
  final Set<String> ids;

  _OnTrackingAnimeIdsChanged({required this.ids});
}

extension on PagingState<List<AnimeModel>> {
  PagingState<List<AnimeModel>> copyWithTrackedIds(Set<String> ids) {
    return updateWith(
      (animeList) => animeList
          .map((e) => e.copyWith(isFollowing: ids.contains(e.id)))
          .toList(),
    );
  }
}

class AnimePageBloc extends PagingBloc<AnimeModel> {
  AnimePageBloc({
    required this.category,
    required AuthRepository authRepository,
    required MediaInformationRepository aniListRepository,
    required AniListRepository animeTrackListRepository,
  })  : _mediaInfoRepository = aniListRepository,
        _authRepository = authRepository,
        _animeTrackListRepository = animeTrackListRepository,
        super(const PageInit(data: [])) {
    on<_OnTrackingAnimeIdsChanged<AnimeModel>>(_onTrackingAnimeIdsChanged);

    _init();
  }

  final AnimeCategory category;
  final MediaInformationRepository _mediaInfoRepository;
  final AniListRepository _animeTrackListRepository;
  final AuthRepository _authRepository;

  StreamSubscription? _trackingIdsStream;
  Set<String> _ids = {};

  void _init() async {
    final userData = await _authRepository.getUserDataStream().first;
    if (userData != null) {
      _trackingIdsStream =
          _animeTrackListRepository.getAnimeListAnimeIdsByUserStream(
        userData.id,
        [AnimeListStatus.planning, AnimeListStatus.current],
      ).listen((ids) {
        add(_OnTrackingAnimeIdsChanged(ids: ids));
      });
    }
  }

  @override
  Future<void> close() {
    _trackingIdsStream?.cancel();

    return super.close();
  }

  @override
  Future<LoadResult<List<AnimeModel>>> loadPage({required int page}) {
    return _mediaInfoRepository.loadAnimePageByCategory(
      category: category,
      loadType: Append(page: page, perPage: Config.defaultPerPageCount),
    );
  }

  @override
  void onEmitNewPagingState(PagingState<List<AnimeModel>> state,
      Emitter<PagingState<List<AnimeModel>>> emit) {
    super.onEmitNewPagingState(state.copyWithTrackedIds(_ids), emit);
  }

  FutureOr<void> _onTrackingAnimeIdsChanged(_OnTrackingAnimeIdsChanged event,
      Emitter<PagingState<List<AnimeModel>>> emit) {
    _ids = event.ids;
    emit(state.copyWithTrackedIds(event.ids));
  }

  @override
  FutureOr<void> onInit(
      OnInit<AnimeModel> event, Emitter<PagingState<List<AnimeModel>>> emit) {
    emit(const PageLoading(data: [], page: 1));

    /// launch event to get first page data.
    unawaited(createLoadPageTask(page: 1));
  }
}

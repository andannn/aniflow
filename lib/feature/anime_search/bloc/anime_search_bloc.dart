import 'dart:async';

import 'package:anime_tracker/core/common/util/global_static_constants.dart';
import 'package:anime_tracker/core/data/load_result.dart';
import 'package:anime_tracker/core/data/model/anime_model.dart';
import 'package:anime_tracker/core/data/search_repository.dart';
import 'package:anime_tracker/feature/common/page_loading_state.dart';
import 'package:anime_tracker/feature/common/paging_bloc.dart';
import 'package:bloc/bloc.dart';

class OnSearchStringCommit<T> extends PagingEvent<T> {
  final String searchString;

  OnSearchStringCommit({required this.searchString});
}

class SearchPageBloc extends PagingBloc<AnimeModel> {
  SearchPageBloc({
    required SearchRepository searchRepository,
  })  : _searchRepository = searchRepository,
        super(const PageInit(data: [])) {
    on<OnSearchStringCommit<AnimeModel>>(_onSearchStringCommit);
  }

  final SearchRepository _searchRepository;

  String? _searchString;

  @override
  FutureOr<void> onInit(
      OnInit<AnimeModel> event, Emitter<PagingState<List<AnimeModel>>> emit) {
    /// Do nothing.
  }

  @override
  Future<LoadResult<List<AnimeModel>>> loadPage({required int page}) async {
    if (_searchString == null) return LoadError(Exception("No search string"));
    return _searchRepository.loadMediaSearchResultByPage(
      page: page,
      perPage: Config.defaultPerPageCount,
      search: _searchString!,
    );
  }

  FutureOr<void> _onSearchStringCommit(OnSearchStringCommit<AnimeModel> event,
      Emitter<PagingState<List<AnimeModel>>> emit) {
    final newString = event.searchString;

    if (newString != _searchString) {
      _searchString = newString;

      emit(const PageLoading(data: [], page: 1));

      /// launch event to get first page data.
      unawaited(createLoadPageTask(page: 1));
    }
  }
}

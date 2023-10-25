import 'dart:async';

import 'package:aniflow/core/common/model/media_type.dart';
import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/search_repository.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/feature/common/page_loading_state.dart';
import 'package:aniflow/feature/common/paging_bloc.dart';
import 'package:bloc/bloc.dart';

class OnSearchStringCommit<T> extends PagingEvent<T> {
  final String searchString;

  OnSearchStringCommit({required this.searchString});
}

class SearchPageBloc extends PagingBloc<MediaModel> {
  SearchPageBloc({
    required SearchRepository searchRepository,
    required UserDataRepository userDataRepository,
  })  : _searchRepository = searchRepository,
        super(const PageInit(data: [])) {
    on<OnSearchStringCommit<MediaModel>>(_onSearchStringCommit);

    mediaType = userDataRepository.getMediaType();
  }

  final SearchRepository _searchRepository;

  String? _searchString;
  MediaType? mediaType;

  @override
  FutureOr<void> onInit(
      OnInit<MediaModel> event, Emitter<PagingState<List<MediaModel>>> emit) {
    /// Do nothing.
  }

  @override
  Future<LoadResult<List<MediaModel>>> loadPage(
      {required int page, bool isRefresh = false}) async {
    if (_searchString == null) return LoadError(Exception("No search string"));
    return _searchRepository.loadMediaSearchResultByPage(
      page: page,
      perPage: Config.defaultPerPageCount,
      type: mediaType!,
      search: _searchString!,
    );
  }

  FutureOr<void> _onSearchStringCommit(OnSearchStringCommit<MediaModel> event,
      Emitter<PagingState<List<MediaModel>>> emit) {
    final newString = event.searchString;

    if (newString != _searchString) {
      _searchString = newString;

      emit(const PageLoading(data: [], page: 1));

      /// launch event to get first page data.
      unawaited(createLoadPageTask(page: 1));
    }
  }
}

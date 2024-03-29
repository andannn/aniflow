import 'dart:async';

import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/search_repository.dart';
import 'package:aniflow/core/data/settings_repository.dart';
import 'package:aniflow/core/paging/page_loading_state.dart';
import 'package:aniflow/core/paging/paging_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

class OnSearchStringCommit<T> extends PagingEvent<T> {
  final String searchString;

  OnSearchStringCommit({required this.searchString});
}

@Injectable()
class SearchPageBloc extends PagingBloc<MediaModel> {
  SearchPageBloc(
    this._searchRepository,
    SettingsRepository settingsRepository,
  ) : super(const PageInit(data: [])) {
    on<OnSearchStringCommit<MediaModel>>(_onSearchStringCommit);

    mediaType = settingsRepository.getMediaType();
  }

  final SearchRepository _searchRepository;

  String? _searchString;
  MediaType? mediaType;

  @override
  Future<void> onInit(OnInit<MediaModel> event,
      Emitter<PagingState<List<MediaModel>>> emit) async {
    /// Do nothing.
  }

  @override
  Future<LoadResult<List<MediaModel>>> loadPage({
    required int page,
    bool isRefresh = false,
    CancelToken? cancelToken,
  }) async {
    if (_searchString == null) return LoadError(Exception("No search string"));
    return _searchRepository.loadMediaSearchResultByPage(
      page: page,
      perPage: AfConfig.defaultPerPageCount,
      type: mediaType!,
      search: _searchString!,
      token: cancelToken,
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

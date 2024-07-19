import 'dart:async';

import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/search_repository.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/core/paging/page_loading_state.dart';
import 'package:aniflow/core/paging/paging_bloc.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class MediaSearchResultPagingBloc extends PagingBloc<MediaModel> {
  MediaSearchResultPagingBloc(
    @factoryParam this._mediaType,
    @factoryParam this._searchString,
    this._searchRepository,
    this._userDataRepository,
  ) : super(const PageInit(data: []));

  final SearchRepository _searchRepository;
  final UserDataRepository _userDataRepository;

  final String _searchString;
  final MediaType _mediaType;

  @override
  Future<LoadResult<List<MediaModel>>> loadPage({
    required int page,
    bool isRefresh = false,
    CancelToken? cancelToken,
  }) async {
    return _searchRepository.loadMediaSearchResultByPage(
      page: page,
      perPage: AfConfig.defaultPerPageCount,
      type: _mediaType,
      search: _searchString,
      token: cancelToken,
      isAdult: _userDataRepository.displayAdultContent,
    );
  }
}

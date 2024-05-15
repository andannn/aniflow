import 'dart:async';

import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/model/user_model.dart';
import 'package:aniflow/core/data/search_repository.dart';
import 'package:aniflow/core/paging/page_loading_state.dart';
import 'package:aniflow/core/paging/paging_bloc.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class UserSearchResultPagingBloc extends PagingBloc<UserModel> {
  UserSearchResultPagingBloc(
    @factoryParam this._searchString,
    this._searchRepository,
  ) : super(const PageInit(data: []));

  final SearchRepository _searchRepository;
  final String _searchString;

  @override
  Future<LoadResult<List<UserModel>>> loadPage({
    required int page,
    bool isRefresh = false,
    CancelToken? cancelToken,
  }) async {
    return _searchRepository.loadUserSearchResultByPage(
      page: page,
      perPage: AfConfig.defaultPerPageCount,
      search: _searchString,
      token: cancelToken,
    );
  }
}

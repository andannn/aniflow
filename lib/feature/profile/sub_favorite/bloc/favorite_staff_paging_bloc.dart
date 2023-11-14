import 'dart:async';

import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/data/favorite_repository.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/model/staff_model.dart';
import 'package:aniflow/feature/common/page_loading_state.dart';
import 'package:aniflow/feature/common/refresh_paging_bloc.dart';
import 'package:dio/dio.dart';

class FavoriteStaffPagingBloc extends RefreshPagingBloc<StaffModel> {
  FavoriteStaffPagingBloc(
    this.userId, {
    required FavoriteRepository favoriteRepository,
  })  : _favoriteRepository = favoriteRepository,
        super(const PageInit(data: []));

  final String userId;
  final FavoriteRepository _favoriteRepository;

  @override
  Future<LoadResult<List<StaffModel>>> loadPage({
    required int page,
    bool isRefresh = false,
    CancelToken? cancelToken,
  }) {
    return _favoriteRepository.loadFavoriteStaffByPage(
      userId: userId,
      loadType: isRefresh
          ? const Refresh(Config.profilePageDefaultPerPageCount)
          : Append(page: page, perPage: Config.profilePageDefaultPerPageCount),
      token: cancelToken,
    );
  }
}

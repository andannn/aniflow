import 'dart:async';

import 'package:aniflow/core/common/setting/user_staff_name_language.dart';
import 'package:aniflow/core/data/favorite_repository.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/model/staff_model.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/core/paging/page_loading_state.dart';
import 'package:aniflow/core/paging/refresh_paging_bloc.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class FavoriteStaffPagingBloc extends RefreshPagingBloc<StaffModel> {
  FavoriteStaffPagingBloc(
    @factoryParam this.userId,
    this._favoriteRepository,
    this._userDataRepository,
    @factoryParam this.perPageCount,
  ) : super(const PageInit(data: []));

  final String userId;
  final FavoriteRepository _favoriteRepository;
  final UserDataRepository _userDataRepository;
  final int perPageCount;

  UserStaffNameLanguage get userTitleLanguage =>
      _userDataRepository.userStaffNameLanguage;

  @override
  Future<LoadResult<List<StaffModel>>> loadPage({
    required int page,
    bool isRefresh = false,
    CancelToken? cancelToken,
  }) {
    return _favoriteRepository.loadFavoriteStaffByPage(
      userId: userId,
      loadType: isRefresh
          ? Refresh(perPageCount)
          : Append(page: page, perPage: perPageCount),
      token: cancelToken,
    );
  }
}

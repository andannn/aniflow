import 'dart:async';

import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/data/favorite_repository.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/model/staff_model.dart';
import 'package:aniflow/feature/common/page_loading_state.dart';
import 'package:aniflow/feature/common/paging_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteStaffPagingBloc extends PagingBloc<StaffModel> {
  FavoriteStaffPagingBloc(
    this.userId, {
    required FavoriteRepository favoriteRepository,
  })  : _favoriteRepository = favoriteRepository,
        super(const PageInit(data: []));

  final String userId;
  final FavoriteRepository _favoriteRepository;

  @override
  FutureOr<void> onInit(OnInit<StaffModel> event,
      Emitter<PagingState<List<StaffModel>>> emit) async {
    await super.onInit(event, emit);

    /// Refresh data when init.
    /// Favorite data may be changed when change like state in detail screen.
    unawaited(createLoadPageTask(page: 1, isRefresh: true));
  }

  @override
  Future<LoadResult<List<StaffModel>>> loadPage(
      {required int page, bool isRefresh = false}) {
    return _favoriteRepository.loadFavoriteStaffByPage(
      userId: userId,
      loadType: isRefresh
          ? const Refresh()
          : Append(page: page, perPage: Config.defaultPerPageCount),
    );
  }
}

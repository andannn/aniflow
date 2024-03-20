import 'dart:async';

import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/core/data/model/staff_and_role_model.dart';
import 'package:aniflow/core/paging/page_loading_state.dart';
import 'package:aniflow/core/paging/paging_bloc.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class StaffPageBloc extends PagingBloc<StaffAndRoleModel> {
  StaffPageBloc(
    @factoryParam this.animeId,
    this._mediaInfoRepository,
  ) : super(const PageInit(data: []));

  final String animeId;
  final MediaInformationRepository _mediaInfoRepository;

  @override
  Future<LoadResult<List<StaffAndRoleModel>>> loadPage({
    required int page,
    bool isRefresh = false,
    CancelToken? cancelToken,
  }) {
    return _mediaInfoRepository.loadStaffPageByAnimeId(
      animeId: animeId,
      loadType: isRefresh
          ? const Refresh()
          : Append(page: page, perPage: AfConfig.defaultPerPageCount),
      token: cancelToken,
    );
  }
}

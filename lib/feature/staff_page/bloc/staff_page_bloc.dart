import 'dart:async';

import 'package:anime_tracker/core/common/util/global_static_constants.dart';
import 'package:anime_tracker/core/data/load_result.dart';
import 'package:anime_tracker/core/data/media_information_repository.dart';
import 'package:anime_tracker/core/data/model/staff_and_role_model.dart';
import 'package:anime_tracker/feature/common/page_loading_state.dart';
import 'package:anime_tracker/feature/common/paging_bloc.dart';
import 'package:bloc/bloc.dart';

class StaffPageBloc extends PagingBloc<StaffAndRoleModel> {
  StaffPageBloc(
    this.animeId, {
    required MediaInformationRepository aniListRepository,
  })  : _mediaInfoRepository = aniListRepository,
        super(const PageInit(data: []));

  final String animeId;
  final MediaInformationRepository _mediaInfoRepository;

  @override
  Future<LoadResult<List<StaffAndRoleModel>>> loadPage({required int page}) {
    return _mediaInfoRepository.loadStaffPageByAnimeId(
      animeId: animeId,
      loadType: Append(page: page, perPage: Config.defaultPerPageCount),
    );
  }

  @override
  FutureOr<void> onInit(OnInit<StaffAndRoleModel> event,
      Emitter<PagingState<List<StaffAndRoleModel>>> emit) {
    emit(const PageLoading(data: [], page: 1));

    /// launch event to get first page data.
    unawaited(createLoadPageTask(page: 1));
  }
}

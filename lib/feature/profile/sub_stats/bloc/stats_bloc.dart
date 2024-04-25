import 'package:aniflow/core/common/definitions/user_statics_sort.dart';
import 'package:aniflow/core/common/definitions/user_stats_type.dart';
import 'package:aniflow/core/common/setting/user_staff_name_language.dart';
import 'package:aniflow/core/common/setting/user_title_language.dart';
import 'package:aniflow/core/common/util/error_handler.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/user_statistics_model.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/core/data/user_statistics_repository.dart';
import 'package:aniflow/feature/profile/profile_bloc.dart';
import 'package:aniflow/feature/profile/sub_stats/bloc/stats_state.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

sealed class StatsEvent {}

class OnStatsTypeChanged extends StatsEvent {
  final UserStatisticType type;

  OnStatsTypeChanged({required this.type});
}

class _OnUserStatsContentChanged extends StatsEvent {
  final StatsLoadState loadState;

  _OnUserStatsContentChanged({required this.loadState});
}

@injectable
class StatsBloc extends Bloc<StatsEvent, StatsState>
    with LoadingStateNotifier<StatsEvent, StatsState> {
  StatsBloc(
    this.statisticsRepository,
    this.userDataRepository,
    @factoryParam this.userId,
  ) : super(const StatsState()) {
    on<OnStatsTypeChanged>(
      (event, emit) => emit(state.copyWith(type: event.type)),
    );

    on<_OnUserStatsContentChanged>(
      (event, emit) => emit(state.copyWith(loadState: event.loadState)),
    );

    // load initial content.
    _fetchUserStatics(type: state.type, sort: UserStaticsSort.count);
  }

  final UserStatisticsRepository statisticsRepository;
  final UserDataRepository userDataRepository;
  final String userId;
  CancelToken? _cancelToken;

  UserTitleLanguage get userTitleLanguage =>
      userDataRepository.userData.userTitleLanguage;

  UserStaffNameLanguage get userStaffNameLanguage =>
      userDataRepository.userData.userStaffNameLanguage;

  @override
  void onChange(Change<StatsState> change) {
    super.onChange(change);

    if (change.currentState.type != change.nextState.type) {
      // load content again when settings changed.
      _fetchUserStatics(
          type: change.nextState.type, sort: UserStaticsSort.count);
    }
  }

  @override
  Future<void> close() {
    _cancelToken?.cancel();

    return super.close();
  }

  Future _fetchUserStatics(
      {required UserStatisticType type, required UserStaticsSort sort}) async {
    logger.d('fetchUserStatics. stats type: $type, sort: $sort');
    // Cancel last task if needed.
    _cancelToken?.cancel();
    // Change state to Loading.
    add(_OnUserStatsContentChanged(loadState: const Loading()));

    final result = await statisticsRepository.getUserStatics(
        userId: userId, type: type, sort: sort);
    switch (result) {
      case LoadError<List<UserStatisticsModel>>():
        ErrorHandler.handleException(exception: result.exception);
      case LoadSuccess<List<UserStatisticsModel>>():
        add(_OnUserStatsContentChanged(loadState: Ready(result.data)));
    }
  }

  Future<LoadResult<List<MediaModel>>> getMediasById(
          {required List<String> ids, CancelToken? cancelToken}) =>
      statisticsRepository.getMediasById(ids: ids, cancelToken: cancelToken);

  @override
  bool isLoading(StatsState state) => state.loadState is Loading;
}

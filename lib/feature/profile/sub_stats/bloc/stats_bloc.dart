import 'package:aniflow/core/common/definitions/user_statics_sort.dart';
import 'package:aniflow/core/common/definitions/user_stats_type.dart';
import 'package:aniflow/core/common/util/error_handler.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/model/user_statistics_model.dart';
import 'package:aniflow/core/data/user_statistics_repository.dart';
import 'package:aniflow/feature/profile/profile_bloc.dart';
import 'package:aniflow/feature/profile/sub_stats/bloc/stats_state.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

sealed class StatsEvent {}

class OnStatsTypeChanged extends StatsEvent {
  final UserStatisticType type;

  OnStatsTypeChanged({required this.type});
}

class _OnUserStatsContentChanged extends StatsEvent {
  final StatsLoadState loadState;

  _OnUserStatsContentChanged({required this.loadState});
}

class StatsBloc extends Bloc<StatsEvent, StatsState>
    with LoadingStateNotifier<StatsEvent, StatsState> {
  StatsBloc(
    this.userId, {
    required this.repository,
  }) : super(const StatsState()) {
    on<OnStatsTypeChanged>(
      (event, emit) => emit(state.copyWith(type: event.type)),
    );

    on<_OnUserStatsContentChanged>(
      (event, emit) => emit(state.copyWith(loadState: event.loadState)),
    );

    // load initial content.
    _fetchUserStatics(type: state.type, sort: UserStaticsSort.count);
  }

  final UserStatisticsRepository repository;
  final String userId;
  CancelToken? _cancelToken;

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

    final result =
        await repository.getUserStatics(userId: userId, type: type, sort: sort);
    switch (result) {
      case LoadError<List<UserStatisticsModel>>():
        ErrorHandler.handleException(exception: result.exception);
      case LoadSuccess<List<UserStatisticsModel>>():
        add(_OnUserStatsContentChanged(loadState: Ready(result.data)));
    }
  }

  @override
  bool isLoading(StatsState state) => state.loadState is Loading;
}

import 'package:aniflow/core/common/definitions/user_stats_type.dart';
import 'package:aniflow/core/data/model/user_statistics_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stats_state.freezed.dart';

@freezed
class StatsState with _$StatsState {
  const factory StatsState({
    @Default(UserStatisticType.aimeGenres) UserStatisticType type,
    @Default(Loading()) StatsLoadState loadState,
  }) = _StatsState;
}

sealed class StatsLoadState {
  const StatsLoadState();
}

class Loading extends StatsLoadState {
  const Loading();
}

class Ready extends StatsLoadState {
  final List<UserStatisticsModel> models;

  const Ready(this.models);
}

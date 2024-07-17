import 'package:aniflow/core/common/util/bloc_util.dart';
import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/core/data/model/airing_schedule_and_anime_model.dart';
import 'package:aniflow/feature/aniflow_home/discover/airing_schedule/today_airing_schedule_state.dart';
import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';

sealed class TodayAiringScheduleEvent {}

class _OnTodayAiringScheduleChanged extends TodayAiringScheduleEvent {
  final List<AiringScheduleAndAnimeModel> schedules;

  _OnTodayAiringScheduleChanged(this.schedules);
}

@injectable
class TodayAiringScheduleBloc
    extends Bloc<TodayAiringScheduleEvent, TodayAiringScheduleState>
    with AutoCancelMixin {
  TodayAiringScheduleBloc(this._mediaRepository)
      : super(const TodayAiringScheduleState()) {
    on<_OnTodayAiringScheduleChanged>(
        (event, emit) => emit(state.copyWith(schedules: event.schedules)));

    final stream = _mediaRepository
        .getAiringScheduleAndAnimeByDateTimeStream(DateTime.now());

    autoCancel(
      () => stream
          .distinct(
            (pre, next) => const DeepCollectionEquality().equals(pre, next),
          )
          .listen((data) => add(_OnTodayAiringScheduleChanged(data))),
    );
  }

  final MediaInformationRepository _mediaRepository;
}

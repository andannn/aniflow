import 'package:aniflow/core/common/message/message.dart';
import 'package:aniflow/core/common/util/bloc_util.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/feature/airing_schedule/airing_schedule_of_day/schedule_page_state.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

sealed class AiringScheduleOfDayEvent {}

class _OnStateChangedEvent extends AiringScheduleOfDayEvent {
  final SchedulePageState state;

  _OnStateChangedEvent(this.state);
}

@injectable
class AiringScheduleOfDayBloc
    extends Bloc<AiringScheduleOfDayEvent, SchedulePageState> {
  AiringScheduleOfDayBloc(
    @factoryParam this._dateTime,
    this._mediaInfoRepository,
    this._messageRepository,
  ) : super(SchedulePageInit()) {
    on<_OnStateChangedEvent>((event, emit) => emit(event.state));

    _init();
  }

  final MediaInformationRepository _mediaInfoRepository;
  final MessageRepository _messageRepository;
  final DateTime _dateTime;

  void _init() async {
    final cachedAiringSchedules = await _mediaInfoRepository
        .getAiringScheduleAndAnimeByDateTime(_dateTime);
    if (cachedAiringSchedules.isNotEmpty) {
      safeAdd(_OnStateChangedEvent(
          SchedulePageReady(schedules: cachedAiringSchedules)));
      return;
    }

    /// Change to loading state.
    safeAdd(_OnStateChangedEvent(SchedulePageLoading()));

    /// refresh airing schedule.
    final result = await _mediaInfoRepository.refreshAiringSchedule(_dateTime);

    if (result is LoadError) {
      _messageRepository.handleException(result.exception);
      return;
    }

    /// Change to ready state.
    final airingSchedules = await _mediaInfoRepository
        .getAiringScheduleAndAnimeByDateTime(_dateTime);
    safeAdd(
        _OnStateChangedEvent(SchedulePageReady(schedules: airingSchedules)));
  }
}

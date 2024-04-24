import 'dart:async';

import 'package:aniflow/core/common/util/collection_util.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/core/data/aniflow_preferences_repository.dart';
import 'package:aniflow/feature/airing_schedule/bloc/airing_schedule_state.dart';
import 'package:aniflow/feature/airing_schedule/bloc/schedule_page_key.dart';
import 'package:aniflow/feature/airing_schedule/bloc/schedule_page_state.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

sealed class AiringScheduleEvent {}

class _OnScheduleKeyInitialized extends AiringScheduleEvent {
  final List<SchedulePageKey> keys;

  _OnScheduleKeyInitialized(this.keys);
}

class OnRequestScheduleData extends AiringScheduleEvent {
  final int pageIndex;

  OnRequestScheduleData(this.pageIndex);
}

@injectable
class AiringScheduleBloc
    extends Bloc<AiringScheduleEvent, AiringScheduleState> {
  AiringScheduleBloc(
    this._mediaInfoRepository,
    AfPreferencesRepository preferences,
  ) : super(AiringScheduleState(
    userTitleLanguage : preferences.userData.userTitleLanguage,
  )) {
    on<_OnScheduleKeyInitialized>(_onScheduleKeyInitialized);
    on<OnRequestScheduleData>(_onRequestScheduleData);

    _init();
  }

  final MediaInformationRepository _mediaInfoRepository;

  final _currentDateTime = DateTime.now();

  void _init() async {
    /// create schedule keys of 6 days before and 6 days after.
    List<SchedulePageKey> keys =
        createScheduleKeys(_currentDateTime, daysAgo: 6, daysAfter: 6);
    add(_OnScheduleKeyInitialized(keys));

    /// load today schedule.
    add(OnRequestScheduleData(6));
  }

  FutureOr<void> _onScheduleKeyInitialized(
      _OnScheduleKeyInitialized event, Emitter<AiringScheduleState> emit) {
    emit(state.copyWith(scheduleKeys: event.keys));
  }

  Future<void> _onRequestScheduleData(
      OnRequestScheduleData event, Emitter<AiringScheduleState> emit) async {
    final pageIndex = event.pageIndex;

    final pageKey = state.scheduleKeys[pageIndex];
    final pageState = state.schedulePageMap[pageKey] ?? SchedulePageInit();

    if (pageState is SchedulePageReady || pageState is SchedulePageLoading) {
      return;
    }

    /// Change to loading state.
    emit(
      state.copyWith(
        schedulePageMap: state.schedulePageMap.toMutableMap()
          ..[pageKey] = SchedulePageLoading(),
      ),
    );

    /// refresh airing schedule.
    final result =
        await _mediaInfoRepository.refreshAiringSchedule(pageKey.dateTime);

    if (result is LoadError) {
// TODO: error show snack bar
      return;
    }

    /// Change to ready state.
    final airingSchedules = await _mediaInfoRepository
        .getAiringScheduleAndAnimeByDateTime(pageKey.dateTime);
    emit(
      state.copyWith(
        schedulePageMap: state.schedulePageMap.toMutableMap()
          ..[pageKey] = SchedulePageReady(schedules: airingSchedules),
      ),
    );
  }
}

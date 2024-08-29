import 'package:aniflow/core/common/definitions/media_list_status.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/util/bloc_util.dart';
import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/data/model/airing_schedule_and_anime_model.dart';
import 'package:aniflow/feature/discover/airing_schedule/today_airing_schedule_state.dart';
import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

sealed class TodayAiringScheduleEvent {}

class _OnTodayAiringScheduleChanged extends TodayAiringScheduleEvent {
  final List<AiringScheduleAndAnimeModel> schedules;

  _OnTodayAiringScheduleChanged(this.schedules);
}

@injectable
class TodayAiringScheduleBloc
    extends Bloc<TodayAiringScheduleEvent, TodayAiringScheduleState>
    with AutoCancelMixin {
  TodayAiringScheduleBloc(
    @factoryParam this.userId,
    this._mediaRepository,
    this._mediaListRepository,
  ) : super(const TodayAiringScheduleState()) {
    on<_OnTodayAiringScheduleChanged>(
        (event, emit) => emit(state.copyWith(schedules: event.schedules)));

    final scheduleStream = _mediaRepository
        .getAiringScheduleAndAnimeByDateTimeStream(DateTime.now());

    final Stream<Set<String>> followingIdsStream;
    if (userId == null) {
      followingIdsStream = Stream.value(<String>{});
    } else {
      followingIdsStream = _mediaListRepository.getMediaIdsInMediaListStream(
        userId: userId!,
        status: [MediaListStatus.planning, MediaListStatus.current],
        type: MediaType.anime,
      );
    }

    autoCancel(
      () => CombineLatestStream.combine2(
        scheduleStream,
        followingIdsStream,
        _combine,
      )
          .distinct(
            (pre, next) => const DeepCollectionEquality().equals(pre, next),
          )
          .listen((data) => add(_OnTodayAiringScheduleChanged(data))),
    );
  }

  final String? userId;

  final MediaInformationRepository _mediaRepository;
  final MediaListRepository _mediaListRepository;

  List<AiringScheduleAndAnimeModel> _combine(
      List<AiringScheduleAndAnimeModel> schedules, Set<String> ids) {
    return schedules.map((schedule) {
      final isFollowing = ids.contains(schedule.mediaModel.id);
      return AiringScheduleAndAnimeModel(
        airingSchedule: schedule.airingSchedule,
        mediaModel: schedule.mediaModel.copyWith(isFollowing: isFollowing),
      );
    }).toList();
  }
}

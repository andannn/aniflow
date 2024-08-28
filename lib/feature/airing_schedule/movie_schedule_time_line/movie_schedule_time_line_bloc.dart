import 'package:aniflow/core/common/definitions/media_format.dart';
import 'package:aniflow/core/common/definitions/refresh_time_key.dart';
import 'package:aniflow/core/common/util/bloc_util.dart';
import 'package:aniflow/core/common/util/loading_state_mixin.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/core/data/message_repository.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/feature/airing_schedule/movie_schedule_time_line/month_schedule_category.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

sealed class MovieScheduleEvent {}

class _OnStateChangedEvent extends MovieScheduleEvent {
  final MovieScheduleState state;

  _OnStateChangedEvent(this.state);
}

class MovieScheduleState extends Equatable {
  const MovieScheduleState({this.models = const[]});

  final List<MediaModel> models;

  List<MonthScheduleCategory> get categories => models.toScheduleCategory();

  @override
  List<Object?> get props => [...models];
}

@injectable
class MovieScheduleTimeLineBloc
    extends Bloc<MovieScheduleEvent, MovieScheduleState>
    with LoadingControllerMixin, AutoCancelMixin {
  MovieScheduleTimeLineBloc(
    this._mediaRepository,
    this._messageRepository,
    this._userDataRepository,
  ) : super(const MovieScheduleState()) {
    on<_OnStateChangedEvent>((event, emit) => emit(event.state));

    autoCancel(
      () => _mediaRepository.getMediaStreamByAiringTimeRange(
        start: startDateGreater,
        end: endDateLesser,
        format: [MediaFormat.movie],
      ).listen((data) {
        safeAdd(_OnStateChangedEvent(MovieScheduleState(models: data)));
      }),
    );

    _refreshMovies();
  }

  final MediaInformationRepository _mediaRepository;
  final MessageRepository _messageRepository;
  final UserDataRepository _userDataRepository;

  final startDateGreater =
      DateTime.now().subtract(const Duration(days: 30 * 3));
  final endDateLesser = DateTime.now().add(const Duration(days: 30 * 6));

  void _refreshMovies() async {
    await doRefreshOrRejected(
      _userDataRepository,
      const RefreshTimeKey.recentMovies(),
      () async {
        final result = await _mediaRepository.refreshMoviesPage(
          startDateGreater: startDateGreater,
          endDateLesser: endDateLesser,
          isAdult: false,
        );

        return result;
      },
    );
  }

  @override
  void onLoadingFinished(List<LoadError> errors) {
    _messageRepository.handleException(errors.first.exception);
  }
}

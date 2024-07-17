import 'package:aniflow/core/common/message/message.dart';
import 'package:aniflow/core/common/util/bloc_util.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/media_information_repository.dart';
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

sealed class MovieScheduleState extends Equatable {
  const MovieScheduleState();

  @override
  List<Object?> get props => [];
}

class Loading extends MovieScheduleState {}

class Ready extends MovieScheduleState {
  final List<MediaModel> models;

  const Ready(this.models);

  List<MonthScheduleCategory> get categories => models.toScheduleCategory();

  @override
  List<Object?> get props => [...models];
}

@injectable
class MovieScheduleTimeLineBloc
    extends Bloc<MovieScheduleEvent, MovieScheduleState> {
  MovieScheduleTimeLineBloc(
    this.mediaRepository,
    this._messageRepository,
    this._userDataRepository,
  ) : super(Loading()) {
    on<_OnStateChangedEvent>((event, emit) => emit(event.state));

    _init();
  }

  final MediaInformationRepository mediaRepository;
  final MessageRepository _messageRepository;
  final UserDataRepository _userDataRepository;

  void _init() async {
    final startDateGreater =
        DateTime.now().subtract(const Duration(days: 30 * 3));
    final endDateLesser = DateTime.now().add(const Duration(days: 30 * 6));
    final result = await mediaRepository.refreshMoviesPage(
      startDateGreater: startDateGreater,
      endDateLesser: endDateLesser,
      isAdult: _userDataRepository.displayAdultContent,
    );

    switch (result) {
      case LoadError<List<MediaModel>>():
        _messageRepository.handleException(result.exception);
      case LoadSuccess<List<MediaModel>>():
        safeAdd(_OnStateChangedEvent(Ready(result.data)));
    }
  }
}

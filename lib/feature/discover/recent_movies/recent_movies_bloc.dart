import 'package:aniflow/core/common/definitions/media_format.dart';
import 'package:aniflow/core/common/util/bloc_util.dart';
import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/feature/discover/recent_movies/recent_movies_state.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

sealed class RecentMoviesEvent {}

class _OnRecentMoviesChanged extends RecentMoviesEvent {
  final List<MediaModel> models;

  _OnRecentMoviesChanged(this.models);
}

@injectable
class RecentMoviesBloc extends Bloc<RecentMoviesEvent, RecentMoviesState>
    with AutoCancelMixin {
  RecentMoviesBloc(
    this._repository,
  ) : super(const RecentMoviesState()) {
    on<_OnRecentMoviesChanged>(
      (event, emit) => emit(state.copyWith(movies: event.models)),
    );

    autoCancel(
      () => _repository.getMediaStreamByAiringTimeRange(
        start: DateTime.now()
            .subtract(const Duration(days: AfConfig.daysBeforeOfMoviesInHome)),
        end: DateTime.now()
            .add(const Duration(days: AfConfig.daysAfterOfMoviesInHome)),
        format: [MediaFormat.movie],
      ).listen((data) {
        add(_OnRecentMoviesChanged(data));
      }),
    );
  }

  final MediaInformationRepository _repository;
}

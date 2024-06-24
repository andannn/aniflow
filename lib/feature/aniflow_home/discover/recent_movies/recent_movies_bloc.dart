import 'dart:async';

import 'package:aniflow/core/common/definitions/media_format.dart';
import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/feature/aniflow_home/discover/recent_movies/recent_movies_state.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

sealed class RecentMoviesEvent {}

class _OnRecentMoviesChanged extends RecentMoviesEvent {
  final List<MediaModel> models;

  _OnRecentMoviesChanged(this.models);
}

@injectable
class RecentMoviesBloc extends Bloc<RecentMoviesEvent, RecentMoviesState> {
  RecentMoviesBloc(
    this._repository,
  ) : super(const RecentMoviesState()) {
    on<_OnRecentMoviesChanged>(
      (event, emit) => emit(state.copyWith(movies: event.models)),
    );

    _repository.getMediaStreamByAiringTimeRange(
      start: DateTime.now()
          .subtract(const Duration(days: AfConfig.daysBeforeOfMoviesInHome)),
      end: DateTime.now()
          .add(const Duration(days: AfConfig.daysAfterOfMoviesInHome)),
      format: [MediaFormat.movie],
    ).listen((data) {
      add(_OnRecentMoviesChanged(data));
    });
  }

  final MediaInformationRepository _repository;
  StreamSubscription? _subscription;

  @override
  Future<void> close() {
    _subscription?.cancel();

    return super.close();
  }
}

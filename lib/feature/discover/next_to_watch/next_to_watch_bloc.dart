import 'package:aniflow/core/common/definitions/media_list_status.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/util/bloc_util.dart';
import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/data/model/media_with_list_model.dart';
import 'package:aniflow/feature/discover/next_to_watch/next_to_watch_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

sealed class NextToWatchEvent {}

class _OnNextToWatchMediaChanged extends NextToWatchEvent {
  final List<MediaWithListModel> nextToWatchMedia;

  _OnNextToWatchMediaChanged(this.nextToWatchMedia);
}

@injectable
class NextToWatchBloc extends Bloc<NextToWatchEvent, NextToWatchState>
    with AutoCancelMixin {
  NextToWatchBloc(
    @factoryParam this._userId,
    @factoryParam this._mediaType,
    this._mediaListRepository,
  ) : super(const NextToWatchState()) {
    on<_OnNextToWatchMediaChanged>(
      (event, emit) => emit(
        state.copyWith(nextToWatchMediaList: event.nextToWatchMedia),
      ),
    );
    if (_mediaType == MediaType.anime && _userId != null) {
      autoCancel(
        () => _mediaListRepository.getSortedMediaListStream(
          status: [MediaListStatus.current, MediaListStatus.planning],
          userId: _userId!,
          type: _mediaType,
        ).listen((sorted) {
          final nextToWatchMedia = sorted.newUpdateList;
          add(_OnNextToWatchMediaChanged(nextToWatchMedia));
        }),
      );
    }
  }

  final MediaListRepository _mediaListRepository;
  final String? _userId;
  final MediaType _mediaType;
}

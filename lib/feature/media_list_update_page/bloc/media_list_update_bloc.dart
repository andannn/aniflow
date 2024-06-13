import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/data/model/media_with_list_model.dart';
import 'package:aniflow/feature/media_list_update_page/bloc/media_list_update_page_state.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

sealed class MediaListUpdateEvent {}

class _OnMediaListItemUpdated extends MediaListUpdateEvent {
  final MediaWithListModel model;

  _OnMediaListItemUpdated(this.model);
}

@injectable
class MediaListUpdateBloc
    extends Bloc<MediaListUpdateEvent, MediaListUpdatePageState> {
  MediaListUpdateBloc(
    @factoryParam this._mediaId,
    this._repository,
  ) : super(const MediaListUpdatePageState()) {
    on<_OnMediaListItemUpdated>(
        (event, emit) => emit(state.copyWith(mediaWithListModel: event.model)));
    _init();
  }

  final String _mediaId;
  final MediaListRepository _repository;

  void _init() async {
    final model = await _repository.getMediaListItemByMediaId(
      mediaId: _mediaId,
    );

    if (model == null) {
      throw "model is null";
    }

    add(_OnMediaListItemUpdated(model));
  }
}

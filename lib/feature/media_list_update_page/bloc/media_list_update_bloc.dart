import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/data/model/anime_list_item_model.dart';
import 'package:aniflow/feature/media_list_update_page/bloc/media_list_update_page_state.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

sealed class MediaListUpdateEvent {}

class _OnMediaListItemUpdated extends MediaListUpdateEvent {
  final MediaListItemModel model;

  _OnMediaListItemUpdated(this.model);
}

@injectable
class MediaListUpdateBloc
    extends Bloc<MediaListUpdateEvent, MediaListUpdatePageState> {
  MediaListUpdateBloc(
    @factoryParam this._mediaListId,
    this._repository,
  ) : super(const MediaListUpdatePageState()) {
    on<_OnMediaListItemUpdated>(
        (event, emit) => emit(state.copyWith(mediaListItemModel: event.model)));
    _init();
  }

  final String _mediaListId;
  final MediaListRepository _repository;

  void _init() async {
    final model = await _repository.getMediaListItemByMediaListId(
      mediaListId: _mediaListId,
    );

    if (model == null) {
      throw "model is null";
    }

    add(_OnMediaListItemUpdated(model));
  }
}

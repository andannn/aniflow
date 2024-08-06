import 'package:aniflow/core/common/definitions/media_list_status.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/util/bloc_util.dart';
import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/data/model/media_with_list_model.dart';
import 'package:aniflow/feature/profile/sub_media_list/media_list_sector_state.dart';
import 'package:aniflow/feature/settings/settings_category.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

class MediaListSectorParam {
  final StringBuilder name;
  final String userId;
  final MediaType type;
  final List<MediaListStatus> status;

  MediaListSectorParam({
    required this.name,
    required this.userId,
    required this.type,
    required this.status,
  });
}

sealed class MediaListSectorEvent {}

class _OnMediaListChanged extends MediaListSectorEvent {
  final List<MediaWithListModel> mediaList;

  _OnMediaListChanged(this.mediaList);
}

@injectable
class MediaListSectorBloc
    extends Bloc<MediaListSectorEvent, MediaListSectorState>
    with AutoCancelMixin {
  MediaListSectorBloc(
    @factoryParam this.param,
    this._mediaListRepository,
  ) : super(const MediaListSectorState()) {
    on<_OnMediaListChanged>(
      (event, emit) => emit(state.copyWith(mediaList: event.mediaList)),
    );

    autoCancel(
      () => _mediaListRepository
          .getMediaListStream(
            status: param.status,
            userId: param.userId,
            type: param.type,
          )
          .listen(
            (event) => add(_OnMediaListChanged(event)),
          ),
    );
  }

  final MediaListSectorParam param;
  final MediaListRepository _mediaListRepository;
}

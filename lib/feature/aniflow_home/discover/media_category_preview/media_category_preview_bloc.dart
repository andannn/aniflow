import 'dart:async';

import 'package:aniflow/core/common/definitions/media_category.dart';
import 'package:aniflow/core/common/definitions/media_list_status.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/util/bloc_util.dart';
import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/feature/aniflow_home/discover/media_category_preview/media_category_preview_state.dart';
import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

class MediaCategoryPreviewParams extends Equatable {
  final MediaCategory category;
  final String? userId;
  final MediaType mediaType;

  const MediaCategoryPreviewParams(
      {required this.category, required this.userId, required this.mediaType});

  @override
  List<Object?> get props => throw UnimplementedError();
}

sealed class MediaCategoryPreviewEvent {}

class _OnMediasChanged extends MediaCategoryPreviewEvent {
  final List<MediaModel> medias;

  _OnMediasChanged(this.medias);
}

@Injectable()
class MediaCategoryPreviewBloc
    extends Bloc<MediaCategoryPreviewEvent, MediaCategoryPreviewState> {
  MediaCategoryPreviewBloc(
    @factoryParam this._params,
    this._mediaInfoRepository,
    this._mediaListRepository,
  ) : super(const MediaCategoryPreviewState()) {
    on<_OnMediasChanged>(
      (event, emit) => emit(state.copyWith(data: event.medias)),
    );

    final mediaModelListStream = _mediaInfoRepository.getMediasOfCategory(
        category: _params.category, max: 6);

    final userId = _params.userId;
    final Stream<Set<String>> followingIdListStream;
    if (userId != null) {
      followingIdListStream = _mediaListRepository
          .getMediaIdsOfUserStream(
              userId: userId,
              status: [MediaListStatus.planning, MediaListStatus.current],
              type: _params.mediaType)
          .distinct(
              (pre, next) => const DeepCollectionEquality().equals(pre, next));
    } else {
      followingIdListStream = Stream.value({});
    }

    CombineLatestStream.combine2(
      mediaModelListStream,
      followingIdListStream,
      _combine,
    ).listen((mediaList) {
      safeAdd(_OnMediasChanged(mediaList));
    });
  }

  final MediaCategoryPreviewParams _params;
  final MediaInformationRepository _mediaInfoRepository;
  final MediaListRepository _mediaListRepository;

  StreamSubscription? _mediasSub;
  StreamSubscription? _listIdSub;

  @override
  Future<void> close() {
    _mediasSub?.cancel();
    _listIdSub?.cancel();
    return super.close();
  }

  List<MediaModel> _combine(
      List<MediaModel> mediaList, Set<String> followingIds) {
    return mediaList
        .map((e) => e.copyWith(isFollowing: followingIds.contains(e.id)))
        .toList();
  }
}

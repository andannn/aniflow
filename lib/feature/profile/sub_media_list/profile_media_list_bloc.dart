import 'package:aniflow/core/common/definitions/media_list_status.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/util/bloc_util.dart';
import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/feature/settings/settings_category.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

class ProfileMediaListParam {
  final String userId;
  final MediaType mediaType;

  ProfileMediaListParam({required this.userId, required this.mediaType});
}

sealed class ProfileMediaListEvent {
  const ProfileMediaListEvent();
}

class ProfileMediaListState {
  const ProfileMediaListState();
}

@injectable
class ProfileMediaListBloc
    extends Bloc<ProfileMediaListEvent, ProfileMediaListState>
    with AutoCancelMixin {
  ProfileMediaListBloc(
    @factoryParam this.param,
    this._mediaListRepository,
  ) : super(const ProfileMediaListState()) {
    MediaListSectorParam.buildSectors(param.mediaType, param.userId).forEach(
      (sector) {
        autoCancel(
          () => _mediaListRepository
              .getMediaListStream(
                status: sector.status,
                userId: sector.userId,
                type: sector.type,
              )
              .listen(
                (event) => null,
              // add(_OnMediaListChanged(event)),
              ),
        );
      },
    );

    _syncMediaList();
  }

  final ProfileMediaListParam param;
  final MediaListRepository _mediaListRepository;
  CancelToken? _token;

  Future onPullToRefresh() async {
    await _syncMediaList();
  }

  Future _syncMediaList() async {
    await _mediaListRepository.syncMediaList(
      userId: param.userId,
      mediaType: param.mediaType,
      token: _token,
      status: const [
        MediaListStatus.current,
        MediaListStatus.completed,
        MediaListStatus.dropped,
        MediaListStatus.paused,
        MediaListStatus.planning,
      ],
    );
  }

  @override
  Future<void> close() {
    _token?.cancel();
    return super.close();
  }
}

class MediaListSectorParam extends Equatable {
  final StringBuilder name;
  final String userId;
  final MediaType type;
  final List<MediaListStatus> status;

  const MediaListSectorParam({
    required this.name,
    required this.userId,
    required this.type,
    required this.status,
  });

  static List<MediaListSectorParam> buildSectors(
    MediaType type,
    String userId,
  ) =>
      switch (type) {
        MediaType.anime => [
            MediaListSectorParam(
              name: (context) => 'Planning',
              userId: userId,
              type: type,
              status: const [MediaListStatus.planning],
            ),
            MediaListSectorParam(
              name: (context) => 'Watching',
              userId: userId,
              type: type,
              status: const [MediaListStatus.current],
            ),
            MediaListSectorParam(
              name: (context) => 'Completed',
              userId: userId,
              type: type,
              status: const [MediaListStatus.completed],
            ),
            MediaListSectorParam(
              name: (context) => 'Dropped',
              userId: userId,
              type: type,
              status: const [MediaListStatus.dropped, MediaListStatus.paused],
            ),
          ],
        MediaType.manga => [
            MediaListSectorParam(
              name: (context) => 'Planning',
              userId: userId,
              type: type,
              status: const [MediaListStatus.planning],
            ),
            MediaListSectorParam(
              name: (context) => 'Reading',
              userId: userId,
              type: type,
              status: const [MediaListStatus.current],
            ),
            MediaListSectorParam(
              name: (context) => 'Dropped',
              userId: userId,
              type: type,
              status: const [MediaListStatus.dropped, MediaListStatus.paused],
            ),
          ],
      };

  @override
  List<Object?> get props => [name, userId, type, ...status];
}

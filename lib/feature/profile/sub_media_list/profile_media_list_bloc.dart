import 'package:aniflow/core/common/definitions/media_list_status.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/util/bloc_util.dart';
import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/data/model/media_with_list_model.dart';
import 'package:aniflow/feature/profile/sub_media_list/profile_media_list_state.dart';
import 'package:aniflow/feature/settings/settings_category.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

class ProfileMediaListParam extends Equatable {
  final String userId;
  final MediaType mediaType;

  const ProfileMediaListParam({required this.userId, required this.mediaType});

  @override
  List<Object?> get props => [userId, mediaType];
}

sealed class ProfileMediaListEvent {
  const ProfileMediaListEvent();
}

class _OnMediaListChanged extends ProfileMediaListEvent {
  final MediaListSectorParam param;
  final List<MediaWithListModel> models;

  const _OnMediaListChanged(
    this.param,
    this.models,
  );
}

@injectable
class ProfileAnimeListBloc extends ProfileMediaListBloc {
  ProfileAnimeListBloc(
    @factoryParam super.param,
    super.mediaListRepository,
  );
}

@injectable
class ProfileMangaListBloc extends ProfileMediaListBloc {
  ProfileMangaListBloc(
    @factoryParam super.param,
    super.mediaListRepository,
  );
}

abstract class ProfileMediaListBloc
    extends Bloc<ProfileMediaListEvent, ProfileMediaListState>
    with AutoCancelMixin {
  ProfileMediaListBloc(
    this.param,
    this._mediaListRepository,
  ) : super(const ProfileMediaListState()) {
    on<_OnMediaListChanged>(
      (event, emit) => emit(
        state.copyWith(
          sectorMap: {
            ...state.sectorMap,
            event.param: event.models,
          },
        ),
      ),
    );

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
                (event) => add(_OnMediaListChanged(sector, event)),
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
    await Future.wait([
      _mediaListRepository.syncMediaList(
        page: 1,
        userId: param.userId,
        mediaType: param.mediaType,
        token: _token,
        status: const [
          MediaListStatus.current,
          MediaListStatus.planning,
        ],
      ),
      _mediaListRepository.syncMediaList(
        page: 1,
        userId: param.userId,
        mediaType: param.mediaType,
        token: _token,
        status: const [
          MediaListStatus.completed,
        ],
      ),
      _mediaListRepository.syncMediaList(
        page: 1,
        userId: param.userId,
        mediaType: param.mediaType,
        token: _token,
        status: const [
          MediaListStatus.dropped,
        ],
      ),
    ]);
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
              name: (context) => context.appLocal.watching,
              userId: userId,
              type: type,
              status: const [MediaListStatus.current],
            ),
            MediaListSectorParam(
              name: (context) => context.appLocal.planning,
              userId: userId,
              type: type,
              status: const [MediaListStatus.planning],
            ),
            MediaListSectorParam(
              name: (context) => context.appLocal.completed,
              userId: userId,
              type: type,
              status: const [MediaListStatus.completed],
            ),
            MediaListSectorParam(
              name: (context) => context.appLocal.dropped,
              userId: userId,
              type: type,
              status: const [MediaListStatus.dropped, MediaListStatus.paused],
            ),
          ],
        MediaType.manga => [
            MediaListSectorParam(
              name: (context) => context.appLocal.planning,
              userId: userId,
              type: type,
              status: const [MediaListStatus.planning],
            ),
            MediaListSectorParam(
              name: (context) => context.appLocal.reading,
              userId: userId,
              type: type,
              status: const [MediaListStatus.current],
            ),
            MediaListSectorParam(
              name: (context) => context.appLocal.dropped,
              userId: userId,
              type: type,
              status: const [MediaListStatus.dropped, MediaListStatus.paused],
            ),
          ],
      };

  @override
  List<Object?> get props => [name, userId, type, ...status];
}

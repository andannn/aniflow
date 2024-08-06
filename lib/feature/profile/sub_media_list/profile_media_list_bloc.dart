import 'package:aniflow/core/common/definitions/media_list_status.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
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
    extends Bloc<ProfileMediaListEvent, ProfileMediaListState> {
  ProfileMediaListBloc(
    @factoryParam this.param,
    this._mediaListRepository,
  ) : super(const ProfileMediaListState()) {
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

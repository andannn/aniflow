import 'dart:async';

import 'package:aniflow/core/common/definitions/ani_list_settings.dart';
import 'package:aniflow/core/common/definitions/anime_season.dart';
import 'package:aniflow/core/common/definitions/media_category.dart';
import 'package:aniflow/core/common/definitions/media_list_status.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/common/message/message.dart';
import 'package:aniflow/core/common/util/anime_season_util.dart';
import 'package:aniflow/core/common/util/loading_state_mixin.dart';
import 'package:aniflow/core/data/auth_repository.dart';
import 'package:aniflow/core/data/character_repository.dart';
import 'package:aniflow/core/data/load_result.dart';
import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/core/data/media_list_repository.dart';
import 'package:aniflow/core/data/model/user_model.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/feature/aniflow_home/discover/discover_ui_state.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

sealed class DiscoverEvent {}

class _OnUserDataChanged extends DiscoverEvent {
  _OnUserDataChanged(this.userData);

  final UserModel? userData;
}

class _OnAniListSettingsChanged extends DiscoverEvent {
  _OnAniListSettingsChanged(this.settings);

  final AniListSettings settings;
}

class _OnLoadStateChanged extends DiscoverEvent {
  _OnLoadStateChanged(this.isLoading);

  final bool isLoading;
}

class _OnMediaTypeChanged extends DiscoverEvent {
  _OnMediaTypeChanged(this.mediaType);

  final MediaType mediaType;
}

extension DiscoverUiStateEx on DiscoverUiState {
  bool get isLoggedIn => userData != null;
}

@injectable
class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverUiState>
    with LoadingControllerMixin {
  DiscoverBloc(
    this._authRepository,
    this._mediaInfoRepository,
    this._mediaListRepository,
    this._userDataRepository,
    this._messageRepository,
    this._characterRepository,
  ) : super(DiscoverUiState()) {
    on<_OnUserDataChanged>(
      (event, emit) => emit(state.copyWith(userData: event.userData)),
    );
    on<_OnAniListSettingsChanged>(
      (event, emit) => emit(state.copyWith(settings: event.settings)),
    );
    on<_OnMediaTypeChanged>(
      (event, emit) => emit(state.copyWith(currentMediaType: event.mediaType)),
    );
    on<_OnLoadStateChanged>(
      (event, emit) => emit(state.copyWith(isLoading: event.isLoading)),
    );

    _userDataSub ??= _authRepository.getAuthedUserStream().listen(
      (userDataNullable) {
        add(_OnUserDataChanged(userDataNullable));
      },
    );

    _mediaTypeSub = _userDataRepository.userDataStream
        .map((event) => event.mediaType)
        .distinct()
        .listen(
      (mediaType) {
        add(_OnMediaTypeChanged(mediaType));
      },
    );

    _settingsSub ??= _authRepository.getAniListSettingsStream().listen(
      (settings) {
        add(_OnAniListSettingsChanged(settings));
      },
    );

    stream
        .map((e) => e.userData?.id)
        .distinct()
        .whereNotNull()
        .listen((userId) {
      /// post event to sync user media list.
      unawaited(_refreshAllMediaList(userId));

      /// post event to update user condition.
      unawaited(_authRepository.syncUserCondition());
    });

    stream.map((e) => e.currentMediaType).distinct().listen((type) async {
      await _refreshAllMediaPreview();
    });

    /// calculate the current anime season.
    final AnimeSeasonParam currentAnimeSeasonParam =
        AnimeSeasonUtil.getAnimeSeasonByDataTime(DateTime.now());

    /// get the saved anime season.
    final savedAnimeSeasonParam = _userDataRepository.getAnimeSeasonParam();

    if (currentAnimeSeasonParam != savedAnimeSeasonParam) {
      // season changed.
      unawaited(
        _userDataRepository.setAnimeSeasonParam(currentAnimeSeasonParam),
      );
    }

    _refreshBirthdayCharacters();
  }

  final AuthRepository _authRepository;
  final MediaInformationRepository _mediaInfoRepository;
  final MediaListRepository _mediaListRepository;
  final UserDataRepository _userDataRepository;
  final MessageRepository _messageRepository;
  final CharacterRepository _characterRepository;

  StreamSubscription? _userDataSub;
  StreamSubscription? _settingsSub;
  StreamSubscription? _mediaTypeSub;

  @override
  Future<void> close() {
    _userDataSub?.cancel();
    _mediaTypeSub?.cancel();
    _settingsSub?.cancel();

    return super.close();
  }

  Future onPullToRefreshTriggered() {
    final userId = state.userData?.id;
    return Future.wait([
      _refreshAllMediaPreview(),
      if (userId != null) _refreshAllMediaList(userId) else Future.value(),
    ]);
  }

  Future _refreshAllMediaPreview() async {
    final categories =
        MediaCategory.getAllCategoryByType(state.currentMediaType);
    for (final category in categories) {
      unawaited(_refreshMediaPreviewOfCategory(category));
    }
  }

  Future _refreshMediaPreviewOfCategory(MediaCategory category) async {
    startLoading(category.toString());
    final result = await _mediaInfoRepository.loadMediaPageByCategory(
      category: category,
      loadType: const Refresh(6),
    );
    finishLoading(category.toString(), result);
  }

  Future _refreshAllMediaList(String userId) async {
    startLoading('_refreshAllMediaList');
    final result = await _mediaListRepository.syncMediaList(
      userId: userId,
      status: [MediaListStatus.current, MediaListStatus.planning],
      mediaType: _userDataRepository.userData.mediaType,
    );
    finishLoading('_refreshAllMediaList', result);
  }

  Future _refreshBirthdayCharacters() async {
    startLoading('_refreshBirthdayCharacters');
    final result = await _characterRepository.loadBirthdayCharacterPage(
      loadType: const Refresh(12),
    );
    finishLoading('_refreshBirthdayCharacters', result);
  }

  @override
  void onLoadingFinished(List<LoadError> errors) {
    _messageRepository.handleException(errors.first.exception);
  }

  @override
  void onLoadingStateChanged(bool isLoading) {
    add(_OnLoadStateChanged(isLoading));
  }
}

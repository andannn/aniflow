import 'package:aniflow/core/common/util/app_version_util.dart';
import 'package:aniflow/core/common/util/bloc_util.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/data/app_update_dialog_util.dart';
import 'package:aniflow/core/data/auth_repository.dart';
import 'package:aniflow/core/data/github_repository.dart';
import 'package:aniflow/core/data/message_repository.dart';
import 'package:aniflow/core/data/model/user_model.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/feature/aniflow_home/aniflow_home_state.dart';
import 'package:aniflow/feature/aniflow_home/top_level_navigation.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

sealed class AniflowHomeEvent {}

class _OnUserDataChanged extends AniflowHomeEvent {
  final UserModel? userModel;

  _OnUserDataChanged(this.userModel);
}

class _IsSocialFeatureEnabledChange extends AniflowHomeEvent {
  final bool enabled;

  _IsSocialFeatureEnabledChange(this.enabled);
}

const _tag = 'AniflowHomeBloc';

@injectable
class AniflowHomeBloc extends Bloc<AniflowHomeEvent, AniflowHomeState>
    with AutoCancelMixin {
  AniflowHomeBloc(
    this._userDataRepository,
    this._authRepository,
    this._githubRepository,
    this._messageRepository,
  ) : super(const AniflowHomeState()) {
    on<_OnUserDataChanged>((event, emit) {
      emit(state.copyWith(userModel: event.userModel));
    });
    on<_IsSocialFeatureEnabledChange>((event, emit) {
      emit(state.copyWith(isSocialFeatureEnabled: event.enabled));
    });

    autoCancel(
      () => _userDataRepository.isSocialFeatureEnabledStream.listen(
        (enabled) {
          safeAdd(_IsSocialFeatureEnabledChange(enabled));
        },
      ),
    );

    autoCancel(
      () => _authRepository.getAuthedUserStream().listen(
        (userModel) {
          safeAdd(_OnUserDataChanged(userModel));
        },
      ),
    );

    _showAppUpdateDialogIfNeeded();
  }

  final UserDataRepository _userDataRepository;
  final AuthRepository _authRepository;
  final MessageRepository _messageRepository;
  final GithubRepository _githubRepository;

  void _showAppUpdateDialogIfNeeded() async {
    if (!_userDataRepository.isAppUpdateDialogFeatureEnabled) {
      logger.d('$_tag AppUpdateDialog Feature disabled');
      return;
    }

    final currentVersion = await AppVersionUtil.currentVersion;

    if (currentVersion == null) {
      logger.d('$_tag can not get current version');
      return;
    }

    await _githubRepository.refreshAndGetLatestRelease();

    final latestReleasedPackage =
        await _githubRepository.getLatestReleasePackageStream().first;
    if (latestReleasedPackage == null) {
      logger.d('$_tag No latestReleasedPackage');
      return;
    }
    await showAppUpdateDialogIfNeeded(
      messageRepository: _messageRepository,
      latestReleasedPackage: latestReleasedPackage,
    );
  }
}


extension AniflowHomeStateEx on AniflowHomeState {
  bool get isLogIn => userModel != null;

  List<TopLevelNavigation> get topLevelNavigationList {
    if (isLogIn) {
      if (isSocialFeatureEnabled) {
        return [
          TopLevelNavigation.discover,
          TopLevelNavigation.track,
          TopLevelNavigation.social,
          TopLevelNavigation.profile,
        ];
      } else {
        return [
          TopLevelNavigation.discover,
          TopLevelNavigation.track,
          TopLevelNavigation.profile,
        ];
      }
    } else {
      return [
        TopLevelNavigation.discover,
        TopLevelNavigation.track,
      ];
    }
  }
}

import 'package:aniflow/core/common/dialog/dialog_type.dart';
import 'package:aniflow/core/common/dialog/message_dialog.dart';
import 'package:aniflow/core/common/util/app_version_util.dart';
import 'package:aniflow/core/common/util/bloc_util.dart';
import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/data/auth_repository.dart';
import 'package:aniflow/core/data/message_repository.dart';
import 'package:aniflow/core/data/model/user_model.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/feature/aniflow_home/aniflow_home_state.dart';
import 'package:aniflow/feature/aniflow_home/top_level_navigation.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/transformers.dart';
import 'package:url_launcher/url_launcher.dart';

sealed class AniflowHomeEvent {}

class _OnUserDataChanged extends AniflowHomeEvent {
  final UserModel? userModel;

  _OnUserDataChanged(this.userModel);
}

class _IsSocialFeatureEnabledChange extends AniflowHomeEvent {
  final bool enabled;

  _IsSocialFeatureEnabledChange(this.enabled);
}

@injectable
class AniflowHomeBloc extends Bloc<AniflowHomeEvent, AniflowHomeState>
    with AutoCancelMixin {
  AniflowHomeBloc(
    this._userDataRepository,
    this._authRepository,
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

  void _showAppUpdateDialogIfNeeded() async {
    if (!_userDataRepository.isAppUpdateDialogFeatureEnabled) {
      logger.d('AppUpdateDialog Feature disabled');
      return;
    }

    final currentVersion = await AppVersionUtil.currentVersion;

    if (currentVersion == null) {
      logger.d('can not get current version');
      return;
    }

    await Future.delayed(const Duration(seconds: 1));

    autoCancel(
      () => _userDataRepository.latestAppVersion
          .whereNotNull()
          .distinct()
          .listen((latestAppVersion) async {
        logger.d('update dialog latestAppVersion $latestAppVersion');
        if (latestAppVersion.compareTo(currentVersion) > 0) {
          logger.d('show app update dialog latestAppVersion $latestAppVersion');
          final result =
              await _messageRepository.showDialog<MessageDialogResult>(
            DialogType.appUpdate(appVersion: latestAppVersion.toString()),
          );
          if (result == MessageDialogResult.clickPositive) {
            final uri = Uri.parse(AfConfig.appDownloadLink(latestAppVersion));
            await launchUrl(uri);
          }
        }
      }),
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

import 'package:aniflow/app/app_state.dart';
import 'package:aniflow/core/common/message/dialog_message.dart';
import 'package:aniflow/core/common/message/message.dart';
import 'package:aniflow/core/common/setting/theme_setting.dart';
import 'package:aniflow/core/common/util/app_version_util.dart';
import 'package:aniflow/core/common/util/bloc_util.dart';
import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:url_launcher/url_launcher.dart';

sealed class AppEvent {}

class _OnThemeSettingChanged extends AppEvent {
  final ThemeSetting themeMode;

  _OnThemeSettingChanged(this.themeMode);
}

@injectable
class AppBloc extends Bloc<AppEvent, AppState> with AutoCancelMixin {
  AppBloc(this._userDataRepository, this._messageRepository)
      : super(const AppState()) {
    on<_OnThemeSettingChanged>(
      (event, emit) => emit(state.copyWith(theme: event.themeMode)),
    );

    autoCancel(
      () => _userDataRepository.themeSettingStream.listen(
        (theme) => safeAdd(
          _OnThemeSettingChanged(theme),
        ),
      ),
    );

    _showAppUpdateDialogIfNeeded();
  }

  final UserDataRepository _userDataRepository;
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
          .listen((latestAppVersion) {
        logger.d('update dialog latestAppVersion $latestAppVersion');
        if (latestAppVersion.compareTo(currentVersion) > 0) {
          logger.d('show app update dialog latestAppVersion $latestAppVersion');
          _messageRepository.showMessage(
            AppUpdateDialogMessage(
              newVersion: latestAppVersion,
              onClickPositive: () {
                final uri =
                    Uri.parse(AfConfig.appDownloadLink(latestAppVersion));
                launchUrl(uri);
              },
            ),
          );
        }
      }),
    );
  }
}

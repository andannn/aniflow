import 'dart:async';

import 'package:aniflow/core/common/dialog/dialog_type.dart';
import 'package:aniflow/core/common/dialog/message_dialog.dart';
import 'package:aniflow/core/common/util/app_version_util.dart';
import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/data/message_repository.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/feature/settings/check_for_update/check_for_update_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:url_launcher/url_launcher.dart';

sealed class CheckForUpdateEvent {}

class OnClickItem extends CheckForUpdateEvent {}

class _Init extends CheckForUpdateEvent {}

@injectable
class CheckForUpdateBloc
    extends Bloc<CheckForUpdateEvent, CheckForUpdateState> {
  CheckForUpdateBloc(this._userDataRepository, this._messageRepository)
      : super(const CheckForUpdateState()) {
    on<OnClickItem>(_onClickItem);
    on<_Init>(_init);

    add(_Init());
  }

  final UserDataRepository _userDataRepository;
  final MessageRepository _messageRepository;

  FutureOr<void> _init(_Init event, Emitter<CheckForUpdateState> emit) async {
    emit(state.copyWith(isLoading: true));
    final currentVersion = await AppVersionUtil.currentVersion;
    emit(state.copyWith(currentVersion: currentVersion));
    final latestVersion =
        await _userDataRepository.updateAndGetLatestAppVersion();
    emit(state.copyWith(isLoading: false, latestVersion: latestVersion));
  }

  void _onClickItem(
      OnClickItem event, Emitter<CheckForUpdateState> emit) async {
    if (state.isLoading) {
      return;
    }
    emit(state.copyWith(isLoading: true));
    final latestVersion =
        await _userDataRepository.updateAndGetLatestAppVersion();
    if (latestVersion == null) {
      logger.d('Can not get latest app version');
      emit(state.copyWith(isLoading: false));
      return;
    }
    emit(state.copyWith(isLoading: false, latestVersion: latestVersion));

    final currentVersion = state.currentVersion;

    if (currentVersion == null) {
      logger.d('currentVersion is null');
      return;
    }

    if (latestVersion.compareTo(currentVersion) > 0) {
      logger.d('show app update dialog latestAppVersion $latestVersion');
      final result = await _messageRepository.showDialog<MessageDialogResult>(
        DialogType.appUpdate(appVersion: latestVersion.toString()),
      );
      if (result == MessageDialogResult.clickPositive) {
        final uri = Uri.parse(AfConfig.appDownloadLink(latestVersion));
        await launchUrl(uri);
      }
    } else if (latestVersion.compareTo(currentVersion) == 0) {
      await _messageRepository.showDialog<MessageDialogResult>(
        const DialogType.appUpToDate(),
      );
    }
  }
}

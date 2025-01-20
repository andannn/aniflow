import 'dart:async';

import 'package:aniflow/core/common/util/app_version_util.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/data/app_update_dialog_util.dart';
import 'package:aniflow/core/data/github_repository.dart';
import 'package:aniflow/core/data/message_repository.dart';
import 'package:aniflow/feature/settings/check_for_update/check_for_update_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

sealed class CheckForUpdateEvent {}

class OnClickItem extends CheckForUpdateEvent {}

class _Init extends CheckForUpdateEvent {}

@injectable
class CheckForUpdateBloc
    extends Bloc<CheckForUpdateEvent, CheckForUpdateState> {
  CheckForUpdateBloc(this._messageRepository, this._githubRepository)
      : super(const CheckForUpdateState()) {
    on<OnClickItem>(_onClickItem);
    on<_Init>(_init);

    add(_Init());
  }

  final MessageRepository _messageRepository;
  final GithubRepository _githubRepository;

  FutureOr<void> _init(_Init event, Emitter<CheckForUpdateState> emit) async {}

  void _onClickItem(
      OnClickItem event, Emitter<CheckForUpdateState> emit) async {
    if (state.isLoading) {
      return;
    }
    final currentVersion = await AppVersionUtil.currentVersion;
    emit(state.copyWith(currentVersion: currentVersion));

    if (currentVersion == null) {
      logger.d('currentVersion is null');
      return;
    }

    emit(state.copyWith(isLoading: true));
    await _githubRepository.refreshAndGetLatestRelease();
    final latestReleasedPackage =
        await _githubRepository.getLatestReleasePackageStream().first;

    emit(
      state.copyWith(
        isLoading: false,
        latestReleasedPackage: latestReleasedPackage,
      ),
    );

    if (latestReleasedPackage == null) {
      logger.d('latestReleasedPackage is null');
      return;
    }

    await showAppUpdateDialogIfNeeded(
      messageRepository: _messageRepository,
      latestReleasedPackage: latestReleasedPackage,
    );
  }
}

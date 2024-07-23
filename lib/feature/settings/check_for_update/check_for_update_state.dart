import 'package:aniflow/core/common/util/app_version_util.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_for_update_state.freezed.dart';

@freezed
class CheckForUpdateState with _$CheckForUpdateState {
  const factory CheckForUpdateState({
    @Default(false) bool isLoading,
    AppVersion? currentVersion,
    AppVersion? latestVersion,
  }) = _CheckForUpdateState;
}

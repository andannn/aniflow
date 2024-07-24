import 'package:aniflow/core/common/message/message.dart';
import 'package:aniflow/core/common/util/app_version_util.dart';
import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/feature/settings/settings_category.dart';

class AppUpdateDialogMessage extends DialogMessage {
  const AppUpdateDialogMessage(
      {required this.newVersion, required super.onClickPositive})
      : super(id: 'update_app');

  final AppVersion newVersion;

  @override
  StringBuilder? get title => (context) => context.appLocal.appUpgrade;

  @override
  StringBuilder get message =>
      (context) => context.appLocal.upgradeDialogMessage(newVersion.toString());

  @override
  StringBuilder? get positiveLabel => (context) => context.appLocal.upgrade;

  @override
  StringBuilder? get negativeLabel =>
      (context) => context.appLocal.upgradeDialogDenyActionLabel;

  @override
  List<Object?> get props => [id, newVersion];
}

class AppUpToDateDialogMessage extends DialogMessage {
  const AppUpToDateDialogMessage() : super(id: 'up_to_date');

  @override
  StringBuilder? get message => (context) => context.appLocal.appUpToDate;

  @override
  StringBuilder? get positiveLabel =>
      (context) => context.materialLocal.okButtonLabel;

  @override
  List<Object?> get props => [id];
}

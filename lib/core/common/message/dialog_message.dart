import 'package:aniflow/core/common/message/message.dart';
import 'package:aniflow/core/common/util/app_version_util.dart';
import 'package:aniflow/feature/settings/bloc/settings_category.dart';

class AppUpdateDialogMessage extends DialogMessage {
  const AppUpdateDialogMessage(
      {required this.newVersion,
      required super.onClickPositive})
      : super(id: 'update_app');

  final AppVersion newVersion;

  @override
  StringBuilder? get title => (context) => 'App upgrade';

  @override
  StringBuilder get message => (context) =>
      'New version is available($newVersion).\nWould you like to upgrade now?';

  @override
  StringBuilder? get positiveLabel => (context) => 'UPGRADE';

  @override
  StringBuilder? get negativeLabel => (context) => "NO, THANKS";

  @override
  List<Object?> get props => [id, newVersion];
}

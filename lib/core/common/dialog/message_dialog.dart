import 'package:aniflow/core/common/dialog/dialog_type.dart';
import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/feature/settings/settings_category.dart';
import 'package:flutter/material.dart';

enum MessageDialogResult {
  clickPositive,
  clickNegative,
}

extension DialogTypeExtension on MessageDialog {
  Widget buildDialog(context) {
    return AlertDialog(
      title: title != null ? Text(title!(context)) : null,
      content: Text(message!(context)),
      actions: [
        if (negativeLabel != null)
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(MessageDialogResult.clickNegative);
            },
            child: Text(negativeLabel!(context)),
          ),
        if (positiveLabel != null)
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(MessageDialogResult.clickPositive);
            },
            child: Text(positiveLabel!(context)),
          ),
      ],
    );
  }

  StringBuilder? get title {
    switch (this) {
      case AppUpToDateDialog():
        return (context) => context.appLocal.appUpgrade;
      default:
        return null;
    }
  }

  StringBuilder? get message {
    switch (this) {
      case AppUpToDateDialog():
        return (context) => context.appLocal.appUpToDate;
      case AppUpdateDialog(appVersion: final newVersion):
        return (context) => context.appLocal.upgradeDialogMessage(newVersion);
      default:
        return null;
    }
  }

  StringBuilder? get positiveLabel {
    switch (this) {
      case AppUpToDateDialog():
        return (context) => context.materialLocal.okButtonLabel;
      case AppUpdateDialog():
        return (context) => context.appLocal.upgrade;
      default:
        return null;
    }
  }

  StringBuilder? get negativeLabel {
    switch (this) {
      case AppUpdateDialog():
        return (context) => context.appLocal.upgradeDialogDenyActionLabel;
      default:
        return null;
    }
  }
}


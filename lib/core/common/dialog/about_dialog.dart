import 'package:aniflow/core/common/dialog/dialog_type.dart';
import 'package:aniflow/core/design_system/assets/icons.dart';
import 'package:flutter/material.dart';

class AboutDialogResult {}

extension AboutDialogExtension on AniFlowAboutDialog {
  Widget buildDialog(BuildContext context) {
    return AboutDialog(
      applicationName: applicationName,
      applicationVersion: applicationVersion,
      applicationLegalese: applicationLegalese,
      applicationIcon: SizedBox.square(
        dimension: 48,
        child: Image.asset(appIcon),
      ),
    );
  }

  String get applicationName => 'AniFlow';

  String get applicationVersion {
    return appVersion;
  }

  String get applicationLegalese => '© 2024 Andannn. All rights reserved.';

  String get appIcon => AfIcons.icApp;
}

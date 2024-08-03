import 'package:aniflow/core/common/dialog/dialog_type.dart';
import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/core/design_system/assets/video.dart';
import 'package:aniflow/feature/settings/settings_category.dart';
import 'package:aniflow/feature/toturial/gesture_tutorial.dart';
import 'package:flutter/material.dart';

class TutorialDialogResult {}

extension TutorialDialogExtension on TutorialDialog {
  Widget buildDialog(BuildContext context) {
    return AlertDialog(
      title: Text(context.appLocal.tutorialTitle),
      content: GestureTutorial(title: title!(context), datasource: dataSource!),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(context.materialLocal.okButtonLabel),
        ),
      ],
    );
  }

  StringBuilder? get title {
    switch (this) {
      case LongPressGestureTutorialDialog():
        return (context) => context.appLocal.longPressManageList;
      case SlideGestureTutorialDialog():
        return (context) => context.appLocal.slideLeftMarkWatched;
      default:
        return null;
    }
  }

  String? get dataSource {
    switch (this) {
      case LongPressGestureTutorialDialog():
        return AfVideo.longPressGestureVideo;
      case SlideGestureTutorialDialog():
        return AfVideo.slidingGestureVideo;
      default:
        return null;
    }
  }
}

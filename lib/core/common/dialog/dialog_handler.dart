import 'dart:async';

import 'package:aniflow/core/common/dialog/about_dialog.dart';
import 'package:aniflow/core/common/dialog/dialog_type.dart';
import 'package:aniflow/core/common/dialog/message_dialog.dart';
import 'package:aniflow/core/common/dialog/tutorial_dialog.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/data/message_repository.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class DialogEventHandler extends StatefulWidget {
  const DialogEventHandler({super.key, required this.child});

  final Widget child;

  @override
  State<DialogEventHandler> createState() => _DialogEventHandlerState();
}

class _DialogEventHandlerState extends State<DialogEventHandler>
    with _ShowDialogMixin {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

mixin _ShowDialogMixin<T extends StatefulWidget> on State<T> {
  late StreamSubscription _messageSub;

  MessageRepository get messageRepo => GetIt.instance.get<MessageRepository>();

  UserDataRepository get userDataRepo =>
      GetIt.instance.get<UserDataRepository>();

  static bool isShowingDialog = false;

  @override
  void initState() {
    super.initState();

    _messageSub = messageRepo.getDialogMessageStream().listen(
      (message) {
        if (ModalRoute.of(context)?.isCurrent == false) {
          // current page is not top.
          return;
        }

        _showDialogAndWaitingResult(message);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();

    _messageSub.cancel();
  }

  Future _showDialogAndWaitingResult(final DialogType dialog) async {
    if (isShowingDialog) {
      logger.d('Dialog is already showing, reject $dialog');
      return;
    }

    isShowingDialog = true;
    final result = await _showDialog(
      context: context,
      type: dialog,
    );
    await userDataRepo.setDialogClosedTime(dialog, DateTime.now());
    isShowingDialog = false;
    messageRepo.onDialogResult(result);
  }
}

Future<T?> _showDialog<T>({
  required BuildContext context,
  required DialogType type,
}) {
  Widget builder(BuildContext context) {
    if (type is MessageDialog) {
      return (type as MessageDialog).buildDialog(context);
    } else if (type is TutorialDialog) {
      return (type as TutorialDialog).buildDialog(context);
    } else if (type is AniFlowAboutDialog) {
      return type.buildDialog(context);
    } else {
      throw Exception('Unknown dialog type: $type');
    }
  }

  return Navigator.of(context).push<T>(
    DialogRoute<T>(context: context, builder: builder),
  );
}

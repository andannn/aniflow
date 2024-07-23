import 'dart:async';

import 'package:aniflow/core/common/message/message.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

mixin ShowDialogMixin<T extends StatefulWidget> on State<T> {
  late StreamSubscription _messageSub;

  @override
  void initState() {
    super.initState();

    final repo = GetIt.instance.get<MessageRepository>();
    _messageSub = repo.getDialogMessageStream().listen(
      (message) {
        if (ModalRoute.of(context)?.isCurrent == false) {
          // current page is not top.
          return;
        }

        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title:
                  message.title != null ? Text(message.title!(context)) : null,
              content: Text(message.message!(context)),
              actions: [
                if (message.negativeLabel != null)
                  TextButton(
                    onPressed: () {
                      message.onClickNegative?.call();
                      Navigator.of(context).pop();
                    },
                    child: Text(message.negativeLabel!(context)),
                  ),
                if (message.positiveLabel != null)
                  TextButton(
                    onPressed: () {
                      message.onClickPositive?.call();
                      Navigator.of(context).pop();
                    },
                    child: Text(message.positiveLabel!(context)),
                  ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();

    _messageSub.cancel();
  }
}

import 'dart:async';

import 'package:aniflow/app/di/get_it_scope.dart';
import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/data/message_repository.dart';
import 'package:flutter/material.dart';

const String _tag = 'ShowSnackBarMixin';

mixin ShowSnackBarMixin<T extends StatefulWidget> on State<T> {
  late StreamSubscription _messageSub;
  ScaffoldFeatureController? _currentSnackBarController;

  @override
  void initState() {
    super.initState();

    final repo = GetItScope.of(context).get<MessageRepository>();
    _messageSub = repo.getSnackBarMessageStream().listen(
      (message) {
        if (ModalRoute.of(context)?.isCurrent == false) {
          // current page is not top.
          return;
        }

        _showSnackBar(message);
      },
    );
  }

  @override
  void dispose() {
    super.dispose();

    _messageSub.cancel();
  }

  void _showSnackBar(SnackBarMessage message) async {
    _currentSnackBarController = _showSnackBarMessage(
      context: context,
      label: message.translated(context),
      duration: message.duration,
    );

    await _currentSnackBarController?.closed.then((reason) {
      logger.d('$_tag snack bar of message $message closed. reason: $reason.');
    });
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason>?
      _showSnackBarMessage(
          {required BuildContext context,
          String label = '',
          String action = '',
          SnackBarDuration duration = SnackBarDuration.long}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      _createSnackBar(context, label, action, duration),
    );
  }

  SnackBar _createSnackBar(BuildContext context, String label, String action,
      SnackBarDuration duration) {
    return SnackBar(
      content: Text(label),
      duration: duration.showDuration,
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.vertical,
      action: action.isNotEmpty
          ? SnackBarAction(label: action, onPressed: () {})
          : null,
    );
  }
}

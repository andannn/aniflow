import 'package:aniflow/app/app.dart';
import 'package:flutter/material.dart';

/// show snack bar.
/// if the [context] is null, [globalContext] will be used to show snack bar.
ScaffoldFeatureController<dynamic, SnackBarClosedReason> showSnackBarMessage(
    {BuildContext? context,
    String label = '',
    String action = '',
    SnackBarDuration duration = SnackBarDuration.long}) {
  return ScaffoldMessenger.of(context ?? globalContext!).showSnackBar(
    _createSnackBar(context ?? globalContext!, label, action, duration),
  );
}

enum SnackBarDuration {
  short(Duration(milliseconds: 1000)),
  medium(Duration(milliseconds: 2000)),
  long(Duration(milliseconds: 4000));

  final Duration showDuration;

  const SnackBarDuration(this.showDuration);
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

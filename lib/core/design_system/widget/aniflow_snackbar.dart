import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason>? showSnackBarMessage(
    {required BuildContext context,
    String label = '',
    String action = '',
    SnackBarDuration duration = SnackBarDuration.long}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    _createSnackBar(context, label, action, duration),
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

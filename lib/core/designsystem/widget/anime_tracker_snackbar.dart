import 'package:flutter/material.dart';
import 'package:anime_tracker/app/app.dart';

/// show snack bar.
/// if the [context] is null, [globalContext] will be used to show snack bar.
ScaffoldFeatureController<dynamic, SnackBarClosedReason> showSnackBarMessage(
    {BuildContext? context,
    String label = '',
    String action = ''}) {
  return ScaffoldMessenger.of(context ?? globalContext!)
      .showSnackBar(_createSnackBar(context ?? globalContext!, label, action));
}

SnackBar _createSnackBar(BuildContext context, String label, String action) {
  return SnackBar(
    content: Text(label),
    behavior: SnackBarBehavior.floating,
    dismissDirection: DismissDirection.vertical,
    action: action.isNotEmpty
        ? SnackBarAction(label: action, onPressed: () {})
        : null,
  );
}

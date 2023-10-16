import 'package:flutter/material.dart';

Future<T?> showFullScreenDialog<T>(BuildContext context, Widget content) =>
    showDialog(
      context: context,
      builder: (context) => Dialog.fullscreen(
        backgroundColor: Theme.of(context).dialogBackgroundColor.withAlpha(200),
        child: content,
      ),
    );

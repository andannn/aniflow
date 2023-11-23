import 'package:flutter/material.dart';

Future<bool?> showRestartAppDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) {
        final localization =
        Localizations.of<MaterialLocalizations>(
            context, MaterialLocalizations)!;
        return AlertDialog(
          content: const Text('Restart App to apply setting.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text(localization.cancelButtonLabel),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(localization.okButtonLabel),
            )
          ],
        );
      },
    );

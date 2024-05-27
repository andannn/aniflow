import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:flutter/material.dart';

Future<bool?> showRestartAppDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) {
        final localization = Localizations.of<MaterialLocalizations>(
            context, MaterialLocalizations)!;
        return AlertDialog(
          content: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              context.appLocal.restartAppHint,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
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

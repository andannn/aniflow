import 'package:flutter/material.dart';

Widget buildErrorWidget(BuildContext context, String url, error) {
  return Card(
    elevation: 0,
    color: Theme.of(context).colorScheme.surfaceVariant,
  );
}

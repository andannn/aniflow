import 'package:flutter/material.dart';

Widget buildErrorWidget(BuildContext context, String url, error) {
  return Center(
    child: Opacity(
      opacity: 0.5,
      child: Icon(Icons.error, color: Theme.of(context).colorScheme.error),
    ),
  );
}

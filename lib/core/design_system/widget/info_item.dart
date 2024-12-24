import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoItem extends StatelessWidget {
  const InfoItem(
      {super.key,
        required this.label,
        required this.iconData,
        required this.contentText});

  final String label;
  final String contentText;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 4),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                iconData,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              const SizedBox(width: 8),
              Text(
                contentText,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

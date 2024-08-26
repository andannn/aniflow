import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeButton extends StatelessWidget {
  const DateTimeButton({super.key, this.dateTime, this.onDateTimeChanged});

  final DateTime? dateTime;
  final Function(DateTime)? onDateTimeChanged;

  @override
  Widget build(BuildContext context) {
    final formattedDate = dateTime != null
        ? DateFormat("yyyy-MM-dd").format(dateTime!)
        : '----';
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: TextButton.icon(
        onPressed: () async {
          final dateTimeResult = await showDatePicker(
            context: context,
            initialDate: dateTime ?? DateTime.now(),
            firstDate: DateTime(1800),
            lastDate: DateTime.now(),
          );

          if (dateTimeResult != null && dateTime != dateTimeResult) {
            onDateTimeChanged?.call(dateTimeResult);
          }
        },
        label: Text(formattedDate),
        icon: const Icon(Icons.date_range_outlined),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MaxLimitTextFiled extends StatefulWidget {
  const MaxLimitTextFiled(
      {super.key, required this.initialValue, required this.maxValue});

  final int initialValue;
  final int? maxValue;

  @override
  State<MaxLimitTextFiled> createState() => _MaxLimitTextFiledState();
}

class _MaxLimitTextFiledState extends State<MaxLimitTextFiled> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialValue.toString(),
      inputFormatters: [
        TextInputFormatter.withFunction(
              (TextEditingValue oldValue, TextEditingValue newValue) {
            if (!RegExp(r'\d*').hasMatch(newValue.text)) {
              return oldValue;
            }

            final maxValue = widget.maxValue;
            if (maxValue != null) {
              final newValueNum = int.parse(newValue.text).clamp(0, maxValue);

              return newValue.copyWith(text: newValueNum.toString());
            } else {
              return newValue;
            }
          },
        )
      ],
      decoration: InputDecoration(
        suffixText:
        widget.maxValue != null ? '/${widget.maxValue.toString()}' : '/?',
        hintText: '0',
      ),
      keyboardType:
      const TextInputType.numberWithOptions(signed: true, decimal: true),
    );
  }
}

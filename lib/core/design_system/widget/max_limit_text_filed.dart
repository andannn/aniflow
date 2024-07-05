import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MaxLimitTextFiled extends StatefulWidget {
  const MaxLimitTextFiled(
      {super.key,
      required this.initialValue,
      this.maxValue,
      this.suffixText,
      this.onValueApplied});

  final int initialValue;
  final int? maxValue;
  final String? suffixText;
  final Function(int)? onValueApplied;

  @override
  State<MaxLimitTextFiled> createState() => _MaxLimitTextFiledState();
}

class _MaxLimitTextFiledState extends State<MaxLimitTextFiled> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController(text: widget.initialValue.toString());
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: TextInputAction.done,
      inputFormatters: [
        TextInputFormatter.withFunction(
          (TextEditingValue oldValue, TextEditingValue newValue) {
            if (newValue.text.isEmpty) {
              return const TextEditingValue(
                text: '0',
                selection: TextSelection.collapsed(offset: 1),
              );
            }

            if (!RegExp(r'^\d+$').hasMatch(newValue.text)) {
              return oldValue;
            }

            final maxValue = widget.maxValue;
            if (maxValue != null && newValue.text.isNotEmpty) {
              final newValueNumString =
                  int.tryParse(newValue.text)!.clamp(0, maxValue).toString();
              return newValue.copyWith(
                text: newValueNumString,
                selection:
                    TextSelection.collapsed(offset: newValueNumString.length),
              );
            } else {
              print('JQN 3');
              return newValue;
            }
          },
        )
      ],
      onChanged: (text) {
        widget.onValueApplied?.call(int.tryParse(text) ?? 0);
      },
      onFieldSubmitted: (text) {
        widget.onValueApplied?.call(int.tryParse(text) ?? 0);
      },
      decoration: InputDecoration(
        suffixText: widget.suffixText,
        hintText: '0',
      ),
      keyboardType:
          const TextInputType.numberWithOptions(signed: true, decimal: true),
    );
  }
}

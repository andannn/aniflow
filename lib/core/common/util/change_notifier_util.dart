
import 'package:flutter/cupertino.dart';

extension IntValueNotifierEx on ValueNotifier<int> {
  void notifyChanged() {
    value = value + 1;
  }
}
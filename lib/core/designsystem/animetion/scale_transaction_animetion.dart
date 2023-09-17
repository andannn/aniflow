import 'package:flutter/material.dart';

Widget buildSizeTransition(Widget child, Animation<double> animation) {
  return SizeTransition(sizeFactor: animation, child: child);
}


import 'package:flutter/cupertino.dart';

mixin ScreenSizeUtil {
  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 600;
  }
}
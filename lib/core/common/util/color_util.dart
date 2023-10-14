import 'dart:ui';

mixin ColorUtil {
  /// parse color with format #001100.
  static Color? parseColor(String source) {
    final colorRegex = RegExp('#\\w{6}');
    if (!colorRegex.hasMatch(source)) {
      return null;
    }

    final r = int.parse(source.substring(1, 3), radix: 16);
    final g = int.parse(source.substring(3, 5), radix: 16);
    final b = int.parse(source.substring(5, 7), radix: 16);
    return Color.fromARGB(255, r, g, b);
  }
}
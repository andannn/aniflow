import 'package:aniflow/core/common/setting/setting.dart';

enum InAppPlayer implements BooleanSetting {
  on,
  off;

  @override
  bool get isOn => this == on;

  @override
  InAppPlayer toggle() => this == on ? off : on;

  static InAppPlayer getSetting(bool isOn) => isOn ? on : off;
}
import 'package:aniflow/core/common/model/setting/setting.dart';

enum DisplayAdultContent implements BooleanSetting {
  on,
  off;

  @override
  bool get isOn => this == on;

  @override
  DisplayAdultContent toggle() => this == on ? off : on;


  static DisplayAdultContent getSetting(bool isOn) => isOn ? on : off;
}
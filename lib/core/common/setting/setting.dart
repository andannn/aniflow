interface class Setting {}

abstract class BooleanSetting extends Setting {
  bool get isOn;

  BooleanSetting toggle();
}
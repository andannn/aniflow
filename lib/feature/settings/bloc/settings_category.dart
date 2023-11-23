import 'package:aniflow/core/common/model/setting/setting.dart';

class SettingCategory {
  SettingCategory({
    required this.title,
    required this.settingItems,
    this.subTitle,
  });

  final String title;
  final String? subTitle;
  final List<SettingItem> settingItems;
}

sealed class SettingItem<T extends Setting> {
  final String title;
  final String? subTitle;
  final Type type = T;

  SettingItem({
    required this.title,
    this.subTitle,
  });
}

class SingleLineWithTapActionSettingItem<T extends Setting>
    extends SettingItem<T> {
  SingleLineWithTapActionSettingItem({
    required super.title,
    super.subTitle,
  });
}

class SwitchSettingItem<T extends BooleanSetting> extends SettingItem {
  final T current;

  SwitchSettingItem({
    required this.current,
    required super.title,
    super.subTitle,
  });
}

class ListSettingItem<T extends Setting> extends SettingItem {
  final SettingOption<T> selectedOption;
  final List<SettingOption<T>> options;

  ListSettingItem({
    required super.title,
    required this.selectedOption,
    required this.options,
    super.subTitle,
  });
}

class SettingOption<T> {
  SettingOption({required this.setting, required this.description});

  final T setting;
  final String description;
}

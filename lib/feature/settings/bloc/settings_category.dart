import 'package:aniflow/core/common/setting/setting.dart';
import 'package:flutter/cupertino.dart';

typedef StringBuilder = String Function(BuildContext);

class SettingCategory {
  SettingCategory({
    required this.titleBuilder,
    required this.settingItems,
    this.subTitleBuilder,
  });

  final StringBuilder titleBuilder;
  final StringBuilder? subTitleBuilder;
  final List<SettingItem> settingItems;
}

sealed class SettingItem<T extends Setting> {
  final StringBuilder titleBuilder;
  final String? subTitle;
  final Type type = T;

  SettingItem({
    required this.titleBuilder,
    this.subTitle,
  });
}

class SingleLineWithTapActionSettingItem<T extends Setting>
    extends SettingItem<T> {
  SingleLineWithTapActionSettingItem({
    required super.titleBuilder,
    super.subTitle,
  });
}

class SwitchSettingItem<T extends BooleanSetting> extends SettingItem {
  final T current;

  SwitchSettingItem({
    required this.current,
    required super.titleBuilder,
    super.subTitle,
  });
}

class ListSettingItem<T extends Setting> extends SettingItem {
  final SettingOption<T> selectedOption;
  final List<SettingOption<T>> options;

  ListSettingItem({
    required super.titleBuilder,
    required this.selectedOption,
    required this.options,
    super.subTitle,
  });
}

class CheckForUpdateSettingItem extends SettingItem {
  CheckForUpdateSettingItem({
    required super.titleBuilder,
    super.subTitle,
  });
}

class SettingOption<T> {
  SettingOption({
    required this.setting,
    required this.descriptionBuilder,
  });

  final T setting;
  final StringBuilder descriptionBuilder;
}

import 'package:aniflow/core/common/model/setting/setting.dart';
import 'package:aniflow/feature/settings/bloc/settings_category.dart';
import 'package:flutter/material.dart';

Future<T?> showSettingsDialog<T extends Setting>(BuildContext context,
        ListSettingItem<T> settingItem, T selectedOption) =>
    showDialog(
      context: context,
      builder: (BuildContext context) => SettingsDialog(
        settingItem: settingItem,
        selectedOption: selectedOption,
      ),
    );

class SettingsDialog<T> extends StatelessWidget {
  const SettingsDialog({
    required this.settingItem,
    required this.selectedOption,
    super.key,
  });

  final ListSettingItem settingItem;
  final T selectedOption;

  @override
  Widget build(BuildContext context) {
    final title = settingItem.title;
    final options = settingItem.options;
    final textTheme = Theme.of(context).textTheme;
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0),
            child: Text(
              title,
              style: textTheme.titleLarge,
            ),
          ),
          const SizedBox(height: 12.0),
          ...options
              .map((options) => _createOptionTile(
                    context,
                    options,
                    selectedOption: selectedOption,
                    onOptionClick: (setting) {
                      Navigator.of(context).pop(setting);
                    },
                  ))
              .toList()
        ],
      ),
    );
  }

  Widget _createOptionTile(BuildContext context, SettingOption option,
      {required T selectedOption, required Function(T) onOptionClick}) {
    final colorScheme = Theme.of(context).colorScheme;
    return ListTile(
      title: Text(option.description),
      horizontalTitleGap: 2.0,
      minLeadingWidth: 10,
      shape: const StadiumBorder(),
      textColor: colorScheme.onSurfaceVariant,
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      leading: Radio<T>(
        value: option.setting,
        groupValue: selectedOption,
        onChanged: (T? value) {},
      ),
      onTap: () {
        onOptionClick.call(option.setting);
      },
    );
  }
}

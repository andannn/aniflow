import 'package:aniflow/core/common/setting/setting.dart';
import 'package:aniflow/feature/settings/settings_category.dart';
import 'package:flutter/material.dart';

Future<T?> showSettingsDialog<T extends Setting>({
  required BuildContext context,
  required T selectedOption,
  required String title,
  required List<SettingOption<T>> options,
}) =>
    showDialog(
      context: context,
      builder: (BuildContext context) => SettingsDialog(
        selectedOption: selectedOption,
        options: options,
        title: title,
      ),
    );

class SettingsDialog<T> extends StatelessWidget {
  const SettingsDialog({
    super.key,
    required this.selectedOption,
    required this.title,
    required this.options,
  });

  final T selectedOption;
  final String title;
  final List<SettingOption<T>> options;

  @override
  Widget build(BuildContext context) {
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
          ...options.map((options) => _createOptionTile(
                context,
                options,
                selectedOption: selectedOption,
                onOptionClick: (setting) {
                  Navigator.of(context).pop(setting);
                },
              ))
        ],
      ),
    );
  }

  Widget _createOptionTile(BuildContext context, SettingOption option,
      {required T selectedOption, required Function(T) onOptionClick}) {
    final colorScheme = Theme.of(context).colorScheme;
    return ListTile(
      title: Text(
        option.descriptionBuilder(context),
      ),
      horizontalTitleGap: 2.0,
      minLeadingWidth: 10,
      shape: const StadiumBorder(),
      textColor: colorScheme.onSurfaceVariant,
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      leading: Radio<T>(
        value: option.setting,
        groupValue: selectedOption,
        onChanged: (value) {
          onOptionClick.call(option.setting);
        },
      ),
      onTap: () {
        onOptionClick.call(option.setting);
      },
    );
  }
}

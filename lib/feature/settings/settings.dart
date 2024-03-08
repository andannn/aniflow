import 'dart:async';

import 'package:aniflow/app/app.dart';
import 'package:aniflow/core/common/model/setting/about.dart';
import 'package:aniflow/core/common/model/setting/setting.dart';
import 'package:aniflow/core/data/auth_repository.dart';
import 'package:aniflow/core/data/settings_repository.dart';
import 'package:aniflow/core/design_system/animation/page_transaction_animation.dart';
import 'package:aniflow/core/design_system/dialog/restart_app_dialog.dart';
import 'package:aniflow/core/shared_preference/aniflow_preferences.dart';
import 'package:aniflow/feature/settings/bloc/settings_bloc.dart';
import 'package:aniflow/feature/settings/bloc/settings_category.dart';
import 'package:aniflow/feature/settings/bloc/settings_state.dart';
import 'package:aniflow/feature/settings/list_settings_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPageRoute extends PageRoute with MaterialRouteTransitionMixin {
  SettingsPageRoute({super.settings}) : super(allowSnapshotting: false);

  @override
  Widget buildContent(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SettingsBloc(
        settingsRepository: context.read<SettingsRepository>(),
        authRepository: context.read<AuthRepository>(),
      ),
      child: const _MediaSettingsPageContent(),
    );
  }

  @override
  bool get maintainState => true;

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return getFistPageTransaction(
      animation: animation,
      child: getSecondaryPageTransaction(
        animation: secondaryAnimation,
        child: child,
      ),
    );
  }
}

class _MediaSettingsPageContent extends StatefulWidget {
  const _MediaSettingsPageContent();

  @override
  State<_MediaSettingsPageContent> createState() =>
      _MediaSettingsPageContentState();
}

class _MediaSettingsPageContentState extends State<_MediaSettingsPageContent> {
  late StreamSubscription themeSub;

  @override
  void initState() {
    super.initState();
    themeSub =
        AniFlowPreferences().getThemeSettingStream().listen((setting) async {
      await Future.delayed(const Duration(milliseconds: 100));
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    themeSub.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        final categories = state.categories;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Settings"),
          ),
          body: ListView.builder(
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) {
              return _createSettingCategory(context, categories[index]);
            },
          ),
        );
      },
    );
  }

  Widget _createSettingCategory(
      BuildContext context, SettingCategory category) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final settingItems = category.settingItems;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              category.title,
              style: textTheme.bodyLarge!.copyWith(color: colorScheme.primary),
            ),
          ),
          const SizedBox(height: 20),
          ListView.builder(
            itemCount: settingItems.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return _createSettingItem(
                context,
                settingItems[index],
                onSettingChanged: (setting) async {
                  context
                      .read<SettingsBloc>()
                      .add(OnListOptionChanged(setting));

                  final needShowDialog = setting.needRestart;
                  if (needShowDialog) {
                    await Future.delayed(const Duration(milliseconds: 500));
                    // ignore: use_build_context_synchronously
                    final isAccepted = await showRestartAppDialog(context);
                    if (isAccepted == true) {
                      // ignore: use_build_context_synchronously
                      AniFlowApp.restartApp(context);
                    }
                  }
                },
                onSettingTap: (type) {
                  if (type == About) {
                    showAboutDialog(
                        context: context, applicationName: 'AniFlow');
                  }
                },
              );
            },
          )
        ],
      ),
    );
  }

  Widget _createSettingItem<T extends Setting>(
    BuildContext context,
    final SettingItem<T> settingItem, {
    required Function(Setting) onSettingChanged,
    required Function(Type) onSettingTap,
  }) {
    final textTheme = Theme.of(context).textTheme;
    switch (settingItem) {
      case SwitchSettingItem(current: var setting):
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
          child: Row(
            children: [
              Text(
                settingItem.title,
                style: textTheme.headlineSmall,
              ),
              const Expanded(child: SizedBox()),
              Switch(
                value: setting.isOn,
                onChanged: (isOn) {
                  onSettingChanged(setting.toggle());
                },
              ),
            ],
          ),
        );
      case ListSettingItem<T>(
          selectedOption: var selectedOption,
          title: var title,
          options: var options
        ):
        return InkWell(
          onTap: () async {
            final result = await showSettingsDialog<T>(
              context: context,
              title: title,
              selectedOption: selectedOption.setting,
              options: options,
            );
            if (result != null && result != selectedOption.setting) {
              onSettingChanged(result);
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  settingItem.title,
                  style: textTheme.titleLarge,
                ),
                const SizedBox(height: 2),
                Text(
                  selectedOption.description,
                  style: textTheme.bodySmall,
                ),
              ],
            ),
          ),
        );
      case SingleLineWithTapActionSettingItem():
        return InkWell(
          onTap: () {
            onSettingTap.call(settingItem.type);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
            child: Row(
              children: [
                Text(
                  settingItem.title,
                  style: textTheme.headlineSmall,
                ),
              ],
            ),
          ),
        );
      default:
        throw Exception('Invalid Type');
    }
  }
}

import 'dart:async';

import 'package:aniflow/app/di/get_it_scope.dart';
import 'package:aniflow/core/common/dialog/dialog_handler.dart';
import 'package:aniflow/core/common/message/snack_bar_message_mixin.dart';
import 'package:aniflow/core/common/setting/setting.dart';
import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/core/design_system/animation/page_transaction_animation.dart';
import 'package:aniflow/core/design_system/dialog/restart_app_dialog.dart';
import 'package:aniflow/feature/settings/check_for_update/check_for_update.dart';
import 'package:aniflow/feature/settings/github_link/github_link.dart';
import 'package:aniflow/feature/settings/list_settings_dialog.dart';
import 'package:aniflow/feature/settings/settings_bloc.dart';
import 'package:aniflow/feature/settings/settings_category.dart';
import 'package:aniflow/feature/settings/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends Page {
  const SettingsPage({super.key});

  @override
  Route createRoute(BuildContext context) {
    return SettingsPageRoute(settings: this);
  }
}

class SettingsPageRoute extends PageRoute with MaterialRouteTransitionMixin {
  SettingsPageRoute({super.settings}) : super(allowSnapshotting: false);

  @override
  Widget buildContent(BuildContext context) {
    return DialogEventHandler(
      child: BlocProvider(
        create: (BuildContext context) => GetItScope.of(context).get<SettingsBloc>(),
        child: const ScaffoldMessenger(
          child: _MediaSettingsPageContent(),
        ),
      ),
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

class _MediaSettingsPageContentState extends State<_MediaSettingsPageContent>
    with ShowSnackBarMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        final categories =
            context.read<SettingsBloc>().buildSettingCategoryList();

        return Scaffold(
          appBar: AppBar(
            title: Text(context.appLocal.settings),
          ),
          body: ListView.builder(
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) {
              return SettingCategoryWidget(category: categories[index]);
            },
          ),
        );
      },
    );
  }
}

class SettingCategoryWidget extends StatelessWidget {
  const SettingCategoryWidget({
    super.key,
    required this.category,
  });

  final SettingCategory category;

  @override
  Widget build(BuildContext context) {
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
              category.titleBuilder(context),
              style: textTheme.bodyLarge!.copyWith(color: colorScheme.primary),
            ),
          ),
          const SizedBox(height: 20),
          ListView.builder(
            itemCount: settingItems.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return SettingItemWidget(
                settingItem: settingItems[index],
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
                      // AniFlowApp.restartApp(context);
                    }
                  }
                },
                onSingleTapSettingClick: (type) async {
                  context
                      .read<SettingsBloc>()
                      .add(OnSingleLineSettingsClick(type));
                },
              );
            },
          )
        ],
      ),
    );
  }
}

class SettingItemWidget<T extends Setting> extends StatelessWidget {
  const SettingItemWidget({
    super.key,
    required this.settingItem,
    required this.onSettingChanged,
    required this.onSingleTapSettingClick,
  });

  final SettingItem<T> settingItem;
  final Function(Setting) onSettingChanged;
  final Function(Type) onSingleTapSettingClick;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    switch (settingItem) {
      case SwitchSettingItem(current: var setting):
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
          child: Row(
            children: [
              Text(
                settingItem.titleBuilder!(context),
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
          titleBuilder: var titleBuilder,
          options: var options
        ):
        return InkWell(
          onTap: () async {
            final result = await showSettingsDialog<T>(
              context: context,
              title: titleBuilder!(context),
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
                  settingItem.titleBuilder!(context),
                  style: textTheme.titleLarge,
                ),
                const SizedBox(height: 2),
                Text(
                  selectedOption.descriptionBuilder(context),
                  style: textTheme.bodySmall,
                ),
              ],
            ),
          ),
        );
      case SingleLineWithTapActionSettingItem():
        return InkWell(
          onTap: () {
            onSingleTapSettingClick.call(settingItem.type);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
            child: Row(
              children: [
                Text(
                  settingItem.titleBuilder!(context),
                  style: textTheme.headlineSmall,
                ),
              ],
            ),
          ),
        );
      case GithubLinkSettingItem():
        return const GithubLink();
      case CheckForUpdateSettingItem():
        return const CheckForUpdate();
      default:
        throw Exception('Invalid Type');
    }
  }
}

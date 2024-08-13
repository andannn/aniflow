import 'package:aniflow/app/di/get_it_scope.dart';
import 'package:aniflow/app/routing/root_router_delegate.dart';
import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/core/data/model/user_model.dart';
import 'package:aniflow/core/design_system/widget/avatar_icon.dart';
import 'package:aniflow/feature/auth/bloc/auth_bloc.dart';
import 'package:aniflow/feature/auth/bloc/auth_ui_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum _OptionColumn {
  settings,
  notification,
  // editProfile,
}

List<_OptionColumn> _createList(bool isLogin) => isLogin
    ? [
        _OptionColumn.settings,
        _OptionColumn.notification,
      ]
    : [
        _OptionColumn.settings,
      ];

Future showAuthDialog(BuildContext context) => showDialog(
      context: context,
      builder: (BuildContext context) => const AuthDialog(),
    );

class AuthDialog extends StatelessWidget {
  const AuthDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetItScope.of(context).get<AuthBloc>(),
      child: const AlertDialog(
        content: _AuthDialogContent(),
      ),
    );
  }
}

class _AuthDialogContent extends StatelessWidget {
  const _AuthDialogContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        final userData = state.userData;
        final isLoggedIn = state.isLoggedIn;
        return Wrap(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildUserInfoWidget(context, userData, isLoggedIn),
                const SizedBox(height: 4),
                for (final option in _createList(isLoggedIn))
                  _buildOptionColumnItem(context, option, userData),
                Align(
                  alignment: Alignment.centerRight,
                  child: _buildLoginControlBar(context, isLoggedIn),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  Widget _buildUserInfoWidget(
      BuildContext context, UserModel? userData, bool isLoggedIn) {
    final avatarUrl = userData?.avatar;
    // final bannerUrl = userData?.bannerImage;
    final userName = userData?.name;

    if (isLoggedIn) {
      return Column(
        children: [
          Row(
            children: [
              buildAvatarIcon(context, avatarUrl!),
              const SizedBox(width: 8),
              Text(
                userName!,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant),
              )
            ],
          ),
          const Divider(height: 12),
        ],
      );
    } else {
      return const SizedBox();
    }
  }

  Widget _buildLoginControlBar(BuildContext context, bool isLoggedIn) {
    if (isLoggedIn) {
      return OutlinedButton(
          onPressed: () {
            Navigator.pop(context);
            context.read<AuthBloc>().add(OnLogoutButtonTapped());
          },
          child: Text(context.appLocal.logout));
    } else {
      return OutlinedButton(
          onPressed: () {
            context.read<AuthBloc>().add(OnLoginButtonTapped());
          },
          child: Text(context.appLocal.login));
    }
  }

  Widget _buildOptionColumnItem(
      BuildContext context, _OptionColumn option, UserModel? userData) {
    final IconData iconData;
    final String label;
    switch (option) {
      case _OptionColumn.settings:
        iconData = Icons.settings_outlined;
        label = context.appLocal.settings;
      case _OptionColumn.notification:
        iconData = Icons.notifications_none;
        label = context.appLocal.notification;
      // case _OptionColumn.editProfile:
      //   iconData = Icons.edit;
      //   label = 'Edit profile';
    }
    final color = Theme.of(context).colorScheme.onSurfaceVariant;
    return InkWell(
      onTap: () => _onOptionTap(context, option, userData),
      customBorder: const StadiumBorder(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: Icon(iconData, color: color),
            ),
            const SizedBox(width: 20),
            Text(
              label,
              style:
                  Theme.of(context).textTheme.bodyLarge!.copyWith(color: color),
            ),
          ],
        ),
      ),
    );
  }

  void _onOptionTap(
      BuildContext context, _OptionColumn option, UserModel? userData) {
    switch (option) {
      case _OptionColumn.settings:
        Navigator.pop(context);
        RootRouterDelegate.get().navigateToSettingsPage();
      case _OptionColumn.notification:
        Navigator.pop(context);
        RootRouterDelegate.get().navigateToNotification();
      // case _OptionColumn.editProfile:
      //   Navigator.pop(context);
      //   Navigator.of(context, rootNavigator: true).push(EditProfileRoute());
    }
  }
}

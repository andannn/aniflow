import 'package:anime_tracker/app/local/ani_flow_localizations.dart';
import 'package:anime_tracker/core/data/model/user_data_model.dart';
import 'package:anime_tracker/core/data/repository/auth_repository.dart';
import 'package:anime_tracker/core/design_system/widget/avatar_icon.dart';
import 'package:anime_tracker/feature/auth/bloc/auth_bloc.dart';
import 'package:anime_tracker/feature/auth/bloc/auth_ui_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future showAuthDialog(BuildContext context) => showDialog(
      context: context,
      builder: (BuildContext context) => const AuthDialog(),
    );

class AuthDialog extends StatelessWidget {
  const AuthDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AuthBloc(authRepository: context.read<AuthRepository>()),
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
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            children: [
              Column(
                children: [
                  _buildUserInfoWidget(context, userData, isLoggedIn),
                  const Divider(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: _buildLoginControlBar(context, isLoggedIn),
                  ),
                ],
              )
            ],
          ),
        );
      },
      bloc: AuthBloc(authRepository: context.read<AuthRepository>()),
    );
  }

  Widget _buildUserInfoWidget(
      BuildContext context, UserData? userData, bool isLoggedIn) {
    final avatarUrl = userData?.avatar;
    // final bannerUrl = userData?.bannerImage;
    final userName = userData?.name;

    if (isLoggedIn) {
      return Row(
        children: [
          buildAvatarIcon(context, avatarUrl!),
          const SizedBox(width: 8),
          Text(
            userName!,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant),
          )
        ],
      );
    } else {
      return const SizedBox();
    }
  }

  Widget _buildLoginControlBar(BuildContext context, bool isLoggedIn) {
    if (isLoggedIn) {
      return TextButton(
          onPressed: () {
            context.read<AuthBloc>().add(OnLogoutButtonTapped());
          },
          child: Text(AFLocalizations.of(context).logout));
    } else {
      return TextButton(
          onPressed: () {
            context.read<AuthBloc>().add(OnLoginButtonTapped());
          },
          child: Text(AFLocalizations.of(context).login));
    }
  }
}

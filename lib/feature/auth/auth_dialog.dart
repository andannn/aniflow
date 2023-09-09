import 'package:anime_tracker/core/data/repository/auth_repository.dart';
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
      child: const _AuthDialogContent(),
    );
  }
}

class _AuthDialogContent extends StatelessWidget {
  const _AuthDialogContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) => AlertDialog(
        content: Wrap(
          direction: Axis.vertical,
          children: [
            TextButton(
                onPressed: () =>
                    context.read<AuthBloc>().add(OnLoginButtonTapped()),
                child: Text('Login')),
            Divider(),
          ],
        ),
      ),
      bloc: AuthBloc(authRepository: context.read<AuthRepository>()),
    );
  }
}

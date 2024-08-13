import 'package:aniflow/app/di/get_it_scope.dart';
import 'package:aniflow/core/design_system/widget/avatar_icon.dart';
import 'package:aniflow/core/design_system/widget/vertical_animated_scale_switcher.dart';
import 'package:aniflow/feature/settings/github_link/github_link_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class GithubLink extends StatelessWidget {
  const GithubLink({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetItScope.of(context).get<GithubLinkBloc>(),
      child: const GithubLinkContent(),
    );
  }
}

class GithubLinkContent extends StatelessWidget {
  const GithubLinkContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GithubLinkBloc, GithubLinkState>(
        builder: (context, state) {
      return AnimatedScaleSwitcher(
        visible: state is ReadyGithubLinkState,
        builder: () {
          final user = (state as ReadyGithubLinkState).user;
          return InkWell(
            onTap: () {
              launchUrl(Uri.parse('https://github.com/andannn/aniflow'));
            },
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
              child: Row(
                children: [
                  buildAvatarIcon(context, user.avatarUrl!),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.login ?? '',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        user.bio ?? '',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}

import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/feature/settings/check_for_update/check_for_update_bloc.dart';
import 'package:aniflow/feature/settings/check_for_update/check_for_update_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CheckForUpdate extends StatelessWidget {
  const CheckForUpdate({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance.get<CheckForUpdateBloc>(),
      child: const CheckForUpdateContent(),
    );
  }
}

class CheckForUpdateContent extends StatelessWidget {
  const CheckForUpdateContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckForUpdateBloc, CheckForUpdateState>(
        builder: (context, state) {
      final textTheme = Theme.of(context).textTheme;
      return InkWell(
        onTap: () {
          context.read<CheckForUpdateBloc>().add(OnClickItem());
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.appLocal.checkForUpdate,
                style: textTheme.headlineSmall,
              ),
              if (state.currentVersion != null) ...[
                const SizedBox(height: 2),
                Text(
                  _buildSubText(context, state),
                  style: textTheme.bodySmall,
                ),
              ]
            ],
          ),
        ),
      );
    });
  }

  String _buildSubText(BuildContext context, CheckForUpdateState state) {
    final currentVersion = state.currentVersion!;
    final latestVersion = state.latestVersion;
    if (latestVersion == null) {
      return '${context.appLocal.currentVersion}: $currentVersion';
    }
    if (currentVersion == latestVersion) {
      return '${context.appLocal.appUpToDate}: $currentVersion';
    }

    return context.appLocal.clickToUpdate(latestVersion.toString());
  }
}

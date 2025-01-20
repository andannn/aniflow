import 'package:aniflow/app/di/get_it_scope.dart';
import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/feature/settings/check_for_update/check_for_update_bloc.dart';
import 'package:aniflow/feature/settings/check_for_update/check_for_update_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckForUpdate extends StatelessWidget {
  const CheckForUpdate({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetItScope.of(context).get<CheckForUpdateBloc>(),
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
            ],
          ),
        ),
      );
    });
  }
}

import 'package:aniflow/core/data/activity_repository.dart';
import 'package:aniflow/core/design_system/widget/activity_item_widget.dart';
import 'package:aniflow/feature/social/activity/activity.dart';
import 'package:aniflow/feature/social/activity_replies/bloc/activity_replies_bloc.dart';
import 'package:aniflow/feature/social/activity_replies/bloc/activity_replies_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivityRepliesPage extends Page {
  const ActivityRepliesPage({
    required this.activityId,
    super.key,
    this.showBackKey = false,
  });

  final String activityId;
  final bool showBackKey;

  @override
  Route createRoute(BuildContext context) {
    return ActivityRepliesRoute(
        settings: this, activityId: activityId, showBackKey: showBackKey);
  }
}

class ActivityRepliesRoute extends PageRoute with MaterialRouteTransitionMixin {
  ActivityRepliesRoute(
      {required this.activityId, required this.showBackKey, super.settings})
      : super(allowSnapshotting: false);

  final String activityId;
  final bool showBackKey;

  @override
  Widget buildContent(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => ActivityRepliesBloc(
              activityId: activityId,
              repository: context.read<ActivityRepository>(),
            ),
        child: const _ActivityRepliesPageContent());
  }

  @override
  bool get maintainState => true;
}

class _ActivityRepliesPageContent extends StatelessWidget {
  const _ActivityRepliesPageContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActivityRepliesBloc, ActivityRepliesState>(
      builder: (BuildContext context, ActivityRepliesState state) {
        final isLoading = state.isLoading;
        final replies = state.replies;
        final activityModel = state.activityModel;

        if (activityModel == null) {
          return const SizedBox();
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text("Post"),
            automaticallyImplyLeading: true,
          ),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8),
                  child: ActivityItem(
                    model: activityModel,
                    onBuildActivityStatusWidget: (activityId) =>
                        ActivityStatusBlocProvider(
                      key: ValueKey('activity_status_$activityId'),
                      activityId: activityId,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

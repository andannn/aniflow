import 'package:aniflow/core/common/util/logger.dart';
import 'package:aniflow/core/common/util/time_util.dart';
import 'package:aniflow/core/data/model/activity_reply_model.dart';
import 'package:aniflow/core/data/user_data_repository.dart';
import 'package:aniflow/core/design_system/widget/activity_item_widget.dart';
import 'package:aniflow/core/design_system/widget/af_html_widget.dart';
import 'package:aniflow/core/design_system/widget/avatar_icon.dart';
import 'package:aniflow/core/design_system/widget/loading_indicator.dart';
import 'package:aniflow/feature/activity_replies/bloc/activity_replies_bloc.dart';
import 'package:aniflow/feature/activity_replies/bloc/activity_replies_state.dart';
import 'package:aniflow/feature/social/activity/activity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

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
        create: (BuildContext context) =>
            GetIt.instance.get<ActivityRepliesBloc>(
              param1: activityId,
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
                    userTitleLanguage: GetIt.instance
                        .get<UserDataRepository>()
                        .userTitleLanguage,
                    onBuildActivityStatusWidget: (activityId) =>
                        ActivityStatusBlocProvider(
                      key: ValueKey('activity_status_$activityId'),
                      activityId: activityId,
                    ),
                  ),
                ),
              ),
              ..._buildReplySliverWidget(
                  isLoading: isLoading, replies: replies),
              const SliverPadding(padding: EdgeInsets.only(top: 32))
            ],
          ),
        );
      },
    );
  }

  List<Widget> _buildReplySliverWidget(
      {required bool isLoading, required List<ActivityReplyModel> replies}) {
    logger.d("isloading : $isLoading");
    if (isLoading) {
      return [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: LoadingIndicator(isLoading: isLoading),
          ),
        )
      ];
    } else if (replies.isEmpty) {
      return [
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text("No reply."),
            ),
          ),
        )
      ];
    } else {
      return [
        SliverList.builder(
          itemCount: replies.length,
          itemBuilder: (context, index) {
            final model = replies[index];
            return _buildReplyItem(
              context: context,
              model: model,
            );
          },
        )
      ];
    }
  }

  Widget _buildReplyItem(
      {required BuildContext context, required ActivityReplyModel model}) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final timeUntilNowDuration = DateTime.now().difference(
        DateTime.fromMillisecondsSinceEpoch(model.createdAt! * 1000));
    final timeUntilNowString =
        TimeUtil.getFormattedDuration(context, timeUntilNowDuration) ?? '';
    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        // onUserIconClick?.call(activity.user.id);
                      },
                      child: model.user?.avatar != null
                          ? buildAvatarIcon(context, model.user!.avatar)
                          : const SizedBox(),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      model.user?.name ?? "",
                      style: textTheme.labelLarge!.copyWith(
                        color: colorScheme.primary,
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    Opacity(
                      opacity: 0.7,
                      child: Text(
                        timeUntilNowString,
                        style: textTheme.labelSmall!,
                      ),
                    ),
                    const SizedBox(width: 16)
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AfHtmlWidget(
                html: model.text,
                textStyle: textTheme.bodyMedium!
                    .copyWith(color: colorScheme.onSurfaceVariant),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

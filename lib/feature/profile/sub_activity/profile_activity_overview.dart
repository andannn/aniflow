// ignore_for_file: lines_longer_than_80_chars

import 'package:aniflow/app/routing/root_router_delegate.dart';
import 'package:aniflow/core/data/model/activity_model.dart';
import 'package:aniflow/core/design_system/widget/activity_item_widget.dart';
import 'package:aniflow/core/paging/page_loading_state.dart';
import 'package:aniflow/core/paging/paging_content_widget.dart';
import 'package:aniflow/feature/profile/sub_activity/user_activity_paging_bloc.dart';
import 'package:aniflow/feature/social/activity/activity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileActivityPage extends StatefulWidget {
  const ProfileActivityPage({super.key});

  @override
  State<ProfileActivityPage> createState() => _ProfileActivityPageState();
}

class _ProfileActivityPageState extends State<ProfileActivityPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserActivityPagingBloc,
        PagingState<List<ActivityModel>>>(builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: CustomScrollView(
          key: const PageStorageKey<String>('profile_activity'),
          slivers: [
            SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            ),
            ...buildSliverItemsSection<ActivityModel, UserActivityPagingBloc>(
              context: context,
              pagingState: state,
              onBuildItem: _buildActivityItem,
            ),
            const SliverPadding(padding: EdgeInsets.only(top: 20)),
          ],
        ),
      );
    });
  }

  Widget _buildActivityItem(BuildContext context, ActivityModel model) {
    return ActivityItem(
      model: model,
      userTitleLanguage:
          context.read<UserActivityPagingBloc>().userTitleLanguage,
      onMediaClick: (id) {
        RootRouterDelegate.get().navigateToDetailMedia(id);
      },
      onUserIconClick: (id) {
        RootRouterDelegate.get().navigateToUserProfile(id);
      },
      onActivityClick: (id) {
        RootRouterDelegate.get().navigateToActivityRepliesPage(id);
      },
      onBuildActivityStatusWidget: (activityId) => ActivityStatusBlocProvider(
        key: ValueKey('activity_status_$activityId'),
        activityId: activityId,
      ),
    );
  }
}

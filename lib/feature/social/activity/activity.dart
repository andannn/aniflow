import 'package:aniflow/app/aniflow_router/ani_flow_router_delegate.dart';
import 'package:aniflow/app/local/util/string_resource_util.dart';
import 'package:aniflow/core/common/definitions/activity_filter_type.dart';
import 'package:aniflow/core/common/definitions/activity_scope_category.dart';
import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/data/model/activity_model.dart';
import 'package:aniflow/core/design_system/widget/activity_item_widget.dart';
import 'package:aniflow/core/design_system/widget/popup_menu_anchor.dart';
import 'package:aniflow/core/design_system/widget/short_num_label_icon_button.dart';
import 'package:aniflow/core/paging/page_loading_state.dart';
import 'package:aniflow/core/paging/paging_content_widget.dart';
import 'package:aniflow/feature/social/activity/bloc/activity_bloc.dart';
import 'package:aniflow/feature/social/activity/bloc/activity_item_bloc.dart';
import 'package:aniflow/feature/social/activity/bloc/activity_paging_bloc.dart';
import 'package:aniflow/feature/social/activity/bloc/activity_state.dart';
import 'package:aniflow/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => getIt.get<ActivityBloc>(),
      child: const _ActivityPageContent(),
    );
  }
}

class _ActivityPageContent extends StatelessWidget {
  const _ActivityPageContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActivityBloc, ActivityState>(
      builder: (context, state) {
        final filterType = state.filterType;
        final scopeCategory = state.scopeCategory;
        final isLoading = state.isLoading;

        if (filterType == null || scopeCategory == null) {
          return const SizedBox();
        }

        return Scaffold(
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  title: const Text('Activity'),
                  pinned: true,
                  snap: true,
                  floating: true,
                  actions: [
                    PopupMenuAnchor(
                      menuItems: ActivityFilterType.values,
                      builder: (context, controller, child) {
                        return TextButton.icon(
                          onPressed: () {
                            if (controller.isOpen) {
                              controller.close();
                            } else {
                              controller.open();
                            }
                          },
                          icon: const Icon(Icons.filter_alt),
                          label: Text(
                            filterType.label(context),
                          ),
                        );
                      },
                      menuItemBuilder: (context, item) {
                        return MenuItemButton(
                          child: Container(
                            constraints: const BoxConstraints(minWidth: 80),
                            child: Text(item.label(context)),
                          ),
                          onPressed: () {
                            context
                                .read<ActivityBloc>()
                                .add(OnFilterTypeChanged(type: item));
                          },
                        );
                      },
                    ),
                    const SizedBox(width: 16),
                  ],
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(50),
                    child: Column(
                      children: [
                        _buildScopeCategorySelection(context, scopeCategory),
                        AnimatedOpacity(
                          opacity: isLoading ? 1 : 0,
                          duration: AfConfig.defaultAnimationDuration,
                          child: const LinearProgressIndicator(),
                        )
                      ],
                    ),
                  ),
                  automaticallyImplyLeading: false,
                ),
              ];
            },
            body: Column(
              children: [
                Expanded(
                  child: ActivityPageBlocProvider(
                    key: ValueKey('${scopeCategory}_$filterType'),
                    userType: scopeCategory,
                    filterType: filterType,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildScopeCategorySelection(
      BuildContext context, ActivityScopeCategory userType) {
    return Row(
      children: [
        const SizedBox(width: 12),
        SegmentedButton<ActivityScopeCategory>(
          segments: const [
            ButtonSegment(
              value: ActivityScopeCategory.global,
              label: Text('Global'),
              icon: Icon(Icons.public),
            ),
            ButtonSegment(
              value: ActivityScopeCategory.following,
              label: Text('Following'),
              icon: Icon(Icons.person_2),
            ),
          ],
          selected: {userType},
          style: const ButtonStyle(visualDensity: VisualDensity(vertical: -2)),
          onSelectionChanged: (newSelection) {
            context
                .read<ActivityBloc>()
                .add(OnActivityScopeChanged(type: newSelection.first));
          },
        ),
      ],
    );
  }
}

class ActivityPageBlocProvider extends StatelessWidget {
  const ActivityPageBlocProvider(
      {required this.userType, required this.filterType, super.key});

  final ActivityScopeCategory userType;
  final ActivityFilterType filterType;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => getIt.get<ActivityPagingBloc>(
        param1: userType,
        param2: filterType,
      ),
      child: const ActivityPageContent(),
    );
  }
}

class ActivityPageContent extends StatelessWidget {
  const ActivityPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActivityPagingBloc, PagingState<List<ActivityModel>>>(
      builder: (context, state) {
        final isLoading = state is PageLoading || state is PageInit;
        context
            .read<ActivityBloc>()
            .add(OnLoadingStateChanged(isLoading: isLoading));

        return PagingContent<ActivityModel, ActivityPagingBloc>(
          onBuildItem: _buildActivityItem,
          pagingState: state,
        );
      },
    );
  }

  Widget _buildActivityItem(BuildContext context, ActivityModel model) {
    return ActivityItem(
      model: model,
      onMediaClick: (id) {
        AfRouterDelegate.of(context).backStack.navigateToDetailMedia(id);
      },
      onUserIconClick: (id) {
        AfRouterDelegate.of(context).backStack.navigateToUserProfile(id);
      },
      onActivityClick: (id) {
        AfRouterDelegate.of(context)
            .backStack
            .navigateToActivityRepliesPage(id);
      },
      onBuildActivityStatusWidget: (activityId) => ActivityStatusBlocProvider(
        key: ValueKey('activity_status_$activityId'),
        activityId: activityId,
      ),
    );
  }
}

class ActivityStatusBlocProvider extends StatelessWidget {
  const ActivityStatusBlocProvider({required this.activityId, super.key});

  final String activityId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          getIt.get<ActivityStatusBloc>(param1: activityId),
      child: const ActivityItemContent(),
    );
  }
}

class ActivityItemContent extends StatelessWidget {
  const ActivityItemContent({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ActivityStatusBloc>().state;
    if (state == null) {
      return const SizedBox();
    }

    final defaultColor =
        Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.8);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ShortNumLabelIconButton(
          icon: Icons.messenger_outline_rounded,
          count: state.replyCount,
          color: defaultColor,
          onClick: () {},
        ),
        ShortNumLabelIconButton(
          icon: state.isLiked ? Icons.favorite : Icons.favorite_outline,
          color: state.isLiked ? Colors.red : defaultColor,
          count: state.likeCount,
          onClick: () {
            context.read<ActivityStatusBloc>().add(OnToggleActivityLike());
          },
        ),
      ],
    );
  }
}

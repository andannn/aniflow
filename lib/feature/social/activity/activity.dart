import 'package:aniflow/app/local/util/string_resource_util.dart';
import 'package:aniflow/core/common/model/activity_filter_type.dart';
import 'package:aniflow/core/common/model/activity_scope_category.dart';
import 'package:aniflow/core/data/activity_repository.dart';
import 'package:aniflow/core/data/model/activity_model.dart';
import 'package:aniflow/core/design_system/widget/popup_menu_anchor.dart';
import 'package:aniflow/feature/common/page_loading_state.dart';
import 'package:aniflow/feature/common/paging_bloc.dart';
import 'package:aniflow/feature/common/paging_content_widget.dart';
import 'package:aniflow/feature/social/activity/bloc/activity_bloc.dart';
import 'package:aniflow/feature/social/activity/bloc/activity_paging_bloc.dart';
import 'package:aniflow/feature/social/activity/bloc/activity_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ActivityBloc(),
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
        final userType = state.userType;
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
                    child: _buildUserTypeSelection(context, userType),
                  ),
                  automaticallyImplyLeading: false,
                ),
              ];
            },
            body: Column(
              children: [
                Expanded(
                  child: ActivityPageBlocProvider(
                    key: ValueKey('${userType}_$filterType'),
                    userType: userType,
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

  Widget _buildUserTypeSelection(
      BuildContext context, ActivityScopeCategory userType) {
    return Row(
      children: [
        const SizedBox(width: 12),
        SegmentedButton<ActivityScopeCategory>(
          segments: const [
            ButtonSegment(
              value: ActivityScopeCategory.global,
              label: Text('Global'),
              icon: Icon(Icons.gamepad_rounded),
            ),
            ButtonSegment(
              value: ActivityScopeCategory.following,
              label: Text('Following'),
              icon: Icon(Icons.contacts_outlined),
            ),
          ],
          selected: {userType},
          style: const ButtonStyle(visualDensity: VisualDensity(vertical: -2)),
          onSelectionChanged: (newSelection) {
            context
                .read<ActivityBloc>()
                .add(OnUserTypeChanged(type: newSelection.first));
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
      create: (BuildContext context) => ActivityPagingBloc(
        userType: userType,
        filterType: filterType,
        repository: context.read<ActivityRepository>(),
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
        return PagingContent(
          onBuildItem: _buildActivityItem,
          pagingState: state,
          onRequestNewPage: () {
            context.read<ActivityPagingBloc>().add(OnRequestLoadPageEvent());
          },
          onRetryLoadPage: () {
            context.read<ActivityPagingBloc>().add(OnRetryLoadPageEvent());
          },
        );
      },
    );
  }

  Widget _buildActivityItem(BuildContext context, ActivityModel model) {
    return SizedBox(
      height: 30,
      child: Row(
        children: [
          Text(model.id),
          Text(model.runtimeType.toString()),
        ],
      ),
    );
  }
}

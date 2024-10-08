import 'package:aniflow/app/di/get_it_scope.dart';
import 'package:aniflow/app/routing/root_router_delegate.dart';
import 'package:aniflow/core/common/message/snack_bar_message_mixin.dart';
import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/core/data/model/notification_model.dart';
import 'package:aniflow/core/data/notification_repository.dart';
import 'package:aniflow/core/design_system/widget/notification_item_widget.dart';
import 'package:aniflow/core/design_system/widget/popup_menu_anchor.dart';
import 'package:aniflow/core/paging/page_loading_state.dart';
import 'package:aniflow/core/paging/paging_content_widget.dart';
import 'package:aniflow/feature/notification/bloc/notification_bloc.dart';
import 'package:aniflow/feature/notification/bloc/notification_paging_bloc.dart';
import 'package:aniflow/feature/notification/bloc/notification_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationPage extends Page {
  const NotificationPage({super.key, super.onPopInvoked});

  @override
  Route createRoute(BuildContext context) {
    return NotificationPageRoute(settings: this);
  }
}

class NotificationPageRoute extends PageRoute
    with MaterialRouteTransitionMixin {
  NotificationPageRoute({super.settings}) : super(allowSnapshotting: false);

  @override
  Widget buildContent(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          GetItScope.of(context).get<NotificationBloc>(),
      child: const ScaffoldMessenger(
        child: _NotificationPageContent(),
      ),
    );
  }

  @override
  bool get maintainState => true;
}

class _NotificationPageContent extends StatefulWidget {
  const _NotificationPageContent();

  @override
  State<_NotificationPageContent> createState() =>
      _NotificationPageContentState();
}

class _NotificationPageContentState extends State<_NotificationPageContent>
    with ShowSnackBarMixin {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationBloc, NotificationState>(
      builder: (BuildContext context, state) {
        final category = state.category;

        return Scaffold(
          appBar: AppBar(
            title: Text(context.appLocal.notification),
            actions: [
              PopupMenuAnchor(
                menuItems: NotificationCategory.values,
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
                      category.translated(context),
                    ),
                  );
                },
                menuItemBuilder: (context, item) {
                  return MenuItemButton(
                    child: Container(
                      constraints: const BoxConstraints(minWidth: 80),
                      child: Text(item.translated(context)),
                    ),
                    onPressed: () {
                      context
                          .read<NotificationBloc>()
                          .add(OnNotificationChanged(category: item));
                    },
                  );
                },
              ),
              const SizedBox(width: 12),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: _NotificationPagingBlocProvider(
                  key: ValueKey('${category}_paging'),
                  category: category,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _NotificationPagingBlocProvider extends StatelessWidget {
  const _NotificationPagingBlocProvider({required this.category, super.key});

  final NotificationCategory category;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => GetItScope.of(context)
            .get<NotificationPagingBloc>(param1: category),
        child: const _NotificationPagingContent());
  }
}

class _NotificationPagingContent extends StatelessWidget {
  const _NotificationPagingContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationPagingBloc,
        PagingState<List<NotificationModel>>>(
      builder: (BuildContext context, state) {
        return PagingContent<NotificationModel, NotificationPagingBloc>(
          onBuildItem: _buildNotificationItem,
          pagingState: state,
        );
      },
    );
  }

  Widget _buildNotificationItem(BuildContext context, NotificationModel model) {
    final navigator = RootRouterDelegate.get();
    return Column(
      children: [
        NotificationItem(
          model: model,
          onCoverImageClick: () {
            switch (model) {
              case AiringNotification():
                navigator.navigateToDetailMedia(model.media.id);
              case FollowNotification():
                navigator.navigateToUserProfile(model.user.id);
              case ActivityNotification():
                navigator.navigateToUserProfile(model.user.id);
              case MediaNotification():
                navigator.navigateToDetailMedia(model.media.id);
              case MediaDeletionNotification():
              // Do nothing.
            }
          },
          onNotificationClick: () {
            switch (model) {
              case AiringNotification():
                navigator.navigateToDetailMedia(model.media.id);
              case MediaNotification():
                navigator.navigateToDetailMedia(model.media.id);
              case ActivityNotification(activity: var activity):
                navigator.navigateToActivityRepliesPage(activity.id);
              case MediaDeletionNotification():
              case FollowNotification():
              // Do nothing.
            }
          },
        ),
        const Divider(),
      ],
    );
  }
}

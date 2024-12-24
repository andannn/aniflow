import 'package:aniflow/app/di/get_it_scope.dart';
import 'package:aniflow/app/routing/root_router_delegate.dart';
import 'package:aniflow/core/common/setting/user_staff_name_language.dart';
import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/core/data/model/staff_and_role_model.dart';
import 'package:aniflow/core/design_system/widget/staff_item.dart';
import 'package:aniflow/core/paging/page_loading_state.dart';
import 'package:aniflow/core/paging/paging_content_widget.dart';
import 'package:aniflow/feature/staff_page/bloc/staff_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StaffListPage extends Page {
  final String animeId;

  const StaffListPage({required this.animeId, super.key, super.onPopInvoked});

  @override
  Route createRoute(BuildContext context) {
    return StaffListRoute(settings: this, animeId: animeId);
  }
}

class StaffListRoute extends PageRoute with MaterialRouteTransitionMixin {
  final String animeId;

  StaffListRoute({required this.animeId, super.settings})
      : super(allowSnapshotting: false);

  @override
  Widget buildContent(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetItScope.of(context).get<StaffPageBloc>(param1: animeId),
      child: const _StaffListPageContent(),
    );
  }

  @override
  bool get maintainState => true;
}

class _StaffListPageContent extends StatelessWidget {
  const _StaffListPageContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StaffPageBloc, PagingState<List<StaffAndRoleModel>>>(
        builder: (context, state) {
      final pagingState = state;
      return Scaffold(
        appBar: AppBar(
          title: Text(context.appLocal.staff),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.maybePop(context);
            },
          ),
        ),
        body: PagingContent<StaffAndRoleModel, StaffPageBloc>(
          pagingState: pagingState,
          gridDelegate: AfConfig.horizonGridDelegate,
          onBuildItem: (context, model) => _buildListItems(
            context,
            model,
            context.read<StaffPageBloc>().userStaffNameLanguage,
          ),
        ),
      );
    });
  }

  Widget _buildListItems(BuildContext context, StaffAndRoleModel model,
      UserStaffNameLanguage language) {
    return SizedBox(
      height: 124,
      child: StaffItem(
        model: model,
        language: language,
        textStyle: Theme.of(context).textTheme.labelMedium,
        onStaffClick: () {
          RootRouterDelegate.get().navigateToDetailStaff(model.staff.id);
        },
      ),
    );
  }
}

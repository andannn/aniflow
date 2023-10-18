import 'package:anime_tracker/core/data/media_information_repository.dart';
import 'package:anime_tracker/core/data/model/staff_and_role_model.dart';
import 'package:anime_tracker/core/design_system/widget/anime_staff_item.dart';
import 'package:anime_tracker/feature/common/page_loading_state.dart';
import 'package:anime_tracker/feature/common/paging_bloc.dart';
import 'package:anime_tracker/feature/common/paging_content_widget.dart';
import 'package:anime_tracker/feature/staff_page/bloc/staff_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StaffListPage extends Page {
  final String animeId;

  const StaffListPage({required this.animeId, super.key});

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
      create: (context) => StaffPageBloc(
        animeId,
        aniListRepository: context.read<MediaInformationRepository>(),
      ),
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
          title: const Text('Staffs'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.maybePop(context);
            },
          ),
        ),
        body: PagingContent(
          pagingState: pagingState,
          onBuildItem: (context, model) => _buildListItems(context, model),
          onRequestNewPage: () {
            context.read<StaffPageBloc>().add(OnRequestLoadPageEvent());
          },
          onRetryLoadPage: () {
            context.read<StaffPageBloc>().add(OnRetryLoadPageEvent());
          },
        ),
      );
    });
  }

  Widget _buildListItems(BuildContext context, StaffAndRoleModel model) {
    return SizedBox(
      height: 124,
      child: StaffItem(
        model: model,
        textStyle: Theme.of(context).textTheme.labelMedium,
        onStaffClick: () {},
      ),
    );
  }
}

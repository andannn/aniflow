import 'package:aniflow/core/common/util/description_item_util.dart';
import 'package:aniflow/core/data/favorite_repository.dart';
import 'package:aniflow/core/data/media_information_repository.dart';
import 'package:aniflow/core/data/model/staff_model.dart';
import 'package:aniflow/core/design_system/widget/af_network_image.dart';
import 'package:aniflow/core/design_system/widget/loading_indicator.dart';
import 'package:aniflow/core/design_system/widget/vertical_animated_scale_switcher.dart';
import 'package:aniflow/feature/detail_staff/bloc/detail_staff_bloc.dart';
import 'package:aniflow/feature/detail_staff/bloc/detail_staff_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class DetailStaffPage extends Page {
  final String id;

  const DetailStaffPage({required this.id, super.key});

  @override
  Route createRoute(BuildContext context) {
    return DetailStaffRoute(settings: this, id: id);
  }
}

class DetailStaffRoute extends PageRoute with MaterialRouteTransitionMixin {
  final String id;

  DetailStaffRoute({required this.id, super.settings})
      : super(allowSnapshotting: false);

  @override
  Widget buildContent(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailStaffBloc(
        staffId: id,
        mediaRepository: context.read<MediaInformationRepository>(),
        favoriteRepository: context.read<FavoriteRepository>(),
      ),
      child: const _DetailStaffContent(),
    );
  }

  @override
  bool get maintainState => true;
}

class _DetailStaffContent extends StatelessWidget {
  const _DetailStaffContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailStaffBloc, DetailStaffState>(
        builder: (BuildContext context, state) {
      final colorScheme = Theme.of(context).colorScheme;
      final staff = state.staffModel;
      final isLoading = state.isLoading;

      if (staff == null) {
        return const SizedBox();
      }

      final isFavourite = staff.isFavourite;
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(staff.name),
          actions: [
            isLoading
                ? LoadingIndicator(isLoading: isLoading)
                : IconButton(
                    onPressed: () {
                      context.read<DetailStaffBloc>().add(OnToggleLike());
                    },
                    icon: isFavourite
                        ? const Icon(Icons.favorite, color: Colors.red)
                        : const Icon(Icons.favorite_outline),
                  ),
            const SizedBox(width: 10),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: FractionallySizedBox(
                  widthFactor: 0.65,
                  child: Card(
                    elevation: 0,
                    color: colorScheme.surfaceVariant,
                    clipBehavior: Clip.antiAlias,
                    child: AFNetworkImage(imageUrl: staff.image),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: _buildDescriptionSection(context, staff),
              ),
              const SliverPadding(padding: EdgeInsets.only(top: 48)),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildDescriptionSection(
      BuildContext context, StaffModel staff) {
    final textTheme = Theme.of(context).textTheme;
    final items = staff.createDescriptionItem(context);
    final description = staff.description ?? '';
    return VerticalScaleSwitcher(
      visible: items.isNotEmpty || description.isNotEmpty,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...items.map(
            (item) => RichText(
              text: TextSpan(
                text: item.key,
                style: textTheme.titleSmall,
                children: [
                  TextSpan(
                    text: item.value,
                    style: textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
          HtmlWidget(description)
        ],
      ),
    );
  }
}

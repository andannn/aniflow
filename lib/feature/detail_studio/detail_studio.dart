import 'package:aniflow/app/aniflow_router/ani_flow_router_delegate.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/data/model/media_title_model.dart';
import 'package:aniflow/core/design_system/widget/af_network_image.dart';
import 'package:aniflow/core/design_system/widget/loading_dummy_scaffold.dart';
import 'package:aniflow/core/design_system/widget/loading_indicator.dart';
import 'package:aniflow/core/paging/paging_content_widget.dart';
import 'package:aniflow/core/shared_preference/aniflow_preferences.dart';
import 'package:aniflow/feature/detail_studio/bloc/detail_studio_bloc.dart';
import 'package:aniflow/feature/detail_studio/bloc/detail_studio_state.dart';
import 'package:aniflow/feature/detail_studio/bloc/studio_contents_paging_bloc.dart';
import 'package:aniflow/main.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailStudioPage extends Page {
  final String id;

  const DetailStudioPage({required this.id, super.key});

  @override
  Route createRoute(BuildContext context) {
    return DetailStudioRoute(settings: this, id: id);
  }
}

class DetailStudioRoute extends PageRoute with MaterialRouteTransitionMixin {
  final String id;

  DetailStudioRoute({required this.id, super.settings})
      : super(allowSnapshotting: false);

  @override
  Widget buildContent(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => getIt.get<DetailStudioBloc>(),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              getIt.get<StudioContentsPagingBloc>(),
        ),
      ],
      child: const _DetailStudioContent(),
    );
  }

  @override
  bool get maintainState => true;
}

class _DetailStudioContent extends StatelessWidget {
  const _DetailStudioContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailStudioBloc, DetailStudioState>(
      builder: (BuildContext context, state) {
        // final colorScheme = Theme.of(context).colorScheme;
        final studio = state.studioModel;
        final isLoading = state.isLoading;
        if (studio == null) {
          return const LoadingDummyScaffold();
        }

        final pagingState = context.watch<StudioContentsPagingBloc>().state;
        final isFavourite = studio.isFavourite;
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(studio.name ?? ''),
            actions: [
              isLoading
                  ? LoadingIndicator(isLoading: isLoading)
                  : IconButton(
                      onPressed: () {
                        context.read<DetailStudioBloc>().add(OnToggleLike());
                      },
                      icon: isFavourite
                          ? const Icon(Icons.favorite, color: Colors.red)
                          : const Icon(Icons.favorite_outline),
                    ),
              const SizedBox(width: 10),
            ],
          ),
          body: CustomScrollView(
            slivers: [
              const SliverPadding(padding: EdgeInsets.only(top: 12)),
              for (final widget in _buildYearAndMediaContentWidgets(
                context,
                mediaGroupList: pagingState.data.mediaGroupList,
                onMediaClick: (String id) => AfRouterDelegate.of(context)
                    .backStack
                    .navigateToDetailMedia(id),
              ))
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  sliver: widget,
                ),
              buildSliverPagingVisibilityDetector<MediaModel,
                  StudioContentsPagingBloc>(
                context: context,
                pagingState: pagingState,
              ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _buildYearAndMediaContentWidgets(
    BuildContext context, {
    required List<MediaItemsWithYear> mediaGroupList,
    required Function(String id) onMediaClick,
  }) {
    final widgetList = mediaGroupList
        .map(
          (e) => _buildItemsWithSeasonYearSection(
            context,
            e: e,
            onMediaClick: onMediaClick,
          ),
        )
        .toList();
    return widgetList.flattened.toList();
  }

  List<Widget> _buildItemsWithSeasonYearSection(BuildContext context,
      {required MediaItemsWithYear e,
      required Function(String id) onMediaClick}) {
    return [
      SliverPadding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        sliver: SliverToBoxAdapter(
          child: Text(
            e.year?.toString() ?? 'TBA',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ),
      SliverGrid.builder(
        itemCount: e.items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 3.0 / 6.2,
        ),
        itemBuilder: (context, index) => _buildMediaItem(
          context,
          item: e.items[index],
          onMediaClick: onMediaClick,
        ),
      )
    ];
  }

  Widget _buildMediaItem(BuildContext context,
      {required MediaModel item, required Function(String id) onMediaClick}) {
    final titleLanguage =
        AniFlowPreferences().aniListSettings.value.userTitleLanguage;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => onMediaClick.call(item.id),
          child: Card(
            clipBehavior: Clip.antiAlias,
            child: AspectRatio(
              aspectRatio: 3.0 / 4,
              child: Stack(
                children: [
                  SizedBox.expand(
                    child: AFNetworkImage(
                      imageUrl: item.coverImage?.large ?? '',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: AutoSizeText(item.title?.getTitle(titleLanguage) ?? ''),
        ),
      ],
    );
  }
}

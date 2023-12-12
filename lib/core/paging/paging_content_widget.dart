import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/design_system/widget/page_bottom_state_indicator.dart';
import 'package:aniflow/core/paging/page_loading_state.dart';
import 'package:aniflow/core/paging/paging_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visibility_detector/visibility_detector.dart';

class PagingContent<MODEL,
        BLOC extends Bloc<PagingEvent<MODEL>, PagingState<List<MODEL>>>>
    extends StatelessWidget {
  const PagingContent({
    required this.onBuildItem,
    required this.pagingState,
    super.key,
    this.gridDelegate,
  });

  final Widget Function(BuildContext, MODEL) onBuildItem;

  final PagingState<List<MODEL>> pagingState;
  final SliverGridDelegate? gridDelegate;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      cacheExtent: AfConfig.defaultCatchExtend,
      slivers: [
        ...buildSliverItemsSection<MODEL, BLOC>(
          context: context,
          gridDelegate: gridDelegate,
          pagingState: pagingState,
          onBuildItem: onBuildItem,
        ),
      ],
    );
  }
}

List<Widget> buildSliverItemsSection<MODEL,
    BLOC extends Bloc<PagingEvent<MODEL>, PagingState<List<MODEL>>>>({
  required BuildContext context,
  required PagingState<List<MODEL>> pagingState,
  SliverGridDelegate? gridDelegate,
  required Widget Function(BuildContext, MODEL) onBuildItem,
}) {
  final models = pagingState.data;
  final itemCount = pagingState.data.length;

  return [
    SliverPadding(
      padding: const EdgeInsets.all(4),
      sliver: gridDelegate != null
          ? SliverGrid.builder(
              itemCount: itemCount,
              gridDelegate: gridDelegate,
              itemBuilder: (context, index) {
                return onBuildItem(context, models[index]);
              },
            )
          : SliverList.builder(
              itemCount: itemCount,
              itemBuilder: (context, index) {
                return onBuildItem(context, models[index]);
              },
            ),
    ),
    buildSliverPagingVisibilityDetector<MODEL, BLOC>(
      context: context,
      pagingState: pagingState,
    ),
  ];
}

Widget buildSliverPagingVisibilityDetector<MODEL,
    BLOC extends Bloc<PagingEvent<MODEL>, PagingState<List<MODEL>>>>({
  required BuildContext context,
  required PagingState<List<MODEL>> pagingState,
}) {
  final needDetectNewPageRequest = pagingState is PageReady;
  return SliverVisibility(
    visible: needDetectNewPageRequest,
    // show page loading detector widget.
    sliver: SliverToBoxAdapter(
      child: _RequestPageLoadingDetector(
        onRequestNewPage: () {
          context.read<BLOC>().add(OnRequestLoadPageEvent());
        },
      ),
    ),
    replacementSliver: SliverToBoxAdapter(
      child: _buildPageBottomBar(
        context,
        pagingState,
        () {
          context.read<BLOC>().add(OnRetryLoadPageEvent());
        },
      ),
    ),
  );
}

Widget _buildPageBottomBar(
    BuildContext context, PagingState pagingState, VoidCallback onRetryLoad) {
  return SizedBox.square(
    dimension: 64,
    child: Center(
      child: buildPageBottomWidget(
        context: context,
        pagingState: pagingState,
        onRetryLoadPage: onRetryLoad,
        onLoadMore: () {},
      ),
    ),
  );
}

class _RequestPageLoadingDetector extends StatelessWidget {
  const _RequestPageLoadingDetector({required this.onRequestNewPage});

  final VoidCallback onRequestNewPage;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      onVisibilityChanged: (VisibilityInfo info) {
        final fraction = info.visibleFraction;
        if (fraction > 0.9) {
          onRequestNewPage.call();
        }
      },
      key: const Key('Visibility detector key'),
      child: const SizedBox.square(dimension: 64),
    );
  }
}

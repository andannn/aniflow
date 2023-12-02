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
    final animeList = pagingState.data;
    final itemCount = pagingState.data.length;
    final needDetectNewPageRequest = pagingState is PageReady;

    return CustomScrollView(
      cacheExtent: Config.defaultCatchExtend,
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(4),
          sliver: gridDelegate != null
              ? SliverGrid.builder(
                  itemCount: itemCount,
                  gridDelegate: gridDelegate!,
                  itemBuilder: (context, index) {
                    return onBuildItem(context, animeList[index]);
                  },
                )
              : SliverList.builder(
                  itemCount: itemCount,
                  itemBuilder: (context, index) {
                    return onBuildItem(context, animeList[index]);
                  },
                ),
        ),
        SliverVisibility(
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
            child: _buildPageBottomBar(context, pagingState),
          ),
        ),
      ],
    );
  }

  Widget _buildPageBottomBar(BuildContext context, PagingState pagingState) {
    return SizedBox.square(
      dimension: 64,
      child: Center(
        child: buildPageBottomWidget(
          context: context,
          pagingState: pagingState,
          onRetryLoadPage: () {
            context.read<BLOC>().add(OnRetryLoadPageEvent());
          },
          onLoadMore: () {},
        ),
      ),
    );
  }
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

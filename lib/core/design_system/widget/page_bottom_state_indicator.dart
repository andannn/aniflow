import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/core/design_system/widget/loading_indicator.dart';
import 'package:aniflow/core/paging/page_loading_state.dart';
import 'package:flutter/material.dart';

Widget buildPageBottomWidget(
        {required BuildContext context,
        required PagingState pagingState,
        required VoidCallback onRetryLoadPage,
        required VoidCallback onLoadMore}) =>
    switch (pagingState) {
      PageInit() => const SizedBox(),
      PageLoading() => const SizedBox.square(
          dimension: 36,
          child: LoadingIndicator(isLoading: true),
        ),
      PageReady() => const SizedBox(),
      PageLoadReachEnd() => Column(
          children: [
            const Divider(),
            Opacity(
              opacity: 0.5,
              child: Text(
                context.appLocal.allPageLoaded,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      PageLoadingError() => TextButton.icon(
          onPressed: onRetryLoadPage,
          icon: const Icon(Icons.refresh),
          label: Text(context.appLocal.retry),
        ),
    };

Widget buildPageSectionWidget(
        {required BuildContext context,
        required PagingState pagingState,
        required VoidCallback onRetryLoadPage,
        required VoidCallback onLoadMore}) =>
    switch (pagingState) {
      PageInit() => const SizedBox(),
      PageLoading() => TextButton(
          onPressed: null,
          child: Text(context.materialLocal.moreButtonTooltip),
        ),
      PageReady() => TextButton(
          onPressed: onLoadMore,
          child: Text(context.materialLocal.moreButtonTooltip),
        ),
      PageLoadReachEnd() => const Center(child: Divider()),
      PageLoadingError() => TextButton.icon(
          onPressed: onRetryLoadPage,
          icon: const Icon(Icons.refresh),
          label: Text(context.appLocal.retry),
        ),
    };

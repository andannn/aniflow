import 'package:aniflow/app/local/ani_flow_localizations.dart';
import 'package:aniflow/core/design_system/widget/loading_indicator.dart';
import 'package:aniflow/feature/common/page_loading_state.dart';
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
      PageReady() => TextButton(
        onPressed: onLoadMore,
        child: const Text('Load more'),
      ),
      PageLoadReachEnd() => Column(
        children: [
          const Divider(),
          Opacity(
            opacity: 0.5,
            child: Text(
              AFLocalizations.of(context).allPageLoaded,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
      PageLoadingError() => TextButton.icon(
        onPressed: onRetryLoadPage,
        icon: const Icon(Icons.refresh),
        label: Text(AFLocalizations.of(context).retry),
      ),
    };

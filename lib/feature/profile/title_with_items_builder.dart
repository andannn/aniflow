import 'package:aniflow/core/design_system/widget/vertical_animated_scale_switcher.dart';
import 'package:aniflow/feature/common/page_loading_state.dart';
import 'package:flutter/material.dart';

List<Widget> buildTitleBarWithContent({
  required BuildContext context,
  required String title,
  PagingState? state,
  required Function(BuildContext, dynamic item) onBuildItem,
  VoidCallback? onMoreClick,
}) {
  if (state == null) return [const SliverToBoxAdapter()];

  List items = state.data ?? [];

  if (items.isEmpty) return [const SliverToBoxAdapter()];

  return [
    SliverToBoxAdapter(
      child: VerticalScaleSwitcher(
        visible: items.isNotEmpty,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: Row(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Expanded(child: SizedBox()),
              TextButton(onPressed: onMoreClick, child: const Text('More'))
            ],
          ),
        ),
      ),
    ),
    SliverGrid.builder(
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 3.0 / 5.2,
      ),
      itemBuilder: (context, index) => onBuildItem(context, items[index]),
    ),
  ];
}

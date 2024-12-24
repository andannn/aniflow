import 'package:aniflow/core/common/util/global_static_constants.dart';
import 'package:aniflow/core/common/util/string_resource_util.dart';
import 'package:aniflow/core/design_system/widget/vertical_animated_scale_switcher.dart';
import 'package:aniflow/core/paging/page_loading_state.dart';
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
      child: AnimatedScaleSwitcher(
        visible: items.isNotEmpty,
        builder: () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: Row(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Expanded(child: SizedBox()),
              TextButton(
                  onPressed: onMoreClick,
                  child: Text(context.materialLocal.moreButtonTooltip))
            ],
          ),
        ),
      ),
    ),
    SliverGrid.builder(
      itemCount: items.length,
      gridDelegate: AfConfig.commonGridDelegate,
      itemBuilder: (context, index) => onBuildItem(context, items[index]),
    ),
  ];
}

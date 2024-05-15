import 'package:aniflow/app/routing/root_router_delegate.dart';
import 'package:aniflow/core/data/model/studio_model.dart';
import 'package:aniflow/core/paging/page_loading_state.dart';
import 'package:aniflow/core/paging/paging_content_widget.dart';
import 'package:aniflow/feature/search/paging/studio_search_result_paging_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudioSearchResultPagingContent extends StatelessWidget {
  const StudioSearchResultPagingContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudioSearchResultPagingBloc,
        PagingState<List<StudioModel>>>(
      builder: (context, state) {
        return PagingContent<StudioModel, StudioSearchResultPagingBloc>(
          onBuildItem: (context, model) => _buildListItems(
            context,
            model,
            onClick: () {
              RootRouterDelegate.get().navigateToDetailStudio(model.id);
            },
          ),
          pagingState: state,
        );
      },
    );
  }

  Widget _buildListItems(BuildContext context, StudioModel model,
      {required Function() onClick}) {
    final colorScheme = Theme.of(context).colorScheme;
    final surfaceTextColor = colorScheme.onSurfaceVariant;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      elevation: 0,
      color: colorScheme.surfaceVariant,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onClick,
        child: SizedBox(
          height: 65,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 16),
              Expanded(
                flex: 1,
                child: Text(
                  model.name ?? '',
                  style: textTheme.titleMedium?.copyWith(color: surfaceTextColor),
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

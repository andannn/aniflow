import 'package:aniflow/app/routing/root_router_delegate.dart';
import 'package:aniflow/core/data/model/user_model.dart';
import 'package:aniflow/core/design_system/widget/af_network_image.dart';
import 'package:aniflow/core/paging/page_loading_state.dart';
import 'package:aniflow/core/paging/paging_content_widget.dart';
import 'package:aniflow/feature/search/paging/user_search_result_paging_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserSearchResultPagingContent extends StatelessWidget {
  const UserSearchResultPagingContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserSearchResultPagingBloc,
        PagingState<List<UserModel>>>(
      builder: (context, state) {
        return PagingContent<UserModel, UserSearchResultPagingBloc>(
          onBuildItem: (context, model) => _buildListItems(
            context,
            model,
            onClick: () {
              RootRouterDelegate.get().navigateToUserProfile(model.id);
            },
          ),
          pagingState: state,
        );
      },
    );
  }

  Widget _buildListItems(BuildContext context, UserModel model,
      {required Function() onClick}) {
    final colorScheme = Theme.of(context).colorScheme;
    final surfaceTextColor = colorScheme.onSurfaceVariant;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      elevation: 0,
      color: colorScheme.surfaceContainerHighest,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onClick,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox.square(
              dimension: 85,
              child: AFNetworkImage(
                imageUrl: model.avatar,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 1,
              child: Text(
                model.name,
                style: textTheme.titleMedium?.copyWith(color: surfaceTextColor),
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

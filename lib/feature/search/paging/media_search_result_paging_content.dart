import 'package:aniflow/app/routing/root_router_delegate.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/design_system/widget/search_anime_item.dart';
import 'package:aniflow/core/paging/page_loading_state.dart';
import 'package:aniflow/core/paging/paging_content_widget.dart';
import 'package:aniflow/feature/search/bloc/search_bloc.dart';
import 'package:aniflow/feature/search/paging/media_search_result_paging_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MediaSearchResultPagingContent extends StatelessWidget {
  const MediaSearchResultPagingContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MediaSearchResultPagingBloc,
        PagingState<List<MediaModel>>>(
      builder: (context, state) {
        return PagingContent<MediaModel, MediaSearchResultPagingBloc>(
          onBuildItem: _buildListItems,
          pagingState: state,
        );
      },
    );
  }

  Widget _buildListItems(BuildContext context, MediaModel model) {
    final userTitleLanguage = context
        .read<SearchBloc>()
        .userDataRepository
        .userTitleLanguage;
    return SearchMediaItem(
      userTitleLanguage: userTitleLanguage,
      model: model,
      onClick: () {
        RootRouterDelegate.get().navigateToDetailMedia(model.id);
      },
    );
  }
}

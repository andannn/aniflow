import 'package:aniflow/app/aniflow_router/ani_flow_router_delegate.dart';
import 'package:aniflow/core/common/definitions/media_type.dart';
import 'package:aniflow/core/data/model/media_model.dart';
import 'package:aniflow/core/design_system/widget/search_anime_item.dart';
import 'package:aniflow/core/paging/page_loading_state.dart';
import 'package:aniflow/core/paging/paging_content_widget.dart';
import 'package:aniflow/feature/anime_search/bloc/anime_search_bloc.dart';
import 'package:aniflow/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends Page {
  const SearchPage({super.key});

  @override
  Route createRoute(BuildContext context) {
    return SearchPageRoute(settings: this);
  }
}

class SearchPageRoute extends PageRoute with MaterialRouteTransitionMixin {
  SearchPageRoute({super.settings}) : super(allowSnapshotting: false);

  @override
  Widget buildContent(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => getIt.get<SearchPageBloc>(),
      child: const _MediaSearchPageContent(),
    );
  }

  @override
  bool get maintainState => true;
}

class _MediaSearchPageContent extends StatelessWidget {
  const _MediaSearchPageContent();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchPageBloc, PagingState<List<MediaModel>>>(
      builder: (context, state) {
        final mediaType =
            context.read<SearchPageBloc>().mediaType ?? MediaType.anime;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
            title: _buildSearchArea(context, mediaType),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: PagingContent<MediaModel, SearchPageBloc>(
              pagingState: state,
              onBuildItem: (context, model) => _buildListItems(context, model),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSearchArea(BuildContext context, MediaType type) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextField(
        autofocus: true,
        onSubmitted: (content) {
          if (content.isNotEmpty) {
            context
                .read<SearchPageBloc>()
                .add(OnSearchStringCommit(searchString: content));
          }
        },
        decoration: InputDecoration(
          labelText: type == MediaType.anime ? 'Search Anime' : 'Search Manga',
        ),
      ),
    );
  }

  Widget _buildListItems(BuildContext context, MediaModel model) {
    final userTitleLanguage =
        context.read<SearchPageBloc>().preferences.userTitleLanguage;
    return SearchAnimeItem(
      userTitleLanguage: userTitleLanguage,
      model: model,
      onClick: () {
        AfRouterDelegate.of(context).backStack.navigateToDetailMedia(model.id);
      },
    );
  }
}

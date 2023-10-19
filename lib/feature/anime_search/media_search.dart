import 'package:anime_tracker/app/navigation/ani_flow_router.dart';
import 'package:anime_tracker/core/data/model/media_model.dart';
import 'package:anime_tracker/core/data/search_repository.dart';
import 'package:anime_tracker/core/design_system/widget/search_anime_item.dart';
import 'package:anime_tracker/feature/anime_search/bloc/anime_search_bloc.dart';
import 'package:anime_tracker/feature/common/page_loading_state.dart';
import 'package:anime_tracker/feature/common/paging_bloc.dart';
import 'package:anime_tracker/feature/common/paging_content_widget.dart';
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
  SearchPageRoute({super.settings}): super(allowSnapshotting: false);

  @override
  Widget buildContent(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SearchPageBloc(
        searchRepository: context.read<SearchRepository>(),
      ),
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
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
            title:_buildSearchArea(context) ,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: PagingContent(
              pagingState: state,
              onBuildItem: (context, model) =>
                  _buildListItems(context, model),
              onRequestNewPage: () {
                context.read<SearchPageBloc>().add(OnRequestLoadPageEvent());
              },
              onRetryLoadPage: () {
                context.read<SearchPageBloc>().add(OnRetryLoadPageEvent());
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildSearchArea(BuildContext context) {
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
        decoration: const InputDecoration(
          labelText: 'Search Anime',
        ),
      ),
    );
  }

  Widget _buildListItems(BuildContext context, MediaModel model) {
    return SizedBox(
      height: 110,
      child: SearchAnimeItem(
        model: model,
        onClick: () {
          AFRouterDelegate.of(context).navigateToDetailAnime(model.id);
        },
      ),
    );
  }
}
